.onLoad <- function(libname, pkgname) {

  message("Checking for Python resources & setting up the environment")

  # Check for python3
  p3_path <- Sys.which("python3")
  if (p3_path == "") stop("You need to have Python version 3 installed to use this package")
  message("Found Python3 at ", p3_path)

  # Set up virtual environment
  message("Setting up a virtual environment")
  virtualenv_create("r-reticulate", python = p3_path)

  # Check to see if needed Python modules are installed
  p_modules <- system2("pip", "list", stdout = TRUE)
  needed_modules <- c("numpy", "scipy", "nmrglue")
 
  # there is also py_module_available but it does not report versions

  for (i in 1:length(needed_modules)) {
    message("Checking for ", needed_modules[i])
    avail <- grep(needed_modules[i], p_modules)
    if (avail != 0) {
      message(p_modules[avail], " is installed")
      virtualenv_install("r-reticulate", needed_modules[i])
    }
    if (avail == 0) {
    message(needed_modules[i], " is not installed on this computer, installing")
    py_install(needed_modules[i])
    }
  }

  # Import nmrglue to global environment
  ng <<- reticulate::import("nmrglue", delay_load = TRUE)

  message("All set!")
}