Written by Jordan Mantha

The header files were adapted from BeamerLecture V1.1 by Don Eisenstein. You can see his original
work at http://faculty.chicagobooth.edu/donald.eisenstein/more/BeamerLecture.html

# How it Works

1. Install pandoc
1. Copy the contents of pandoc-lecture.sh to your .bashrc or .bash_aliases (I have tested with Linux and Cygwin) and restart your terminal
1. Run pdfall test

# Types of Output Files
## Lecture

Basically a regular LaTeX beamer presentation.

## Handout

* The Handout version of the lecture has blanks where content is enclosed in \hush{} commands
* This allows me to give students a handout, but still forces them to pay attention in order
to fill in the missing information.

## Notes

The \note{} command is used for speaker notes. The contents will appear on a separate page
in the pdf. I generally print 6 pages (2x3) to a sheet to make my lecture notes.

## Post

This is a flattened version of the lecture, convenient for printing out. Unlike the Handout version,
there are no missing bits.