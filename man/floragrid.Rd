\name{floragrid}
\alias{floragrid}

\title{
Create Grid Based on Extent
}

\description{
Create grid based on extent object defined in package \pkg{raster}.
}

\usage{
floragrid(extent, resolution = "CELL")
}

\arguments{
  \item{extent}{
An object where an \verb{extent} methods existst or a Spatial* object befined in package \pkg{sp}.
}
  \item{resolution}{
One of \verb{"GRID"} or \verb{"CELL"}.
}

}

\details{
Nothing here yet.
}

\value{
\verb{SpatialPolygonsDataFrame}.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{lnglat2gridcell}}
}

\examples{
data(sbg)
e <- extent(sbg)
class(e)
floragrid(e)
floragrid(sbg)

plot(floragrid(e))
plot(sbg, add = TRUE, col = 2)
}

\keyword{ spatial }

