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
#' @examples
#' data_dir <- system.file("extdata/bmse000233/nmr/set01/1H/pdata/1",
#'   package = "readBrukerNMR")
#' demo <- read_Bruker_1D_NMR(data_dir)
#' plot(demo$x, demo$y, type = "l",
#'   xlim = c(5.5, 3), ylim = c(0, 6e4)
#'   xlab = "ppm", ylab = "intensity")
#' 
read_Bruker_1D_NMR <- function(directory) {

  read_1D_pdata <- NULL # satisfy check process

  if (!dir.exists(directory)) stop("Can't find the specified directory")

  # Load local Python function
  py_func_file <- system.file("read_1D_pdata.py", package = "readBrukerNMR")
  source_python(py_func_file) # make it available
  return(read_1D_pdata(directory))
}