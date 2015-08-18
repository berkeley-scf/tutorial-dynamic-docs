# for using R Markdown 
Rscript -e "install.packages(c('rmarkdown'), repos = 'http://cran.cnr.berkeley.edu', lib = '~/R/x86_64-pc-linux-gnu-library/3.2')"
sudo apt-get update
sudo apt-get install -y pandoc pandoc-citeproc lmodern 

# for using knitr+LaTeX
sudo apt-get install -y texinfo highlight

# for the bash kernel for Jupyter
pip install bash_kernel
python -m bash_kernel.install
