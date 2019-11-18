.DEFAULT_GOAL := thesis.pdf

%.pdf: %.tex
	latexmk -pdfdvi -latex="platex -halt-on-error " -synctex=1 -e "\$$dvipdf='dvipdfmx %O %S';\$$bibtex='pbibtex';\$$makeindex='mendex';" $<

clean:
	$(RM) *.aux *.log *.dvi *.bcf *.fls *.snm *.bbl *.blg *.out *.nav *.xml *.vrb *.toc

live:
	livereloadx --include "*.pdf" -s
