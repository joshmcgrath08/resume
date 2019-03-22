.PHONY: all
all: resume.html

%.html: %.md %.min.css
	pandoc -t html $< -o $@ --css $*.min.css -s --email-obfuscation=javascript --metadata pagetitle="Josh McGrath's Resume"

.PRECIOUS: %.min.css
%.min.css: %.less bootstrap
	lessc --clean-css $< $@

bootstrap:
	git clone https://github.com/twbs/bootstrap.git

clean:
	rm -rf *.html *.css
