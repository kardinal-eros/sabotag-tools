R CMD build --no-build-vignettes /Users/roli/Documents/sabotag-tools/pkg
R CMD check sabotag_0.1-1.tar.gz
R CMD INSTALL -l /Users/roli/Library/R/3.2/library sabotag_0.1-1.tar.gz
