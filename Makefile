HTML=resume.

.PHONY: all
all: resume.html

%.html: %.md %.css.inc
	pandoc -t html $*.md -o $@ -H $*.css.inc -s --email-obfuscation=javascript --metadata pagetitle="Josh McGrath's Resume"

%.css.inc: %.css %.md
	purifycss --min --out $@.tmp $*.css $*.md
	echo '<style type="text/css">' > $@
	cat $@.tmp >> $@
	echo '</style>' >> $@

%.css: %.scss bootstrap
	sass $< $@

bootstrap:
	git clone https://github.com/twbs/bootstrap.git

clean:
	rm -rf *.html *.css *.map
