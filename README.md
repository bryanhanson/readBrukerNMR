[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

<!-- [![Downloads](https://cranlogs.r-pkg.org/badges/readBrukerNMR)](https://cran.r-project.org/package=readBrukerNMR) -->

## readBrukerNMR -- Read Bruker NMR Data Sets.

Read in Bruker NMR (Nuclear Magnetic Resonance) data.  Currently only reads processed data. Built around the Python ['nmrglue'](https://github.com/jjhelmus/nmrglue/) module by JJ Helmus. Includes a data set from [BMRB](https://bmrb.io/) with permission for demonstration and testing. The included data are 1H and 13C NMR spectra of the disaccharide melibiose.  These spectra are a portion of the [bmse000233 data set](https://bmrb.io/metabolomics/mol_summary/show_data.php?id=bmse000233) hosted at the [Biological Magnetic Resonance Data Bank](https://dx.doi.org/10.1093/nar/gkm957) (used with permission).

## How to install readBrukerNMR

<!-- ### From CRAN using R:

````r
chooseCRANmirror() # choose a CRAN mirror
install.packages("readBrukerNMR")
library("readBrukerNMR")
```` -->

### To install from Github using R:

````r
install.packages("remotes")
library("remotes")
install_github(repo = "bryanhanson/readBrukerNMR@master")
library("readBrukerNMR")
````
If you use `@devel` you can get the development branch if it is available (and there may be other branches out there too).  Development branches have new, possibly incompletely tested features.  They may may also not be ready to pass checks and thus may not install automatically using the method above.  Check the news file to see what's up.

### License Information

`readBrukerNMR` is distributed under the GPL-3 license, as stated in the DESCRIPTION file.  For more info, see the [GPL site.](https://www.gnu.org/licenses/gpl.html)

Questions?  hanson@depauw.edu
