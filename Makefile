.DEFAULT_GOAL := thesis

libs = lib/*.sty

thesis: thesis.tex $(libs)
	latexmk -pdfdvi -latex="platex -halt-on-error " -synctex=1 -e "\$$dvipdf='dvipdfmx %O %S';\$$bibtex='pbibtex';\$$makeindex='mendex';" thesis

handout: FORCE
	(cd handout; make)

cover: FORCE
	(cd cover; make)

slide: FORCE
	(cd slides; make)

clean:
	$(RM) *.aux *.log *.dvi *.bcf *.fls *.snm *.bbl *.blg *.out *.nav *.xml *.vrb *.toc

distclean:
	make clean
	$(RM) thesis.pdf

live:
	livereloadx --include "*.pdf" -s

FORCE:
