\name{sabotag-package}
\alias{sabotag-package}
\alias{sabotag}
\docType{package}

\alias{pdf-methods}

\title{
\packageTitle{sabotag}
}

\description{
Utilities mainly useful in floristic mapping, herbarium digitizing (geocoding) and data base maintenance.
}

\details{
An R-package providing tools for the »Salzburger Botanische
Arbeitsgemeinschaft« \href{http://www.hausdernatur.at/sabotag.html}{(SaBotAg)}.
It is aimed at botanists concerned with floristic mapping. The packages
provides classes to handle distribution data. They are explicitly
\emph{Spatial} and built upon packages \sQuote{sp} and \sQuote{raster}.
Time is managed properly, as well as customizable symbology.

The package has the following functionality.

\itemize{
  \item
    \code{\link{floragrid}} and \code{\link{floragridlines}}: 
    Create mapping grid for the recording of the vascular plant flora in
    Central Europe (\dQuote{Kartierung der Flora Mitteleuropas}) according to
    Niklfeld (1971); in Austria generally known as \dQuote{Raster der floristischen
    Kartierung} or briefly \dQuote{(Floren-)Quadranten}.
  \item
    \code{\link{lnglat2gridcell}}:
    Query grid cell identifier (\dQuote{Quadranten-Nummer}) of mapping grid by 
    providing coordinates.
  \item
    \code{\link{gridcell2lnglat}}:
    Query coordinates of mapping grid by providing grid cell identifier
  \item
    \code{\link{formatGridcell}} and \code{\link{deparseGridcell}}:
    Work with grid cell identifier.
  \item
    \code{\link{background}}:
    Configure a map background with topography, waterbodies and mapping grid
    just by passing a map extent. This functions uses data set provided by
    package \verb{sabotagdata}.
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

\references{
Niklfeld, H. (1971): Bericht über die Kartierung der Flora Mitteleuropas. Taxon 20: 545-571 
}

\author{
Maintainer: Roland Kaiser \email{kardinal.eros@gmail.com}
}

\keyword{ package }
\keyword{ spatial }

