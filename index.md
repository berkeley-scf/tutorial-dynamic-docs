---
title: Creating Dynamic Documents
subtitle: Embedding Code Chunks in Scientific Documents
layout: default
author: Christopher Paciorek
---

## 1 This tutorial

This tutorial covers the basics of creating documents that combine code chunks, mathematical notation, and text. We'll cover R, Python and bash shell chunks in the context of documents written with LaTeX, Markdown, and Jupyter notebooks.

For this tutorial you'll need to install the following software:

* R (and optionally RStudio).
   * You'll also need Pandoc. Pandoc comes with RStudio, so if you have RStudio, you don't need to install it yourself.
* The `rmarkdown` and `knitr` packages for R.
* A LaTeX distribution:
   * This is probably most easily obtained by running `install_tinytex()`, available from the R `tinytex` package
   * Alternatively, an installation such as `MacTex` (Mac) or `MiKTeX` (Windows).
* Jupyter and the R kernel for Jupyter (you can skip this if you just want to use the R Markdown and knitr tools).

Department and university servers that you may have access to may also have some or all of this software already installed.

This tutorial assumes basic familiarity with LaTeX syntax (most simply just with some basic math syntax); more details on LaTeX are available in our [quick introduction to LaTeX tutorial](https://statistics.berkeley.edu/computing/training/tutorials).

You should be able to follow the tutorial on any of MacOS, Windows or Linux. 

Materials for this tutorial, in particular the demonstration input files in various formats, are available from the underlying GitHub repository via the links in the left sidebar.```

This tutorial by Christopher Paciorek is licensed under a Creative Commons Attribution 3.0 Unported License.


## 2 Overview

In the following sections, we'll point to example source files in each of the formats covered in this tutorial, and we'll show how to create PDF and HTML files from each source document. Each example file covers the same material, showing basic use of equations and code chunks in R, Python, and bash. In addition, there are tips on formatting code to avoid output that exceeds the width of a page, which is a common problem when generating PDFs.

In general, processing the input file to create an output file involves evaluating the code chunks and creating an intermediate document in which the results of the evaluation are written out (e.g., a standard Markdown file from Rmd files and a standard LaTeX file from Rtex files), from which the final step is to create the output in the usual way from the intermediate document (e.g., `pandoc` for Markdown and `pdflatex` for LaTeX). Note that these steps take place behind the scenes without you needing to know the details.

As a specific example, [demo.html](demo.html) and [demo.pdf](demo.pdf) show the final output, after "rendering" the input document (specifically in this case from the .Rmd input, but output from the other input formats looks essentially the same). 

## 3 R Markdown

R Markdown is a variant on the Markdown markup language that allows you to embed code chunks that are evaluated before creating the final output, unlike standard static code chunks in Markdown that are not evaluated. R Markdown files are simple text files.

In [demo.Rmd](demo.Rmd), you'll see examples of embedding R, Python, and bash code chunks, as well as the syntax involved in creating PDF, HTML, and Word output files. [demo.html](demo.html) and [demo.pdf](demo.pdf) show how it looks as a final output file, after "rendering" the input Rmd document. 

### Quarto and qmd files

Quarto is a relatively new project meant to extend R Markdown and also work with Jupyter notebooks. You can create `qmd` files that use the same syntax as R Markdown (`Rmd`) files. Quarto also allows you to easily render output files from qmd, R Markdown, and Jupyter notebook files. And you can use Quarto to convert Jupyter notebooks to the qmd format. This is nice in part because qmd (like Rmd) is more easily handled by version control and with shell commands than the JSON format of .ipynb files.

## 4 LaTeX plus knitr

*knitr* is an R package that allows you to process LaTeX files that contain code chunks. The code chunks can be in one of two formats, either a format introduced by knitr (with extension .Rtex) or traditional Sweave format (with extension .Rnw). Files in either format are simple text files. I recommend the Rtex format.

[demo.Rtex](demo.Rtex) and [demo.Rnw](demo.Rnw) are examples of these formats, with examples of embedding R, Python, and bash code chunks.  In both *demo.Rnw* and *demo.Rtex* you'll also see the syntax for creating PDF output files.

### Overleaf

[Overleaf](overleaf.com) allows you to [use either Rtex or Rnw style code chunk formatting](https://www.overleaf.com/learn/latex/Knitr) within a LaTeX document (but note that documentation only shows the Rnw format). 

> **Warning**
> Strangely, regardless of which format you use, you need to have your document name end in the .Rtex extension for the code chunks to be interpreted as code.

## 5 LyX plus knitr

You can embed code chunks in the Sweave (Rnw) format in LyX files and then process the file using `knitr` to create PDF output. [demo.lyx](demo.lyx) provides an example, including the syntax for creating PDF output files. To use LyX, you'll need to start the LyX application and open an existing or create a new LyX file.

## 6 Jupyter notebooks

Project Jupyter grew out of the IPython Notebook project and provides a general way of embedding code chunks, using a variety of languages (not just Python), within a document (called a notebook) where the text components of the document is written in Markdown. Basically a document is a sequence of chunks, where each chunk is either a code chunk or a Markdown (text) chunk. The Markdown text can of course include mathematical notation using LaTeX syntax. 

To work with a Jupyter notebook, you start Jupyter by running `jupyter notebook` from the UNIX command line. This will open up a Jupyter interface in a browser window. From there, you can navigate to and open your notebook file (which will end in extension .ipynb). You can choose the kernel (i.e., the language for the code chunks -- Python, R, etc.) by selecting `Kernel -> Change Kernel` or by selecting the kernel you want when opening a new notebook.

You may have web-based access to Jupyter notebooks via services such as JupyterHub and Open OnDemand (e.g., on the [UC Berkeley Savio campus cluster](https://ood.brc.berkeley.edu) or through the [UC Berkeley Statistical Computing Facility](https://jupyter.stat.berkeley.edu) or the UC Berkeley [DataHub](https://datahub.berkeley.edu)). In that case you logon via a web browser and then start and interact with your notebook in the browser.

The Jupyter files have some similarities to *demo.Rmd* as both R Markdown and Jupyter rely on Markdown as the format for text input. However, they handle code chunks somewhat differently.

You can insert code chunks in a different language using the `%%` magic syntax, as shown in [demo-python.ipynb](demo-python.ipynb). We also have specific demo files for bash and R: [demo-bash.ipynb](demo-bash.ipynb) and [demo-R.ipynb](demo-R.ipynb).  All include instructions for generating HTML output. 

### Quarto and qmd files

You can use Quarto to convert Jupyter notebooks to the qmd format. 

```
quarto convert demo-python.ipynb 
```

This is nice in part because qmd (like Rmd) is more easily handled by version control and with shell commands than the JSON format of .ipynb files.


