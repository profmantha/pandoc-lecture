pdflecture()
{
pandoc -s -i -t beamer -H headers/HeaderLecture.tex -H headers/HeaderCommon.tex ${*%.*}.md > yap.tex
pdflatex yap.tex
pdflatex yap.tex
cp yap.pdf ${*%.*}Lecture.pdf
/bin/rm yap.*
}

pdfnote()
{
pandoc -s -t beamer -V handout -V notes -H headers/HeaderNotes.tex -H headers/HeaderCommon.tex ${*%.*}.md > yap.tex
pdflatex yap.tex
cp yap.pdf ${*%.*}Notes.pdf
/bin/rm yap.* 
}

pdfhandout()
{
pandoc -s -t beamer -V handout -H headers/HeaderHandout.tex -H headers/HeaderCommon.tex  ${*%.*}.md > yap.tex
pdflatex yap.tex
cp yap.pdf ${*%.*}Handout.pdf
/bin/rm yap.* 
}

pdfpost()
{
pandoc -s -t beamer -V handout -H headers/HeaderPost.tex -H headers/HeaderCommon.tex ${*%.*}.md > yap.tex
pdflatex yap.tex
cp yap.pdf ${*%.*}Post.pdf
/bin/rm yap.tex yap.pdf 
}


pdfall()
{
pdflecture $*
pdfhandout $*
pdfpost $*
pdfnote $*
}

