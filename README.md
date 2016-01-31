sabotag
=============

An R-package providing tools for the Salzburger Botanische Arbeitsgemeinschaft (SaBotAg).

The package provides the following functionality.

+ Create mapping grid according to Niklfeld (1978).
+ Query coordinates for cell of mapping grid.

Installation
------------

You may directly install the package from GitHub using the below set of commands.

```R
# if not already installed
install.packages("devtools")
install.packages("raster")

library(devtools)
library(raster)

#	install dependency vegsoup from github mirror
install_github("kardinal-eros/sabotag/pkg")

library(sabotag)
```

References
----------

Niklfeld, H. (1978): Grundfeldschlüssel für die Kartierung der Flora Mitteleuropas, südlicher Teil (= Zentralstelle für Florenkartierung, Inst. Bot. Univ. Wien). Wien.