---
title: "Lecture Title"
author: "Instructor"
institute: "University Name"
date: "Semester Year"
fontsize: 12pt
...

## Outline

1. First outline item
1. Second outline item
1. Third outline item
1. Fourth outline item

\note{ 
Put instructor notes within this structure. It will only appear in the Notes version.
}

# Missing Pieces

## Using the "hush" command

* The Handout version of the lecture has blanks where content is enclosed in \\hush{} commands
* This item is \hush{missing} some text
* \hushitem{Removing an entire item} or the beginning of an item requires \\hushitem{}
* \hushitem{This whole item will be gone in the Handout version}
* An entire slide can be hushed using \\hushframe{}

\note{
\begin{itemize}
\item lists in notes need to use TeX format
\item let me know if you know a workaround
\end{itemize}
}

# Using Colors

## Color terms

* Here is \alrt{red text} using \\alrt{}
* Here is bigger \alrtl{red text} using \\alrtl{}
* Here is the biggest \alrtL{red text} using \\alrtL{}
* Here is \struc{blue text} using \\struc{}
* Here is bigger \strucl{blue text} using \\strucl{}
* Here is the biggest \strucL{blue text} using \\strucL{}
* Here is \dred{dark red text} using \\dred{}
* Here is bigger \dredl{dark red text} using \\dredl{}
* Here is the biggest \dredL{dark red text} using \\dredL{}
* You can also use \\hushalrt{} and \\hushstruc{} for hushed text

\note{ 
If no note command is used, the slide will not appear in the Notes version.
Use a blank space to make a slide with no notes appear in the Notes pdf.
}

# Cool List Effects

## Special list environments

\begin{ialert}
  \item the \struc{ialert} environment
  \item is an iterative list
  \item that shows the current list item in red
\end{ialert}
\begin{itrans}
  \item the \struc{itrans} environment
  \item is an iterative list
  \item that makes non-active list items semi-transparent
\end{itrans}
\begin{itransalert}
  \item the \struc{itransalert} environment
  \item combines the two
\end{itransalert}

\note{ }