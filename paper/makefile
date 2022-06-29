all: perfmod.pdf

publish.zip: perfmod.pdf perfmod.bbl
	rm -rf publish/
	mkdir publish/
	cp -f perfmod.bbl perfmod.tex igsnatbib.sty igs.bst lineno.sty igs.cls  publish/
	zip -r publish publish

perfmod.pdf perfmod.bbl: perfmod.tex perfmod.bib
	pdflatex perfmod
	bibtex perfmod
	pdflatex perfmod
	pdflatex perfmod

.PHONY: clean

clean:
	@rm -f *~ *.out *.aux *.log *.blg *.snm *.toc *.nav *.vrb *.bbl *.synctex.gz *.dvi
	@rm -rf publish/
	@rm -f publish.zip
