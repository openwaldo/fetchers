// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package config

import (
	"bufio"
	"fmt"
	"io"
	"regexp"
	"sort"
	"strings"
)

var (
	sectionPattern  = regexp.MustCompile(`^\[([a-z][a-z0-9-]*)(?:\s+"([a-z0-9._-]+)")?\]$`)
	idPattern       = regexp.MustCompile(`^[a-z0-9][a-z0-9._-]*$`)
	sha256Pattern   = regexp.MustCompile(`^[a-f0-9]{64}$`)
	commitPattern   = regexp.MustCompile(`^[a-f0-9]{40}$`)
	languagePattern = regexp.MustCompile(`^[A-Za-z]{2,8}(?:-[A-Za-z0-9]{1,8})*$`)
)

type File struct {
	Corpus  Section
	Sources []Section
	Fetches []Section
	Inputs  []Section
}

type Section struct {
	Kind   string
	Name   string
	Values map[string][]string
	Line   int
}

func Parse(reader io.Reader) (File, error) {
	var result File
	var current *Section
	scanner := bufio.NewScanner(reader)
	scanner.Buffer(make([]byte, 64<<10), 4<<20)
	line := 0
	for scanner.Scan() {
		line++
		value := strings.TrimSpace(scanner.Text())
		if value == "" || strings.HasPrefix(value, "#") || strings.HasPrefix(value, ";") {
			continue
		}
		if strings.HasPrefix(value, "[") {
			match := sectionPattern.FindStringSubmatch(value)
			if match == nil {
				return File{}, fmt.Errorf("line %d: invalid section header", line)
			}
			section := Section{Kind: match[1], Name: match[2], Values: map[string][]string{}, Line: line}
			switch section.Kind {
			case "corpus":
				if result.Corpus.Values != nil || section.Name != "" {
					return File{}, fmt.Errorf("line %d: exactly one unnamed corpus section is allowed", line)
				}
				result.Corpus = section
				current = &result.Corpus
			case "source":
				result.Sources = append(result.Sources, section)
				current = &result.Sources[len(result.Sources)-1]
			case "fetch":
				result.Fetches = append(result.Fetches, section)
				current = &result.Fetches[len(result.Fetches)-1]
			case "input":
				result.Inputs = append(result.Inputs, section)
				current = &result.Inputs[len(result.Inputs)-1]
			default:
				return File{}, fmt.Errorf("line %d: unknown section %q", line, section.Kind)
			}
			continue
		}
		if current == nil {
			return File{}, fmt.Errorf("line %d: field appears before a section", line)
		}
		key, field, found := strings.Cut(value, "=")
		key, field = strings.TrimSpace(key), strings.TrimSpace(field)
		if !found || key == "" || key != strings.ToLower(key) || strings.ContainsAny(key, " \t") {
			return File{}, fmt.Errorf("line %d: invalid field", line)
		}
		if field == "" {
			return File{}, fmt.Errorf("line %d: %s must not be empty", line, key)
		}
		current.Values[key] = append(current.Values[key], field)
	}
	if err := scanner.Err(); err != nil {
		return File{}, err
	}
	if err := result.Validate(); err != nil {
		return File{}, err
	}
	return result, nil
}

func (file File) Validate() error {
	if file.Corpus.Values == nil {
		return fmt.Errorf("corpus section is required")
	}
	if err := validateFields(file.Corpus, fields("id title description"), nil); err != nil {
		return err
	}
	if !idPattern.MatchString(file.Corpus.One("id")) {
		return fmt.Errorf("corpus id %q is invalid", file.Corpus.One("id"))
	}
	if len(file.Sources) == 0 || len(file.Fetches) == 0 {
		return fmt.Errorf("at least one source and fetch section are required")
	}
	multiple := len(file.Sources) > 1
	sources := map[string]bool{}
	for _, source := range file.Sources {
		if multiple && source.Name == "" {
			return fmt.Errorf("multi-source corpus requires named source sections")
		}
		if !multiple && source.Name != "" {
			return fmt.Errorf("single-source corpus requires an unnamed source section")
		}
		id := file.Corpus.One("id")
		if multiple {
			id = source.Name
		}
		if !idPattern.MatchString(id) || sources[id] {
			return fmt.Errorf("invalid or duplicate source id %q", id)
		}
		sources[id] = true
		allowed := fields("name url category license license-declaration version license-url content-from content-to selection copyrighted machine-generated personal-data acquisition-basis")
		lists := fields("content-type language programming-language")
		if err := validateFields(source, allowed, lists); err != nil {
			return err
		}
		for _, required := range []string{"name", "url", "category", "license", "license-declaration"} {
			if source.One(required) == "" {
				return fmt.Errorf("source %q requires %s", id, required)
			}
		}
		if len(source.Values["language"]) == 0 {
			return fmt.Errorf("source %q requires language (use a BCP 47 tag, mul for multilingual, or und if unknown)", id)
		}
		for _, language := range source.Values["language"] {
			if !languagePattern.MatchString(language) {
				return fmt.Errorf("source %q language %q is not a BCP 47 tag (use mul for multilingual or und if unknown)", id, language)
			}
		}
		if !fields("public-dataset commercially-licensed private-third-party web-crawl user-data synthetic other")[source.One("category")] {
			return fmt.Errorf("source %q has unsupported category %q", id, source.One("category"))
		}
		for _, field := range []string{"copyrighted", "machine-generated", "personal-data"} {
			value := source.One(field)
			if value != "" && value != "yes" && value != "no" && value != "unknown" {
				return fmt.Errorf("source %q %s must be yes, no, or unknown", id, field)
			}
		}
	}
	for _, fetch := range file.Fetches {
		if len(file.Fetches) > 1 && fetch.Name == "" {
			return fmt.Errorf("multiple fetches require named fetch sections")
		}
		if fetch.One("fetcher") == "" || fetch.One("url") == "" || fetch.One("estimated-size") == "" {
			return fmt.Errorf("fetch section at line %d requires fetcher, url, and estimated-size", fetch.Line)
		}
		if multiple {
			if !sources[fetch.One("source")] {
				return fmt.Errorf("fetch %q references unknown source %q", fetch.Name, fetch.One("source"))
			}
		} else if fetch.One("source") != "" {
			return fmt.Errorf("single-source fetch must not set source")
		}
		if err := validateFetch(fetch); err != nil {
			return err
		}
	}
	seenInputs := map[string]bool{}
	for _, input := range file.Inputs {
		id := input.Name
		if !multiple && input.Name != "" {
			return fmt.Errorf("single-source input must be unnamed")
		}
		if id != "" && !sources[id] {
			return fmt.Errorf("input references unknown source %q", id)
		}
		if seenInputs[id] {
			return fmt.Errorf("duplicate input declaration %q", id)
		}
		seenInputs[id] = true
		allowed := fields("format type on-empty nul id date language license source context response role content tools tree-root replies rank missing-rank assistant-role start-pattern end-pattern on-malformed source-prefix")
		lists := fields("text text-fallback meta exclude")
		if err := validateFields(input, allowed, lists); err != nil {
			return err
		}
		if err := validateInput(input); err != nil {
			label := id
			if label == "" {
				label = "default"
			}
			return fmt.Errorf("input %q: %w", label, err)
		}
	}
	for source := range sources {
		if _, ok := file.Input(source); !ok {
			return fmt.Errorf("source %q requires an input declaration with format", source)
		}
	}
	return nil
}

func validateInput(section Section) error {
	format := section.One("format")
	if format == "" {
		return fmt.Errorf("format is required")
	}
	switch format {
	case "text", "markdown", "mbox":
	case "json", "jsonl", "parquet", "xml":
		if section.One("type") == "" {
			return fmt.Errorf("format %s requires type", format)
		}
	default:
		return fmt.Errorf("unsupported format %q; use text, markdown, mbox, json, jsonl, parquet, or xml", format)
	}
	if section.One("type") == "" {
		if err := validateFields(section, fields("format"), nil); err != nil {
			return err
		}
		return nil
	}
	typeName := section.One("type")
	profileFields := map[string]string{
		"record-map":               "format type on-empty nul text text-fallback id date language license source meta",
		"dialogue-pair":            "format type on-empty nul text text-fallback id date language license source context response meta",
		"chat-messages":            "format type on-empty nul id date language license source role content tools meta",
		"ranked-conversation-tree": "format type nul id date language license tree-root replies text rank missing-rank role assistant-role",
		"bounded-text":             "format type on-empty start-pattern end-pattern",
		"xml-record":               "format type text id date language license source meta exclude on-malformed source-prefix",
	}
	allowed, knownType := profileFields[typeName]
	if !knownType {
		return fmt.Errorf("unsupported type %q; omit type and mapping fields for text, Markdown, or mbox", typeName)
	}
	if err := validateFields(section, fields(allowed), fields("text text-fallback meta exclude")); err != nil {
		return err
	}
	if value := section.One("on-empty"); value != "" && value != "error" && value != "skip" {
		return fmt.Errorf("on-empty must be error or skip")
	}
	if value := section.One("nul"); value != "" && value != "error" && value != "space" {
		return fmt.Errorf("nul must be error or space")
	}
	if value := section.One("missing-rank"); value != "" && value != "source-order" {
		return fmt.Errorf("missing-rank must be source-order")
	}
	if value := section.One("on-malformed"); value != "" && value != "error" && value != "skip" {
		return fmt.Errorf("on-malformed must be error or skip")
	}
	if typeName == "bounded-text" && format != "text" && format != "markdown" {
		return fmt.Errorf("type bounded-text requires format text or markdown")
	}
	if typeName == "xml-record" && format != "xml" {
		return fmt.Errorf("type xml-record requires format xml")
	}
	if typeName != "bounded-text" && typeName != "xml-record" && format != "json" && format != "jsonl" && format != "parquet" {
		return fmt.Errorf("type %s requires format json, jsonl, or parquet", typeName)
	}
	require := func(names ...string) error {
		for _, name := range names {
			if section.One(name) == "" {
				return fmt.Errorf("type %s requires %s", section.One("type"), name)
			}
		}
		return nil
	}
	requireText := func() error {
		if len(section.Values["text"]) == 0 {
			return fmt.Errorf("type %s requires text", section.One("type"))
		}
		return nil
	}
	switch section.One("type") {
	case "record-map":
		return requireText()
	case "dialogue-pair":
		if err := requireText(); err != nil {
			return err
		}
		return require("response")
	case "chat-messages":
		return require("role", "content")
	case "ranked-conversation-tree":
		if err := requireText(); err != nil {
			return err
		}
		return require("replies", "rank")
	case "bounded-text":
		return require("start-pattern", "end-pattern")
	case "xml-record":
		return requireText()
	default:
		panic("validated input type was not handled")
	}
}

func validateFetch(section Section) error {
	common := fields("fetcher url estimated-size source sha256 revision ref prefix suffix path selection manifest manifest-sha256 year list base-url reporters limit count language ids exclude-ids style")
	lists := fields("pathspec epoch checksum artifact")
	if err := validateFields(section, common, lists); err != nil {
		return err
	}
	if checksum := section.One("sha256"); checksum != "" && !sha256Pattern.MatchString(checksum) {
		return fmt.Errorf("fetch %q sha256 must be 64 lowercase hexadecimal characters", section.Name)
	}
	switch section.One("fetcher") {
	case "http":
	case "git":
		if section.One("revision") == "" {
			return fmt.Errorf("git fetch %q requires revision", section.Name)
		}
		if !commitPattern.MatchString(section.One("revision")) {
			return fmt.Errorf("git fetch %q revision must be a full 40-character lowercase commit", section.Name)
		}
	case "huggingface":
		if err := requireFetch(section, "revision", "suffix"); err != nil {
			return err
		}
	case "public-inbox":
		if err := requireFetch(section, "base-url", "list", "year"); err != nil {
			return err
		}
		if len(section.Values["epoch"]) == 0 {
			return fmt.Errorf("public-inbox fetch %q requires epoch", section.Name)
		}
		for _, value := range section.Values["epoch"] {
			epoch, commit, found := strings.Cut(value, ":")
			if !found || epoch == "" || !commitPattern.MatchString(commit) {
				return fmt.Errorf("public-inbox fetch %q epoch must be NUMBER:40_CHARACTER_COMMIT", section.Name)
			}
		}
	case "monthly-mbox":
		if err := requireFetch(section, "base-url", "list", "year", "style"); err != nil {
			return err
		}
		if len(section.Values["checksum"]) != 12 {
			return fmt.Errorf("monthly-mbox fetch %q requires twelve checksums", section.Name)
		}
		for _, checksum := range section.Values["checksum"] {
			if !sha256Pattern.MatchString(checksum) {
				return fmt.Errorf("monthly-mbox fetch %q checksums must be 64 lowercase hexadecimal characters", section.Name)
			}
		}
	case "hyperkitty":
		if err := requireFetch(section, "base-url", "list", "manifest", "manifest-sha256"); err != nil {
			return err
		}
		if !sha256Pattern.MatchString(section.One("manifest-sha256")) {
			return fmt.Errorf("hyperkitty fetch %q manifest-sha256 must be 64 lowercase hexadecimal characters", section.Name)
		}
	case "gutenberg":
		if err := requireFetch(section, "selection"); err != nil {
			return err
		}
	case "cap":
		if section.One("selection") == "" && section.One("reporters") == "" {
			return fmt.Errorf("cap fetch %q requires selection or reporters", section.Name)
		}
	case "zip":
		if err := requireFetch(section, "suffix"); err != nil {
			return err
		}
		if !strings.HasPrefix(section.One("url"), "local:") {
			return fmt.Errorf("zip fetch %q URL must use local:", section.Name)
		}
	case "sourcehut":
		if err := requireFetch(section, "sha256"); err != nil {
			return err
		}
	case "http-set":
		if len(section.Values["artifact"]) == 0 {
			return fmt.Errorf("HTTP-set fetch %q requires artifact", section.Name)
		}
		for _, artifact := range section.Values["artifact"] {
			rawURL, remainder, found := strings.Cut(artifact, "|")
			name, checksum, foundChecksum := strings.Cut(remainder, "|")
			if !found || !foundChecksum || rawURL == "" || name == "" || !sha256Pattern.MatchString(checksum) {
				return fmt.Errorf("HTTP-set fetch %q artifact must be URL|NAME|64_CHARACTER_SHA256", section.Name)
			}
		}
	default:
		return fmt.Errorf("fetch %q uses unknown fetcher %q", section.Name, section.One("fetcher"))
	}
	return nil
}

func requireFetch(section Section, fields ...string) error {
	for _, field := range fields {
		if section.One(field) == "" {
			return fmt.Errorf("%s fetch %q requires %s", section.One("fetcher"), section.Name, field)
		}
	}
	return nil
}

func validateFields(section Section, allowed, lists map[string]bool) error {
	for key, values := range section.Values {
		if !allowed[key] && !lists[key] {
			return fmt.Errorf("line %d: unknown %s field %q", section.Line, section.Kind, key)
		}
		if len(values) > 1 && !lists[key] {
			return fmt.Errorf("line %d: duplicate scalar field %q", section.Line, key)
		}
	}
	return nil
}

func fields(value string) map[string]bool {
	result := map[string]bool{}
	for _, field := range strings.Fields(value) {
		result[field] = true
	}
	return result
}

func (section Section) One(key string) string {
	values := section.Values[key]
	if len(values) == 0 {
		return ""
	}
	return values[0]
}

func (file File) SourceID(section Section) string {
	if len(file.Sources) == 1 {
		return file.Corpus.One("id")
	}
	return section.Name
}

func (file File) Source(id string) (Section, bool) {
	for _, source := range file.Sources {
		if file.SourceID(source) == id {
			return source, true
		}
	}
	return Section{}, false
}

// Input returns the source-specific declaration, falling back to the unnamed
// declaration shared by all sources in a multi-source corpus.
func (file File) Input(id string) (Section, bool) {
	var fallback Section
	for _, input := range file.Inputs {
		if input.Name == id {
			return input, true
		}
		if input.Name == "" {
			fallback = input
		}
	}
	return fallback, fallback.Values != nil
}

func (file File) SortedSources() []Section {
	result := append([]Section(nil), file.Sources...)
	sort.Slice(result, func(i, j int) bool { return file.SourceID(result[i]) < file.SourceID(result[j]) })
	return result
}
