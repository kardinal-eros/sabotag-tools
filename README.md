sabotag
=======

An R-package providing tools for the »Salzburger Botanische Arbeitsgemeinschaft« [(SaBotAg)](http://www.hausdernatur.at/sabotag.html)

The package has  the following functionality.

+ Create mapping grid for the recording of the vascular plant flora in Central Europe (»Kartierung der Flora Mitteleuropas«) according to Niklfeld (1978); in Austria generally known as »Raster der floristischen Kartierung« or briefly »(Floren-)Quadranten«.
+ Query cell identifier (»Quadranten-Nummer«) of mapping grid by providing coordinates.
+ Query locality description (reverse geocoding) using Albin Blaschka's private server.
+ Query [Zobodat](http://www.zobodat.at/belege.php) voucher data base.

Installation
------------

You may directly install the package from GitHub using the below set of commands.

```R
# if not already installed
install.packages("devtools")
install.packages("raster")

library(devtools)
library(raster)

#	install packge from github
install_github("kardinal-eros/sabotag-tools/pkg")

library(sabotag)
```

References
----------

Niklfeld, H. (1978): Grundfeldschlüssel für die Kartierung der Flora Mitteleuropas, südlicher Teil (= Zentralstelle für Florenkartierung, Inst. Bot. Univ. Wien). Wien.