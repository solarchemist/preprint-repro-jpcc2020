# README

This repository contains all the data and code needed to fully reproduce
the analysis and results (as well as a preprint version of the manuscript itself) of
**Optical Quantum Confinement in Ultrasmall ZnO and the Effect of Size on Their Photocatalytic Activity**,
J. Phys. Chem. C 2020, 124, 11 6395–6404 [DOI: 10.1021/acs.jpcc.9b11229](https://doi.org/10.1021/acs.jpcc.9b11229).

This repository was created in the spirit of collaboration and open science.

## Written using literate programming (Rnoweb)

This manuscript was written with the benefit of
*literate programming* (specifically
[Rnoweb](https://www.stat.auckland.ac.nz/~ihaka/software/Rnoweb/Rnoweb-guide.pdf))
allowing the author to combine R and LaTeX code in the same document, and thus
allowing data (manipulated in R) to *dynamically* create LaTeX tables or plots
with the aid of knitr, TikZ and other R and LaTeX functionalities.

The Rnoweb structure allows us to keep the entire data ingestion and analysis
within the manuscript source itself.
With the addition of version tracking with git, this makes it practically
impossible to sever (by failing to record metadata, etc.) the connection
between the raw data and the generated analysis.

Thanks to knitr's "child" functionality, we were able
to keep most of the R or LaTeX code well-separated from the text of the manuscript,
thus making it easy for the authors to work with the text itself.

Part of doing science is to invite scrutiny, so, if you happen to find what you
believe are errors in the data, in the analysis or in the code,
please [get in touch with me](https://solarchemist.se/contact)!.


## Requirements

To reproduce this manuscript yourself, you need

+ [TeXLive 2021](http://tug.org/texlive)
  (including [siunitx v3](https://ctan.org/pkg/siunitx),
  [biblatex](https://ctan.org/pkg/biblatex),
  [biber](https://github.com/plk/biber) and
  [latexmk](http://personal.psu.edu/jcc8/software/latexmk/)), and
+ [R v4](https://cran.r-project.org/)

As a courtesy, this repo includes a very simple bash script, `compile.sh`, that
demonstrates how to compile this document with knitr and latexmk (tested on Ubuntu 22.04).

The main source document is `000-paper.Rnw` (symlinked to `paper.Rnw`).
This main source document *includes* all the other `*.Rnw` files using
knitr's [child mechanism](https://bookdown.org/yihui/rmarkdown-cookbook/child-document.html).

Note that the file `paper.tex` is *generated*, and thus overwritten every
time the document is recompiled.


## Reproduce this manuscript

Assuming you have installed the requirements listed above,
you should be able to reproduce the analysis and recompile the PDF manuscript.

1. Clone this repo:

```
$ git clone https://github.com/solarchemist/preprint-repro-jpcc2020
```

2. Start `R` from within the manuscript directory and restore the R environment
with [renv](https://rstudio.github.io/renv/articles/renv.html):

```
$ cd preprint-repro-jpcc2020
$ R
> renv::restore()
```

> Sidenote: `renv` installs all the packages specified in this project's `renv.lock` file
> and makes them available to this project without interfering with your system-wide R
> installation.
> Unfortunately, there is no similar software solution for LaTeX packages,
> so unless you opted to install the full TeXLive installation you might
> have some LaTeX packages you need to install manually.

3. Run the provided bash script:

```
$ ./compile.sh
```

Please note that compiling the document the first time may take several minutes.
Subsequent runs are much faster, thanks to the caching performed by knitr.

Note that compilation also creates a stand-alone PDF of each plot in the `figure/` directory.

If you encounter problems with recompiling this manuscript,
[I'd love to hear about it](https://solarchemist.se/contact)!



## Links about reproducibility in science

+ https://twitter.com/NatureNews/status/999715421208104960
+ [*Before reproducibility must come preproducibility* Nature 557, 613 (2018)](https://doi.org/10.1038/d41586-018-05256-0)
+ [*How to increase reproducibility and transparency in your research* Opening Reproducible Research (2019)](https://o2r.info/2019/02/04/write-reproducible-manuscripts-for-copernicus-publications-journals/)
+ [*Writing reproducible papers in R* Tim Schoof (2019)](https://www.timschoof.com/post/reproducible-papers-r/)
+ [*Composing reproducible manuscripts using R Markdown* eLife (2017)](https://elifesciences.org/labs/cad57bcf/composing-reproducible-manuscripts-using-r-markdown)


## Copyright

Data is [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).
Code (LaTeX, R, bash) is [GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
For anything else possibly not covered by the above, consider it CC-BY 4.0.
