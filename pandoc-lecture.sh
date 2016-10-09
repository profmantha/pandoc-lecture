#!/bin/bash

### Defaults

# Flavor of TeX used to build pdf: pdflatex, xelatex, lualatex
ENGINE="xelatex"

# Add any pandoc options that you want to apply to all building (i.e. --slide-level)
PANDOC_OPTS="--slide-level=2"

# Header file location
HEADER_DIR="./headers"

#If HEADER_DIR is changed, update the \input lines at the end of the following files
SLIDES_HEADER=$HEADER_DIR/"slides.tex"
NOTES_HEADER=$HEADER_DIR/"notes.tex"
HANDOUTS_HEADER=$HEADER_DIR/"handout.tex"
POST_HEADER=$HEADER_DIR/"post.tex"

### Getting Setup

# Command help (called with -h or --help)
function msg_help {
	echo "Usage: pandoc-lecture [OPTIONS] [FILE]
This command is used to build beamer lectures (slides, handouts, and speaking notes)
from Markdown source files using Pandoc.
The command options are:
  -s  Build presentation slides
  -n  Build speaker notes pages for use when presenting (using \note{})
  -c  Build class handouts with missing pieces (using \hush{})
  -p  Build complete handouts for posting to LMS, etc.
  -a  Build all of the above
  --clean  Remove auxillary LaTeX files
  -h  or  --help  You are here."
}

# Parse command-line options and set build flags
while [ "$#" -gt 0 ]; do
  case "$1" in
    -a) do_all=true; shift 1;;
    -s) do_slides=true; shift 1;;
    -n) do_notes=true; shift 1;;
    -c) do_handouts=true; shift 1;;
    -p) do_post=true; shift 1;;
    -h) msg_help; shift 1;;
    --help) msg_help; shift 1;;
    --clean) do_clean=true; shift 1;;

    -*) echo "unknown option: $1" >&2; exit 1;;
    *) MD_FILE="$1"; shift 1;;
  esac
done

# Build lecture slides
if [ $do_all ] || [ $do_slides ]; then
	echo "##### Building lecture slides #####"
	OUTFILE="${MD_FILE%.*}Slides"
	pandoc -s -i -t beamer --latex-engine=$ENGINE -H $SLIDES_HEADER $PANDOC_OPTS \
	    -o $OUTFILE.tex $MD_FILE
	if [ $ENGINE == "pdflatex" ]; then
		latexmk -pdf $OUTFILE
	else
		latexmk -$ENGINE $OUTFILE
	fi
	latexmk -c $OUTFILE$i
	rm $OUTFILE$i.nav $OUTFILE$i.snm
fi

# Build speaker notes
if [ $do_all ] || [ $do_notes ]; then
	echo "##### Building speaker notes #####"
	OUTFILE="${MD_FILE%.*}Notes"
	pandoc -s -t beamer -V handout -V classoption="notes" --latex-engine=$ENGINE -H $NOTES_HEADER $PANDOC_OPTS \
		-o $OUTFILE.tex $MD_FILE
	if [ $ENGINE == "pdflatex" ]; then
		latexmk -pdf $OUTFILE
	else
		latexmk -$ENGINE $OUTFILE
	fi	
	latexmk -c $OUTFILE$i
	rm $OUTFILE$i.nav $OUTFILE$i.snmfi
fi

# Build class handouts
if [ $do_all ] || [ $do_handouts ]; then
	echo "##### Building class handouts #####"
	OUTFILE="${MD_FILE%.*}Handout"
	pandoc -s -t beamer -V handout --latex-engine=$ENGINE -H $HANDOUTS_HEADER $PANDOC_OPTS \
		-o $OUTFILE.tex $MD_FILE
	if [ $ENGINE == "pdflatex" ]; then
		latexmk -pdf $OUTFILE
	else
		latexmk -$ENGINE $OUTFILE
	fi
	latexmk -c $OUTFILE$i
	rm $OUTFILE$i.nav $OUTFILE$i.snm
fi

# Build post-lecture handouts
if [ $do_all ] || [ $do_post ]; then
	echo "##### Building handouts for posting #####"
	OUTFILE="${MD_FILE%.*}Post"
	pandoc -s -t beamer -V handout --latex-engine=$ENGINE -H $POST_HEADER $PANDOC_OPTS \
		-o $OUTFILE.tex $MD_FILE
	if [ $ENGINE == "pdflatex" ]; then
		latexmk -pdf $OUTFILE
	else
		latexmk -$ENGINE $OUTFILE
	fi
	latexmk -c $OUTFILE$i
	rm $OUTFILE$i.nav $OUTFILE$i.snm
fi

# Clean up auxiliary files
if [ $do_clean ]; then
	echo "##### Cleaning auxiliary files #####"
	OUTFILE="${MD_FILE%.*}"
	for i in "Slides" "Notes" "Handout" "Post"; do
		latexmk -c $OUTFILE$i
		rm $OUTFILE$i.nav $OUTFILE$i.snm $OUTFILE$i.tex
	done
fi
