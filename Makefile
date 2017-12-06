.PHONY: all
all: resume.html

%.html: %.md %.min.css gtag.js
	pandoc -t html $< -o $@ --css $*.min.css -s --title "Josh McGrath's Resume" --email-obfuscation=javascript --include-in-header=gtag.js

.PRECIOUS: %.min.css
%.min.css: %.less bootstrap
	lessc --clean-css $< $@

bootstrap:
	git clone https://github.com/twbs/bootstrap.git

clean:
	rm -rf *.html *.css
