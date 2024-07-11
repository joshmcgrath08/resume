.PHONY: all
all: resume.html josh_mcgrath_resume.pdf

%.html: %.md %.css.inc
	pandoc -t html $*.md -o $@ -H $*.css.inc -s --email-obfuscation=javascript --metadata pagetitle="Josh McGrath's Resume"


josh_mcgrath_resume.pdf: resume.md resume_pdf.css.inc
	pandoc -t html5 resume.md -o $@ -H resume_pdf.css.inc -s --email-obfuscation=javascript --metadata pagetitle="Josh McGrath's Resume"

%.css.inc: %.css resume.md
	purifycss --min --out $@.tmp $*.css resume.md
	echo '<style type="text/css">' > $@
	cat $@.tmp >> $@
	echo '</style>' >> $@

%.css: %.scss bootstrap
	sass $< $@

bootstrap:
	git clone https://github.com/twbs/bootstrap.git

clean:
	rm -rf *.html *.css *.map
