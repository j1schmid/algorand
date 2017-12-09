 
TEXFILE = main


all : bibtex

open:
	nohup evince $(TEXFILE).pdf &


pdf :
	pdflatex $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

bibtex :
	pdflatex $(TEXFILE).tex
	pdflatex $(TEXFILE).tex
	bibtex $(TEXFILE).aux
	pdflatex $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

warning:
	pdflatex $(TEXFILE).tex | grep -B 5 -A 2 Warning

.PHONY : all open pdf bibtex warning
