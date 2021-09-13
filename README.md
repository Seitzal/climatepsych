# Who Cares about the Climate? Psychological Predictors of Political Environmentalism among German Citizens
A. Seitz, 2021

[Link to PDF](https://stratus.seitzal.eu/index.php/s/5QZZXPxWkoizY9w)

## Replication instructions

The commented RMarkdown notebook "notebook.rmd" contains all R scripts required for the statistical analysis, as well as additional descriptive statistics.
Executing all code chunks in the notebook yields a data file "results.RData" that is required to render the paper.
Execution may take a while, due to the size of the GLES dataset.

## Rendering the document

The paper is written in RMarkdown, designed to be rendered to PDF via knitr, pandoc and LaTeX. A working TeX installation is required to render the document. I recommend [TeX Live](https://www.tug.org/texlive/).
The main file for the document is called "main.rmd". After installing all required packages and generating the "results.RData" file as explained above, it should be enough to open "main.rmd" in RStudio and click on "Knit" -> "Knit to PDF" to receive a TeX and a PDF file. The "main.rmd" file is configured to automatically pull in all other files (tables, preamble etc.).
