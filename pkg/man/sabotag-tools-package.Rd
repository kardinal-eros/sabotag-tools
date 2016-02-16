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
Arbeitsgemeinschaft« \href{http://www.hausdernatur.at/sabotag.html}{(SaBotAg)}

The package has  the following functionality.

\itemize{
  \item Create mapping grid for the recording of the vascular plant flora in
  Central Europe (\dQuote{Kartierung der Flora Mitteleuropas}) according to Niklfeld 
  (1978); in Austria generally known as »Raster der floristischen Kartierung« 
  or briefly \dQuote{(Floren-)Quadranten}.
  \item Query cell identifier (\dQuote{Quadranten-Nummer}) of mapping grid by 
  providing coordinates.
  \item \code{\link{safapi}}: query locality description (reverse geocoding) using Albin Blaschka's 
  private server.
  \item \code{\link{zobodat}}: query \href{http://www.zobodat.at/belege.php}{Zobodat} voucher data base.
  \item \code{\link{bergfex}}: query \href{http://www.bergfex.at}{Bergfex} server for Austrian toponyms.
}
}
\author{
Maintainer: Roland Kaiser \email{kardinal.eros@gmail.com}
}

\keyword{ package }
\keyword{ spatial }
