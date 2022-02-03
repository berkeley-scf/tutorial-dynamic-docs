## The first chunk uses one format for indicating a chunk of code,
## and the second uses the knitr style.

## ---- external_chunk_1 ----
a <- 7
cat("a is ", a, ".\n", sep = "")


## @knitr external_chunk_2
a <- 9
cat("Now, a is ", a, ".\n", sep = "")
