\name{gridcell2lnglat}
\alias{gridcell2lnglat}

\title{
Query Grid Identifier for Coordinates
}

\description{
The function returns a longitude and latitude coordinate pair based on the grid identifier.
}

\usage{
gridcell2lnglat(x)
}

\arguments{
  \item{x}{
    Character. A grid cell identifier, e.g. \verb{"8144-3"}.
}
}

\value{
A two-column matrix. First column is longitude, second latitude.
}

\references{
Niklfeld, H. (1971): Bericht über die Kartierung der Flora Mitteleuropas. Taxon 20: 545-571.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{floragrid}}, \code{\link{lnglat2gridcell}}
}

\examples{
# test against floragrid()
x <- floragrid(extent(12, 13, 47, 48))

# the function returns the exact same center points
xx <- gridcell2lnglat(x$GRIDCELL)

plot(x)

points(xx)
}

\keyword{ spatial }

