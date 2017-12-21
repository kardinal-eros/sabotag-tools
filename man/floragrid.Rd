\name{floragrid}
\alias{floragrid}
\alias{floragridlines}
\alias{ticks}

\title{
Create Grid Based on Extent
}

\description{
Create grid based on \sQuote{Extent} object. See \link[raster]{extent} to create such objects. It is handy to pass a vector in the order: \verb{xmin, xmax, ymin, ymax} to this function (see \sQuote{Examples}).
}

\usage{
floragrid(extent, resolution = "CELL")

floragridlines(extent, resolution = "CELL", frame = TRUE, coarse = FALSE)

ticks(extent, resolution = "GRID", coarse = FALSE)
}

\arguments{
  \item{extent}{
An object where an \verb{extent} method exists or a Spatial* object defined in package \pkg{sp}.
}
  \item{resolution}{
    One of \verb{"GRID"} or \verb{"CELL"}. The defaults are appropriate in most cases.
}
  \item{frame}{
    If \verb{FALSE} do not return lines of the encompassing border frame. This
    \emph{frame} for plotting purposes can in any case be obtained by
    \verb{extent2polygon(object)}.
}
  \item{coarse}{
    Only grid lines at degree in whole numbers.
}
}

\details{
The mapping scheme for the recording of the (vascular plant) flora of Central Europe (\dQuote{Kartierung der Flora Mitteleuropas}) according to Niklfeld (1971) has two levels. The basic unit is the so called \emph{\sQuote{Grundfeld}} or \emph{grid unit}. It measures 10 × 6 degrees in geographic coordinates. Each cell of this grid is further subdivided into four \emph{\sQuote{Quadranten}} or \emph{grid cells} in the shape of 5 × 3 degrees. Compared to figures in Niklfeld (1971) the domain for which this grid was developed is in the bounding box of \verb{extent(5.666667, 19.16667, 45, 55)}.

A specific grid cell (\emph{\sQuote{Quadrant}}) is identified with a custom character coding scheme with six digits (characters): e.g. \dQuote{8144-3}. Note, this holds true only for positions north of 46 degree latitude (e.g. Udine, Italy). Further south the identifier expands to seven digits, because row numbers become 100 and higher further south. Nevertheless, for the target region Austria, the first and second position signify the horizontal row (increasing from west to east), the third und forth position encode the vertical column (north to south). After a separator character (e.g dash \dQuote{-} or slash \dQuote{/} ) an indication of a specific grid cell of a grid unit is given with numbers 1 to 4, where: 1 = northwest, 2 = northeast, 3 = southwest, and 4 = southeast. Displaying distribution data at the \emph{grid unit} level is suitable for small scale maps (eg. Central Europe). Most applications performed on particular regions of Central Europe, however, use the resolution of grid cells (large scale).

Function \verb{ticks} can be used to create inward ticks along the extent.

Note, the default resolution of function \verb{floragrid} is \verb{CELL}. This is because the function can't calculate grid cell identifiers at resolution \verb{GRID}.
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
# start from Extent or Spatial* object
data(sbg)
e <- extent(sbg)
class(e)
floragrid(e)
floragrid(sbg)

plot(floragrid(e))
plot(sbg, add = TRUE, col = 2)


# validate maximum grid extent to ensure a 6 digit (including seperator)
# grid cell identifier. 2 digits per row and column respectively.
g <- floragrid(extent(5.83333333, 22.33333, 46, 55.9), "GRID")

# compute additional components ROW and COLUMN
x <- deparseGridcell(g$GRIDCELL)
head(x)

# inspect values 
i <- sort(x[, 2]) # GRIDCELL is in column 2
head(i); tail(i)

# check range of values
range(x[, 4]) # rows
range(x[, 5]) # columns

# plot this on a map
# note, Switzerland is not enterely coverd as is Slovakia
require(maps)
plot(extent2polygon(extent(g)), border = 2) # plot just the bounding box
map(database = "world", add = TRUE)
i1 <- range(g$GRID)[ 1 ] # top left, first row, first column
i2 <- range(g$GRID)[ 2 ] # bottom right, last row, last colum
plot(g[g$GRID == i1, ], col = 1, add = TRUE)
plot(g[g$GRID == i2, ], col = 1, add = TRUE)
text(g[g$GRID == i1, ], labels = i1, pos = 3)
text(g[g$GRID == i2, ], labels = i2, pos = 1)

# grid units on the territory of Austria
# get all grid units touched by Austrian administrative boundaries
# (land survey register of Austria, highest precision data)
data("BEV", package = "sabotagdata")

# spatial overlay and subset
# grid units outside of Austria are marked as 'NA'
gg <- over(g, BEV)
gg <- g[ !is.na(gg[, 1]), ]
# be patient, spatial query takes some seconds
# note, simplified country borders don't meet accuracy requirements
plot(gg, add = TRUE)

# drop grid only at wohle numbres of degrees
l <- floragridlines(g, "GRID", coarse = TRUE)
lines(l)

# add axes
axis(1, at = seq(ceiling(extent(g))[ 1 ], floor(extent(g))[ 2 ], by = 2))
axis(2, at = seq(ceiling(extent(g))[ 3 ], floor(extent(g))[ 4 ], by = 2))

# ticks
ticks(extent(g))

# note, Spatial* objects can be saved as ESRI Shapefile
# see ?readOGR for details
\dontrun{
writeOGR(g, "foo", "foo", driver = "ESRI Shapefile")
}
}

\keyword{ spatial }

