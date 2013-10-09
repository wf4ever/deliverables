# Convert markdown to .tex for document body
pandoc D4.3-draft.md -f markdown -t latex --table-of-contents --toc-depth=4 -o D4.3-body.tex
# Generate .aux
pdflatex D4.3.tex
# Generate .bbl
bibtex D4.3
# Page count
pdflatex D4.3.tex
# Final formatting
pdflatex D4.3.tex
# End.
