#'
#' @noRd
#' @importFrom reticulate import py_module_available
#'
.onLoad <- function(libname, pkgname) {

  install_instructions <- paste(
    "\n\n",
    "\nYou need to install the nmrglue Python module as follows:\n",
    "\tlibrary('reticulate')\n",
    "\tuse_virtualenv('r-reticulate')\n",
    "\tpy_install('nmrglue', envname = 'r-reticulate')\n",
    "\tand when the install process is done, try again with:\n",
    "\tlibrary('readBrukerNMR)\n\n")

  if (!py_module_available("nmrglue")) stop(install_instructions)

  # Import nmrglue to global environment (lazily)
  ng <<- import("nmrglue", delay_load = TRUE)
}