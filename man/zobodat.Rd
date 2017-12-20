\name{zobodat}
\alias{zobodat}
\alias{zobodat.csv}

\title{
Data From the Zobodat Database
}

\description{
Query Zobodat voucher database (\url{http://www.zobodat.at}) and convert downloaded CSV-file to \verb{SpatialPointsDataFrame}.
}

\usage{
zobodat.csv(x)

zobodat(genus, species, file)
}

\arguments{
  \item{x}{
File path.
}
  \item{genus}{
Genus.
}
  \item{species}{
Species.
}
  \item{file}{
Filename.
}
}

\details{
The function discards all observations where coordinates are missing.
}

\value{
\verb{SpatialPointsDataFrame}.
}

\author{
Roland Kaiser
}

\seealso{
  \code{\link[dismo]{gbif}} in package \pkg{dismo}
}

\examples{
\dontrun{
r <- zobodat("Poa", "pratensis")

require(maps)
map(region ="Austria")
points(r)
}
}

\keyword{ spatial }
\keyword{ database }

