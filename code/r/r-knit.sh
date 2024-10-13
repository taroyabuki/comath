docker run --rm -it -v "$(pwd)":/home/rstudio/work rocker/tidyverse Rscript -e "rmarkdown::render('/home/rstudio/work/r.Rmd', output_format='html_document', output_file='/home/rstudio/work/r.html')"
