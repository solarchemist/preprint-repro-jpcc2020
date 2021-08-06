#!/usr/bin/env bash
set -euo pipefail

job="paper.Rnw"
jobext=${job#*.} # just the file extension
jobname=${job%.*} # filename without extension

Rscript -e "library(knitr); library(methods); knit('$job')"
latexmk -r .latexmkrc -pdf -bibtex $jobname

exit 0
