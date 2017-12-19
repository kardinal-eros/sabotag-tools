\name{floragrid}
\alias{floragrid}
\alias{floragridlines}

\title{
Create Grid Based on Extent
}

\description{
Create grid based on extent object defined in package \pkg{raster}.
}

\usage{
floragrid(extent, resolution = "CELL")

floragridlines(extent, resolution = "CELL", frame = TRUE)
}

\arguments{
  \item{extent}{
An object where an \verb{extent} methods existst or a Spatial* object befined in package \pkg{sp}.
}
  \item{resolution}{
One of \verb{"GRID"} or \verb{"CELL"}.
}
  \item{frame}{
If \verb{FALSE} do not return lines of the encompassing border frame.
}
}

\details{
Nothing here yet.	
}

\value{
\verb{floragrid} returns a SpatialPolygonsDataFrame with colums \verb{'GRIDCELL', 'GRID'} and \verb{'CELL'}. \verb{floragridlines} returns a SpatialLines object depicting only the grid as lines usefull for plotting.
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

