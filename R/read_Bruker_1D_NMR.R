#'
#' Read Processed Bruker 1D NMR Data Sets
#'
#' This function will read a *processed *Bruker 1D NMR data set and return the contents.
#' Wraps a Python script using the
#' functions of the [`nmrglue`](https://github.com/jjhelmus/nmrglue/) module.
#'
#' @param directory Character.  The path to an experiment in the `pdata` directory.
#'        See the example for a typical path.
#'
#' @return A list with elements `metadata`, `x`, and `y`.
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
#'   xlim = c(5.5, 3), ylim = c(0, 6e4),
#'   xlab = "ppm", ylab = "intensity",
#'   main = expression(Melibiose~phantom()^1*H~NMR~(BMRB~Entry~bmse000233)))
#' 
read_Bruker_1D_NMR <- function(directory) {

  read_1D_pdata <- NULL # satisfy "no visible binding"

  if (!dir.exists(directory)) stop("Can't find the specified directory")

  # Load local Python function & run it
  py_func_file <- system.file("read_1D_pdata.py", package = "readBrukerNMR")
  source_python(py_func_file)
  return(read_1D_pdata(directory))
}