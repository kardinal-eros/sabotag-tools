sabotag R-package
=================

![](README.png)

An R-package providing tools for the »Salzburger Botanische Arbeitsgemeinschaft« [(SaBotAg)](http://www.hausdernatur.at/sabotag.html)

The package has  the following functionality.

+ Create mapping grid according to Niklfeld (1978).
+ Query cell identifier with coordinates.

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