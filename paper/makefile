all: perfmod.pdf

# all submission in single file: perfmod.tex

#perfmod.pdf perfmod.bbl: perfmod.tex perfmod.bib
#	pdflatex perfmod
#	bibtex perfmod
#	pdflatex perfmod
#	pdflatex perfmod

perfmod.pdf: perfmod.tex
	pdflatex perfmod
	pdflatex perfmod

.PHONY: clean

clean:
	@rm -f *~ *.out *.aux *.log *.blg *.snm *.toc *.nav *.vrb *.bbl *.synctex.gz *.dvi
	@rm -rf publish/
	@rm -f publish.zip
