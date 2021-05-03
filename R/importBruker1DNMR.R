#'
#' importBruker1DNMR
#'
#' This function will read a Bruker 1D NMR data set and return the pieces.
#' Currently only processed data can be read.
#'
#' @param file Character.  The path to the `pdata` file.
#'
#' @return
#'
#' @author Bryan A. Hanson
#'
#' @export
#'
#'
importBruker1DNMR <- function(file) {
  if (!exists(file)) stop("Can't find the file specified")
  source_python("import_pdata.py") # get the python function
  return(import_pdata(file))
}