
MMARK := mmark

%.xml: %.md
	cat $< | $(MMARK) -2 > $@

.PHONY: build

xml: jscontact.xml

distclean:
	rm -f jscontact.xml
