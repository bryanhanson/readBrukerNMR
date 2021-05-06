#'
#' Provide Information About the Python Configuration
#'
#' Report on the Python configuration.  Similar in spirit and use to
#' `sessionInfo`.
#'
#' @param silent Logical. If `TRUE`, do not print results or progress to console.
#' 
#' @return Invisibly, a named logical vector giving the success or not of finding
#'         and possibly installing the modules of interest.
#'
#' @author Bryan A. Hanson, hanson@@depauw.edu
#' 
#' @export
#'
#' @importFrom reticulate py_config use_virtualenv
#'
python_session_info <- function(silent = FALSE) {

  use_virtualenv("r-reticulate") # if there isn't a virtualenv, this will set it up

  # Check for python3
  p3_path <- py_config()[1]
  if (p3_path == "") stop("You need to have Python version 3 installed to use this package")
  if (!silent) message("\nFound Python3 at ", p3_path)

  # Check to which Python modules are installed
  jnk <- check_for_python_modules(silent = FALSE, install = FALSE)
}
