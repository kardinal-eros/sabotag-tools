\name{floragrid}
\alias{floragrid}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create Grid Based on Extent
}
\description{
Create grid based on extent object defined in package \pkg{raster}.
}
\usage{
floragrid(extent)
}

\arguments{
  \item{extent}{
An object where an \verb{extent} methods extrist or a Spatial* object bdefined in package \pkg{sp}.
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

