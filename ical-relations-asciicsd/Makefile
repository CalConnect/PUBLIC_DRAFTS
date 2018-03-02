SRC  := $(wildcard draft-*.adoc)
TXT  := $(patsubst %.adoc,%.txt,$(SRC))
XML  := $(patsubst %.adoc,%.xml,$(SRC))
HTML := $(patsubst %.adoc,%.html,$(SRC))

SHELL := /bin/bash
# Ensure the xml2rfc cache directory exists locally
IGNORE := $(shell mkdir -p $(HOME)/.cache/xml2rfc)

all: $(XML) 

clean:
	rm -f $(TXT) $(HTML) $(XML)

%.xml: %.adoc
	bundle exec asciidoctor -r ./lib/glob-include-processor.rb -r asciidoctor-csd -b csd $^ --trace > $@

open:
	open *.txt

