#'
#' Import Bruker 1D NMR Data Sets
#'
#' This function will read a Bruker 1D NMR data set and return the pieces.
#' Currently only processed data can be read.
#'
#' @param file Character.  The path to the `pdata` file.
#'
#' @return COMPLETE THIS!
#'
#' @author Bryan A. Hanson
#'
#' @export
#' @importFrom reticulate source_python
#'
import_Bruker_1D_NMR <- function(file) {

  import_pdata <- NULL # satisfy check process

  if (!exists(file)) stop("Can't find the file specified")

  # Load local Python function
  file1 <- system.file("inst/import_1D_pdata.py", package = "readBrukerNMR")
  source_python(file1) # make it available

  return(import_pdata(file))
}