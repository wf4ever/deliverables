# Status

The material in this directory is currently work-in-progress

D4.3.pdf contains content for the final deliverable with most but not all QA comments applied

The conclusions section has yet to be supplied.

QA comments that habve not yet been addressed are: 1 (needs discussion), 18, 19, 21, 22.

D4.3 QA.doc includes a summary of actions taken in response to the QA review.

FD4.3-for-QA.pdf contaiubns a cpy of the document in the form that was submitted for QA.


# Document preparation

The primary source files for the document are:

* D4.3.tex (document skeleton)
* D4.3-draft.md (Markdown content of document body)
* refs.bib
* figures/ subdirectory for figures in document

Other input files used are copied from other deliverables, and are referenced by D4.3.tex.

Preep;aration of the final PDF document uses a too, chain involving "pandoc", "bibtex" and "pdflatex".  The following script files are used:

* maketex - creates D4.3-body.tex from the Markdown source, and then creates the fimal PDF document in D4.3.pdf
* makepdf - uses an existing D4.3-body.tex to create to fial PDF document D4.3.pdf

