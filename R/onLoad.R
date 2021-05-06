#'
#' @noRd
#' @importFrom reticulate import
#'
.onLoad <- function(libname, pkgname) {

  # Import nmrglue to global environment (lazily)
  ng <<- import("nmrglue", delay_load = TRUE)

}