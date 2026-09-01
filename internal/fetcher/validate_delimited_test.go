// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"strings"
	"testing"

	"github.com/openwaldo/fetchers/internal/config"
)

func TestValidateDelimitedChat(t *testing.T) {
	configuration, err := config.Parse(strings.NewReader(`[corpus]
id = example
title = Example
description = Example corpus.
[source]
name = Example
url = https://example.test
category = public-dataset
license = CDLA-Permissive-1.0
license-declaration = CDLA Permissive 1.0
language = en
[fetch]
fetcher = git
url = https://example.test/repo.git
revision = aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
estimated-size = 1M
pathspec = data.tsv
[input]
format = delimited
type = delimited-chat
id = conversationId
role = authorRole
content = utterance
order = turnNumber
delimiter = comma
role-alias = customer=user
role-alias = agent=assistant
`))
	if err != nil {
		t.Fatal(err)
	}
	input, _ := configuration.Input("example")
	data := "conversationId,turnNumber,utterance,authorRole\none,0,Hello,customer\none,1,Hi,agent\n"
	if err := validateDelimited(strings.NewReader(data), input); err != nil {
		t.Fatal(err)
	}
}
