\name{floragrid}
\alias{floragrid}
\alias{floragridlines}

\title{
Create Grid Based on Extent
}

\description{
Create grid based on extent object defined in package \link[raster]{raster-package}.
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
The mapping scheme for the recording of the (vascular plant) flora of Central Europe (\dQuote{Kartierung der Flora Mitteleuropas}) according to Niklfeld (1971) has two levels. The basic unit is the so called \emph{\sQuote{Grundfeld}} or \emph{grid unit}. It measures 10 × 6 degrees in geographic coordinates. Each cell of this grid is further subdivided into four \emph{\sQuote{Quadranten}} or \emph{grid cells} in the shape of 5 × 3 degrees.

A specific grid cell (\sQuote{Quadrant}) is identified with a custom character coding scheme with six digits (characters): eg. 8144-3. Note, this holds true only for positions north of 46 degree latitude (e.g. Udine, Italy). Further south the identifier expands to seven digits. Nevertheless, for the target region for which this coding schem was invented, the first and second position signify the horizontal (west-eat) row, the third und forth position encode the vertical (north-south) column. After a separator character (e.g dash "-" or slash "/" ) an indication of a specific grid cell of a grid unit is given with numbers 1 to 4 (1 = northwest, 2 = northeast, 3 = southwest, 4 = southeast). Displaying distribution data at the \emph{grid unit} level is suitable for small scale maps (eg. Central Europe). Most applications performed on particular regions of Central Europe, however, use the resolution of grid cells (large scale).
}

\value{
\verb{floragrid} returns a SpatialPolygonsDataFrame with colums \verb{'GRIDCELL', 'GRID'} and \verb{'CELL'}. \verb{floragridlines} returns a SpatialLines object depicting only the grid as lines usefull for plotting.
}

\references{
Niklfeld, H. (1971): Bericht über die Kartierung der Flora Mitteleuropas. Taxon 20: 545-571 
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

