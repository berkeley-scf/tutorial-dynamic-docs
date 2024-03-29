---
title: Creating Dynamic Documents
subtitle: Embedding Code Chunks in Scientific Documents
layout: default
author: Christopher Paciorek
---

# Creating dynamic documents

## 1 This tutorial

This tutorial covers the basics of creating documents that combine code chunks, mathematical notation, and text. We'll cover R, Python, Julia and bash shell chunks in the context of documents written with LaTeX, Quarto, Markdown, and Jupyter notebooks.

For this tutorial you'll need to install the following software:

* R (and optionally RStudio).
   * You'll also need Pandoc. Pandoc comes with RStudio, so if you have RStudio, you don't need to install it yourself.
* The `rmarkdown` and `knitr` packages for R.
* Quarto 
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

## 4 Quarto and qmd files

Quarto is a somewhat new project meant to extend R Markdown to a more general purpose system that doesn't focus on R and that  also work with Jupyter notebooks. You can create `qmd` files that use the same syntax as R Markdown (`Rmd`) files or that use slightly modified syntax defined specifically for Quarto. 

You can see Quarto's syntax in [demo-q.qmd](demo-q.qmd). [demo-q.html](demo-q.html) and [demo-q.pdf](demo-q.pdf) show how it looks as a final output file, after rendering the input qmd document.

Quarto also allows you to easily render output files from qmd, R Markdown, and Jupyter notebook files. And you can use Quarto to convert Jupyter notebooks to the qmd format. This is nice in part because qmd (like Rmd) is more easily handled by version control and with shell commands than the JSON format of .ipynb files.

### Rendering engines

If only Python chunks or only bash chunks are used, Quarto will use the `jupyter` engine to render the chunks. For bash chunks to be processed you'll need the Jupyter bash kernel installed. If you don't want to install the bash kernel, you can request the `knitr` engine as discussed below.

Otherwise (if using R chunks or if there are chunks from multiple languages), quarto will use the `knitr` engine to run the chunks, which requires you to have R and the `knitr` R package installed. For Python chunks, this will use the `reticulate` R package behind the scenes to run Python code.

You can specify the engine by adding information to the YAML configuration information at the top of the file, e.g., as follows to use the `knitr` engine:

```
engine: knitr
```

One benefit of using the `knitr` engine is that output from a chunk is interleaved with the code of the chunk, whereas with the `jupyter` engine (as with a Jupyter notebook), all output from a chunk appears after the entire code chunk is displayed.

### Tools for developing qmd documents

Here are a few approaches you can use to interactively develop your documents.

  1. **Text editor + quarto preview**: The most basic approach is to use your favorite text editor and run `quarto preview file.qmd` from the command line (including Windows cmd.exe or PowerShell). Assuming that you've done an initial rendering of the document, this will display the output in a browser window and update the output any time you save the qmd file.
  2. **VS Code**: You can use VS Code with the Quarto extension. (If using Python chunks, you will probably also need the Python and Jupyter extensions). The extension will provide a "Run chunk" option above each chunk, and you can run individual lines using Shift+Enter (this may vary by operating system). You can also render from within VS Code and you'll see the results displayed in a pane within VS Code. Note that with Python chunks, you may need to choose the Python interpreter that you want used - you can do this from the command pallette with "Python: select interpreter" or by clicking on the icon that shows the current Python interpreter.
  3. **RStudio**: You can use RStudio to interact with qmd files in the same fashion as with Rmd files. You can run chunks or individual lines of code easily and render easily using the Render button.


## 5 LaTeX plus knitr

*knitr* is an R package that allows you to process LaTeX files that contain code chunks. The code chunks can be in one of two formats, either a format introduced by knitr (with extension .Rtex) or traditional Sweave format (with extension .Rnw). Files in either format are simple text files. I recommend the Rtex format.

[demo.Rtex](demo.Rtex) and [demo.Rnw](demo.Rnw) are examples of these formats, with examples of embedding R, Python, and bash code chunks.  In both *demo.Rnw* and *demo.Rtex* you'll also see the syntax for creating PDF output files.

### Overleaf

[Overleaf](https://www.overleaf.com) allows you to [use either Rtex or Rnw style code chunk formatting](https://www.overleaf.com/learn/latex/Knitr) within a LaTeX document (but note that documentation only shows the Rnw format). 

> **Warning**:
> Strangely, regardless of which format you use, you need to have your document name end in the .Rtex extension for the code chunks to be interpreted as code.

## 6 LyX plus knitr

You can embed code chunks in the Sweave (Rnw) format in LyX files and then process the file using `knitr` to create PDF output. [demo.lyx](demo.lyx) provides an example, including the syntax for creating PDF output files. To use LyX, you'll need to start the LyX application and open an existing or create a new LyX file.

## 7 Jupyter notebooks

Project Jupyter grew out of the IPython Notebook project and provides a general way of embedding code chunks, using a variety of languages (not just Python), within a document (called a notebook) where the text components of the document is written in Markdown. Basically a document is a sequence of chunks, where each chunk is either a code chunk or a Markdown (text) chunk. The Markdown text can of course include mathematical notation using LaTeX syntax. 

To work with a Jupyter notebook, you start Jupyter by running `jupyter notebook` from the UNIX command line. This will open up a Jupyter interface in a browser window. From there, you can navigate to and open your notebook file (which will end in extension .ipynb). You can choose the kernel (i.e., the language for the code chunks -- Python, R, etc.) by selecting `Kernel -> Change Kernel` or by selecting the kernel you want when opening a new notebook.

You may have web-based access to Jupyter notebooks via services such as JupyterHub and Open OnDemand (e.g., on the [UC Berkeley Savio campus cluster](https://ood.brc.berkeley.edu) or through the [UC Berkeley Statistical Computing Facility](https://jupyter.stat.berkeley.edu) or the UC Berkeley [DataHub](https://datahub.berkeley.edu)). In that case you logon via a web browser and then start and interact with your notebook in the browser.

The Jupyter files have some similarities to *demo.Rmd* as both R Markdown and Jupyter rely on Markdown as the format for text input. However, they handle code chunks somewhat differently.

You can insert code chunks in a different language using the `%%` magic syntax, as shown in [demo-python.ipynb](demo-python.ipynb). We also have specific demo files for bash and R: [demo-bash.ipynb](demo-bash.ipynb) and [demo-R.ipynb](demo-R.ipynb).  All include instructions for generating HTML output. 

### Quarto and qmd files

You can use Quarto to convert between the Jupyter notebook format (.ipynb) and the qmd format. 

```
quarto convert demo-python.ipynb 
quarto convert demo-python.qmd
```

This is nice in part because qmd (like Rmd) is more easily handled by version control and with shell commands than the JSON format of .ipynb files.


