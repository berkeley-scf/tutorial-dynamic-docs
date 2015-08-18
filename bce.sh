# for using R Markdown 
Rscript -e "install.packages(c('rmarkdown'), repos = 'http://cran.cnr.berkeley.edu')"
sudo apt-get update
sudo apt-get install -y texinfo pandoc pandoc-citeproc lmodern highlight

# for using knitr+LaTeX
sudo apt-get update
sudo apt-get install -y texinfo highlight

# for the bash kernel for Jupyter
pip install bash_kernel
python -m bash_kernel.install
