\name{bergfex}
\alias{bergfex}
\alias{bergfex2}

\title{
Locality Descriptions from Web Services
}

\description{
Query \href{http://www.bergfex.at}{Bergfex} server to get locality description for a given longitude and latitude, or query toponym for coordinates. 
}

\usage{
bergfex(lng, lat, q, sp = FALSE, first = FALSE)

bergfex2(x, first = TRUE)
}

\arguments{
  \item{lng}{
Latitude. Geographic coordinates (e.g. 14.136882)
}
  \item{lat}{
Longitude. Geographic coordinates (e.g. 47.510895)
}
  \item{q}{
Query string.
}
  \item{sp}{
If \verb{TRUE} return spatial object as defined in \pkg{sp}.
}
  \item{first}{
If \verb{TRUE} return only a single hit, the top most (nearby) one.
}
  \item{x}{
Object of class \verb{SpatialPointsDataFrame}.
}
}

\details{
Function \verb{bergfex} provides a single coordinate pair interface. \verb{bergfex2} allows the query to be based on a \verb{SpatialPointsDataFrame}.
 
}

\value{
A \verb{list} or \verb{SpatialPointsDataFrame} with \code{CRS("+init=epsg:4326")}.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{geocode.austria}}
}

\examples{
\dontrun{	
r <- bergfex(lng = 14.642202, lat = 47.530278, sp = FALSE)
class(r)
str(r)

r <- bergfex(lng = 14.642202, lat = 47.530278, sp = TRUE)
class(r)
head(r@data)

bergfex(lng = 14.642202, lat = 47.530278, first = TRUE, sp = FALSE)

r <- bergfex(q = "Kölblalm", sp = TRUE)
head(r@data)
coordinates(r)

bergfex(q = "Schwaitlalm", sp = FALSE, first = TRUE)

x <- data.frame(accuracy = 10, x = 13:16, y = 48)
coordinates(x) <- ~x+y
proj4string(x) <- CRS("+init=epsg:4326")

bergfex2(x)
}
}

\keyword{ spatial }
\keyword{ database }

