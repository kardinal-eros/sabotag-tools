sabotag
=======

An R-package providing tools for the »Salzburger Botanische Arbeitsgemeinschaft« [(SaBotAg)](http://www.hausdernatur.at/sabotag.html): dedicated to Austrian
botanists and friends around.

Build status
------------

[![Travis-CI Build Status](https://travis-ci.org/kardinal-eros/sabotag-tools.svg?branch=master)](https://travis-ci.org/kardinal-eros/sabotag-tools)
<!-- [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sabotag-tools)](http://cran.r-project.org/package=sabotag-tools) -->
<!-- Rd2markdown("/Users/roli/Documents/sabotag-tools/man/sabotag-tools-package.Rd", "/Users/roli/Documents/sabotag-tools/package.md") -->

Details
-------


An R-package providing tools for the »Salzburger Botanische Arbeitsgemeinschaft« [(SaBotAg)](http://www.hausdernatur.at/sabotag.html).
The software is aimed at botanists concerned with floristic mapping. The package provides classes to handle distribution and map background data built upon packages sp and raster. Time is managed properly, as well as customizable symbology.
 
 The package has the following functionality.
 

*    [`floragrid`](floragrid.html) and [`floragridlines`](floragridlines.html) : Create mapping grid for the recording of the vascular plant flora in Central Europe ( list("Kartierung der Flora Mitteleuropas") ) according to Niklfeld (1971); in Austria generally known as list("Raster der floristischen\n", "    Kartierung") or briefly list("(Floren-)Quadranten") .  

*    [`lnglat2gridcell`](lnglat2gridcell.html) : Query grid cell identifier ( list("Quadranten-Nummer") ) of mapping grid by providing coordinates.  

*    [`gridcell2lnglat`](gridcell2lnglat.html) : Query coordinates of mapping grid by providing by grid cell identifier  

*    [`formatGridcell`](formatGridcell.html) and [`deparseGridcell`](deparseGridcell.html) : Work with grid cell identifier.  

*    [`background`](background.html) : Configure a map background with topography, waterbodies and mapping grid just by passing a map extent. This functions uses data sets provided by package [`sabotagdata`](https://github.com/kardinal-eros/sabotag-data).  

*    [`occurrences`](occurrences.html) : Distribution data with associated plot methods.  

*    [`pretty`](pretty.html) : Find nice interval in grid schema (`floragrid`).  

*    [`ticks`](occurrences.html) : Draw ticks based on `floragrid`.  

*    [`margin`}(margin.html) and [`labelmargin`](labelmargin) : Annotate plot margins.  

*    [`elevation`](elevation.html) : query [Open-Elevation](http://www.open-elevation.com)  server for elevation data.  

*    [`nominatim2`](nominatim2.html) : query [OpenStreetMap](http://www.wiki.openstreetmap.org/wiki/Nominatim)  server for locality descriptions.  

*    [`zobodat`](zobodat.html) : query [Zobodat](http://www.zobodat.at/belege.php) voucher data base.  

*    [`bergfex`](bergfex.html) : query [Bergfex](http://www.bergfex.at) server for Austrian toponyms.  

*    [`safapi`](safapi.html) : query locality description (reverse geocoding) using Albin Blaschka's private server. 

See the example [`here`](https://github.com/kardinal-eros/sabotagmaps/blob/master/example.md) get an idea of what can be achieved with the package.


Author
------


 Maintainer: Roland Kaiser kardinal.eros@gmail.com 


References
----------


 Niklfeld, H. (1971): Bericht über die Kartierung der Flora Mitteleuropas. Taxon 20: 545-571




Installation
------------

You may directly install the package from GitHub using the below set of commands.

```R
# if not already installed
install.packages("devtools")
library(devtools)

#	install packge from github
install_github("kardinal-eros/sabotag-tools")

library(sabotag)
```

References
----------

Niklfeld, H. (1978): Grundfeldschlüssel für die Kartierung der Flora Mitteleuropas, südlicher Teil (= Zentralstelle für Florenkartierung, Inst. Bot. Univ. Wien). Wien.