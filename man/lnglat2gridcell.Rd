\name{lnglat2gridcell}
\alias{lnglat2gridcell}

\title{
Query Coordinates for Grid Identifier
}

\description{
The function returns the grid identifier based on a longitude and latitude coordinate pair.
}

\usage{
lnglat2gridcell(x, y)
}

\arguments{
  \item{x}{
Longitude in decimal degrees.
}
  \item{y}{
Latitude in decimal degrees.
}
}

\value{
A \verb{character} vector.
}

\references{
Niklfeld, H. (1971): Bericht über die Kartierung der Flora Mitteleuropas. Taxon 20: 545-571.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{floragrid}}, \code{\link{gridcell2lnglat}}
}

\examples{
lnglat2gridcell(13, 47)

data(sbg)
xy <- coordinates(sbg)
d <- data.frame(t(apply(xy, 1, function (x) lnglat2gridcell(x[ 1 ], x[ 2 ]) ) ),
                stringsAsFactors = FALSE)

all(as.character(sbg$GRIDCELL) == as.character(d$GRIDCELL))
}

\keyword{ spatial }

