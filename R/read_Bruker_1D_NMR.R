#'
#' Read Bruker 1D NMR Data Sets
#'
#' This function will read a Bruker 1D NMR data set and return the pieces.
#' Currently only processed data can be read.
#'
#' @param directory Character.  The path to the `pdata` file.
#'
#' @return COMPLETE THIS!
#'
#' @author Bryan A. Hanson
#'
#' @export
#' @importFrom reticulate source_python
#'
read_Bruker_1D_NMR <- function(directory) {

  read_1D_pdata <- NULL # satisfy check process

  if (!dir.exists(directory)) stop("Can't find the specified directory")

  # Load local Python function
  py_func_file <- system.file("read_1D_pdata.py", package = "readBrukerNMR")
  source_python(py_func_file) # make it available
  return(read_1D_pdata(directory))
}