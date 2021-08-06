# README

This is an experiment in sharing a fully reproducible manuscript.

At a very early point in this project, I decided to write it up using
literate programming, specifically 
using [Rnoweb](https://www.stat.auckland.ac.nz/~ihaka/software/Rnoweb/Rnoweb-guide.pdf)
with the aid of R, knitr, LuaLaTeX, and TikZ
(an approach that I am very familiar with).

This allowed me to keep the entire data ingestion and analysis within the manuscript source.
And by judiciously nesting the source files, I was able to 
keep most of the code well separated from the text of the manuscript, thus making
it easier to both write and read the manuscript's source code, as it were.

I consciously chose to use R in combination with LaTeX and TikZ instead of the much 
simpler-to-use R Markdown format becuase the former lets us use the full
typesetting power of LaTeX everywhere, even in the computationally generated
plots and tables.

Since the paper is now published (yay!), and a recent conference gave me a reason
to revisit this project, I finally got around to creating an
[orphan git branch](https://stackoverflow.com/questions/19980631/what-is-git-checkout-orphan-used-for)
from which to share this manuscript.

This git repository contains a reproducible Rnoweb document (`000-paper.Rnw` and its children) 
containing R and LaTeX code that runs the complete data analysis and 
generates the manuscript (preprint version) for our paper
**Optical Quantum Confinement in Ultrasmall ZnO and the Effect of Size on Their Photocatalytic Activity**,
J. Phys. Chem. C, [DOI: 10.1021/acs.jpcc.9b11229](https://doi.org/10.1021/acs.jpcc.9b11229).

This repository also contains all the data (as-recorded spectra etc.) that is referenced from
within the manuscript.

Part of doing science is to invite scrutiny, so, if you happen to find what you believe are errors
in the data, in the analysis or in the code, 
please [get in touch with me](https://solarchemist.se/contact/).


## Requirements

To reproduce this manuscript yourself, you need

+ [TeXLive 2021](http://tug.org/texlive/)
  (including [siunitx v3](https://ctan.org/pkg/siunitx), 
  [biblatex](https://ctan.org/pkg/biblatex), 
  [biber](https://github.com/plk/biber) and 
  [latexmk](http://personal.psu.edu/jcc8/software/latexmk/)), and
+ [R v4](https://cran.r-project.org/)

As a courtesy, this repo includes a very simple bash script, `compile.sh`, that
demonstrates how to compile this document with knitr and latexmk (only tested on Ubuntu).

The main source document is named `000-paper.Rnw`. 
For ease of use, this document is symlinked to `paper.Rnw`.
This main file *includes* the other Rnw files using 
knitr's [child mechanism](https://bookdown.org/yihui/rmarkdown-cookbook/child-document.html).

Note that the file `paper.tex` is *generated*, and thus overwritten every
time the document is recompiled.


## Reproduce this manuscript

Assuming you have installed the requirements listed above.

Clone this repo:

```
$ git clone https://github.com/solarchemist/preprint-repro-jpcc2020
```

Run `R` from within the manuscript directory and restore the R environment
using [renv](https://rstudio.github.io/renv/articles/renv.html):

```
$ cd preprint-repro-jpcc2020
$ R
> renv::restore()
```

> Sidenote: `renv` installs all the packages specified in this project's `renv.lock` file and makes
them available to this project without interfering with your system-wide R installation.
> Unfortunately, there is no similar software solution for LaTeX packages,
so unless you opted to install the full TeXLive installation you might
have some LaTeX packages you need to install manually.

Run the compilation bash script to generate the PDF:

```
$ ./compile.sh
```

Please note that compiling the document the first time takes several minutes.
Subsequent runs are much faster, thanks to the caching performed by knitr.

The compilation also creates a stand-alone PDF of each plot in the `figure/` directory.

If you encounter problems with recompiling this manuscript, I'd love to hear about it!



## Read more about reproducibility in science

+ https://twitter.com/NatureNews/status/999715421208104960
+ [*Before reproducibility must come preproducibility* Nature 557, 613 (2018)](https://doi.org/10.1038/d41586-018-05256-0)
+ [*How to increase reproducibility and transparency in your research* Opening Reproducible Research (2019)](https://o2r.info/2019/02/04/write-reproducible-manuscripts-for-copernicus-publications-journals/)
+ [*Writing reproducible papers in R* Tim Schoof (2019)](https://www.timschoof.com/post/reproducible-papers-r/)
+ [*Composing reproducible manuscripts using R Markdown* eLife (2017)](https://elifesciences.org/labs/cad57bcf/composing-reproducible-manuscripts-using-r-markdown)
