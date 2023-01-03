all: $(shell xsltproc pages.xsl energy.xml)

%.html: template.xsl energy.xml
	xsltproc -o $@ --stringparam page $* $^
