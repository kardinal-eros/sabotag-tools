\name{extent2polygon}
\alias{extent2polygon}

\title{
Utility Functions.
}

\description{
Convert extent to Polygon.
}

\usage{
extent2polygon(extent, p4s = "+init=epsg:4326")
}

\arguments{
  \item{extent}{
Objects of class \verb{Extent} as defined in package \pkg{raster}.
}
  \item{p4s}{
CRS.
}
}

\value{
A \verb{SpatialPolygons} object.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{floragrid}}
}

\keyword{ spatial }
\keyword{ database }
