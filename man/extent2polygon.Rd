\name{extent2polygon}
\docType{methods}

\alias{extent2polygon}
\alias{extent2polygon,Background-method}
\alias{extent2polygon,Extent-method}
\alias{extent2polygon,Raster-method}
\alias{extent2polygon,RasterLayer-method}


\title{
Utility Functions.
}

\description{
Convert extent to Polygon.
}

\usage{
extent2polygon(object, ...)

\S4method{extent2polygon}{Background}(object, ...)
}

\arguments{
  \item{object}{
    Objects of class \verb{Extent} as defined in package \pkg{raster}, or
    Object of class \verb{Background}. Returns \verb{layers(object)$extent}
    as polygon.
}
  \item{...}{
    \verb{proj4string}, pased to \code{\link[sp:CRS]{CRS}}.
}

}

\value{
A \verb{SpatialPolygons} object.
}

\author{
Roland Kaiser
}
\examples{
extent2polygon(extent(12,13,47,48))

x <- background(extent(12,13,47,48))
extent2polygon(x)
}
\seealso{
\code{\link{floragrid}}
}

\keyword{ spatial }
\keyword{ database }
