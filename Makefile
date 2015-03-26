###############################################################################
#                                                        March 26, 2015
# Makefile for arbitary documents
# - Yuki Sakurai  <yuki.sakurai@cern.sh>
#
###############################################################################


TARGET=example
UNAME := $(shell uname -s)

pdf: $(TARGET).pdf

ifeq (${UNAME},Darwin)
	@open $<
else
	@acroread $<
endif


ps: $(TARGET).ps
	gv $(TARGET).ps

$(TARGET).pdf: $(TARGET).tex
	platex $(TARGET).tex && platex $(TARGET).tex && platex $(TARGET).tex && dvipdfmx $(TARGET).dvi

%.pdf: %.ps
	ps2pdf $< $@

.PHONY: clean
clean:
	rm -rf *.aux *.dvi *.log *.out *.pdf *.tpt *.ps *.toc *.tof *.lot *.lof *.bbl thumb*.* *~
