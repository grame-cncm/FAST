FIG=$(wildcard fig/*.fig)
FIG2PDF=$(FIG:.fig=.pdf)


NAME=main
PDF=$(NAME).pdf
SOURCE=$(NAME).tex
DEPS=img/*.tex

all: $(PDF)  

bib: $(SOURCE)
	pdflatex  $<
	bibtex $(NAME)
	pdflatex  $<
	pdflatex  $<

%.pdf: %.tex img/*.tex 
	pdflatex  $<

%.pdf: %.fig
	fig2dev -L pdf $< > $@


clean:
	rm -f *~ $(FIG2PDF) ${NAME} main.pdf *.tmp
