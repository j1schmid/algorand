 
TEXFILE = algorand


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
	
umlaute:
	cp $(TEXFILE).tex $(TEXFILE).tex_backup
	cat $(TEXFILE).tex | sed 's/ä/\\"a/g' | sed 's/Ä/\\"A/g' | sed 's/ö/\\"o/g' | sed 's/Ö/\\"O/g' | sed 's/ü/\\"u/g' | sed 's/Ü/\\"U/g' > $(TEXFILE).tex

warning:
	pdflatex $(TEXFILE).tex | grep -B 5 -A 2 Warning

.PHONY : all open pdf bibtex warning
