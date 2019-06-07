
MMARK := mmark

%.xml: %.md
	cat $< | $(MMARK) -2 > $@

.PHONY: build

xml: draft-stepanek-jscontact.xml

distclean:
	rm -f draft-stepanek-jscontact.xml
