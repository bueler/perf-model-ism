all: perfmod.pdf

perfmod.pdf: perfmod.tex perfmod.bib
	pdflatex perfmod
	bibtex perfmod
	pdflatex perfmod
	pdflatex perfmod

.PHONY: clean

clean:
	@rm -f *~ *.out *.aux *.log *.blg *.snm *.toc *.nav *.vrb *.bbl *.synctex.gz
