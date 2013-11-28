# Generate .aux
pdflatex D4.3-RC.tex
# Generate .bbl
bibtex D4.3-RC
# Page count
pdflatex D4.3-RC.tex
# Final formatting
pdflatex D4.3-RC.tex
# End.
