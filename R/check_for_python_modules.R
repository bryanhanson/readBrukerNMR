#'
#' Look for Needed Python Modules and Optionally Install Them into a Virtual Environment
#'
#' This function will check to see if the Python modules `numpy`,
#' `scipy`, and `nmrglue` are installed, and optionally, install them into the
#' virtual environment `r-reticulate`.
#' 
#' @param silent Logical. If `TRUE`, do not print results or progress to console.
#' 
#' @param install Logical.  If `TRUE`, install `numpy`, `scipy`, or `nmrglue`
#'        modules if missing.
#'
#' @return Invisibly, a named logical vector giving the success (or not) of finding
#'         and possibly installing the modules of interest.
#' 
#' @author Bryan A. Hanson, hanson@@depauw.edu
#' 
#' @export
#'
#' @importFrom reticulate py_install py_module_available use_virtualenv
#'
check_for_python_modules <- function(silent = FALSE, install = FALSE) {

  needed_modules <- c("numpy", "scipy", "nmrglue")
  success <- rep("FALSE", length(needed_modules))
  names(success) <- needed_modules

  use_virtualenv("r-reticulate") # if there isn't a virtualenv, this will set it up
  
  # Note: py_module_available checks to see if the module can be imported
  # It appears this is not simply the same as being installed
  # Perhaps a buglet in py_module_available ???
  # See https://github.com/rstudio/reticulate/issues/838 for something similar

  # Check and install needed_modules as instructed
  for (i in 1:length(needed_modules)) {
    if (!silent) message("\nChecking for ", needed_modules[i], ":")
    installed <- py_module_available(needed_modules[i])

    if (installed) {
      if (!silent) message("\t", needed_modules[i], " is available")
      success[i] <- TRUE
    }

    if (!installed) {
      if (!silent) message("\t", needed_modules[i], " is not available")
      if (install) {
        if (!silent) message("Installing ", needed_modules[i])
        py_install(needed_modules[i], envname = "r-reticulate")
        success[i] <- TRUE
      }
	}
  } # end of main loop

  invisible(success)
}
