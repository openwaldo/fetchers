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
	sectionPattern = regexp.MustCompile(`^\[([a-z][a-z0-9-]*)(?:\s+"([a-z0-9._-]+)")?\]$`)
	idPattern      = regexp.MustCompile(`^[a-z0-9][a-z0-9._-]*$`)
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
		lists := fields("content-type language")
		if err := validateFields(source, allowed, lists); err != nil {
			return err
		}
		for _, required := range []string{"name", "url", "category", "license", "license-declaration"} {
			if source.One(required) == "" {
				return fmt.Errorf("source %q requires %s", id, required)
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
	for _, input := range file.Inputs {
		id := file.Corpus.One("id")
		if multiple {
			id = input.Name
			if !sources[id] {
				return fmt.Errorf("input references unknown source %q", id)
			}
		} else if input.Name != "" {
			return fmt.Errorf("single-source input must be unnamed")
		}
		if input.One("type") == "" {
			return fmt.Errorf("input %q requires type", id)
		}
	}
	return nil
}

func validateFetch(section Section) error {
	common := fields("fetcher url estimated-size source sha256 revision ref prefix suffix path selection manifest manifest-sha256 year list base-url reporters limit count language ids exclude-ids")
	lists := fields("pathspec epoch checksum artifact")
	if err := validateFields(section, common, lists); err != nil {
		return err
	}
	switch section.One("fetcher") {
	case "http":
	case "git":
		if section.One("revision") == "" {
			return fmt.Errorf("git fetch %q requires revision", section.Name)
		}
	case "huggingface", "public-inbox", "monthly-mbox", "hyperkitty", "gutenberg", "cap", "zip":
	default:
		return fmt.Errorf("fetch %q uses unknown fetcher %q", section.Name, section.One("fetcher"))
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

func (file File) SortedSources() []Section {
	result := append([]Section(nil), file.Sources...)
	sort.Slice(result, func(i, j int) bool { return file.SourceID(result[i]) < file.SourceID(result[j]) })
	return result
}
