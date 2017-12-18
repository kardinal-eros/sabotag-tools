\name{sabotag-package}
\alias{sabotag-package}
\alias{sabotag}
\docType{package}

\title{
\packageTitle{sabotag}
}

\description{
An R-package providing tools for the Salzburger Botanische Arbeitsgemeinschaft
(SaBotAg)
}

\details{
An R-package providing tools for the »Salzburger Botanische
Arbeitsgemeinschaft« \href{http://www.hausdernatur.at/sabotag.html}{(SaBotAg)}.
It is aimed at those botanists who are concerned with floristic mapping.

The package has the following functionality.

\itemize{
  \item
    \code{\link{floragrid}}: 
    Create mapping grid for the recording of the vascular plant flora in
    Central Europe (\dQuote{Kartierung der Flora Mitteleuropas}) according to
    Niklfeld (1978); in Austria generally known as »Raster der floristischen
    Kartierung« or briefly \dQuote{(Floren-)Quadranten}.
  \item
    \code{\link{lnglat2gridcell}}:
    Query cell identifier (\dQuote{Quadranten-Nummer}) of mapping grid by 
    providing coordinates.
  \item
    \code{\link{elevation}}: query \href{http://www.open-elevation.com}{Open-Elevation}
    server for elevation data.
  \item
    \code{\link{nominatim2}}: query \href{http://www.wiki.openstreetmap.org/wiki/Nominatim}{OpenStreetMap}
    server for locality descriptions.
  \item
    \code{\link{zobodat}}: query \href{http://www.zobodat.at/belege.php}{Zobodat}
    voucher data base.
  \item
    \code{\link{bergfex}}: query \href{http://www.bergfex.at}{Bergfex}
    server for Austrian toponyms.
  \item
    \code{\link{safapi}}: query locality description (reverse geocoding) using
    Albin Blaschka's private server.
}
}

\author{
Maintainer: Roland Kaiser \email{kardinal.eros@gmail.com}
}

\keyword{ package }
\keyword{ spatial }

