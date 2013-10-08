pandoc D4.3-draft.md -f markdown -t latex --table-of-contents --toc-depth=4 -o D4.3-body.tex
pdflatex D4.3.tex
pdflatex D4.3.tex
