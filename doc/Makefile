MARKDOWN := $(wildcard *.md)
PDF := $(MARKDOWN:%.md=%.pdf)

all: $(PDF)

%.pdf: %.md pandoc.yml
	pandoc --defaults pandoc.yml -o $@ $<

clean:
	rm -rf *.pdf
