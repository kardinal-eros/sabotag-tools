\name{bergfex}
\alias{bergfex}

\title{
Locality Description for Bergfex.at Webpage
}
\description{
Query \url{http://www.bergfex.at} server to get locality description for a given longitude and latitude.
}
\usage{
bergfex(lng, lat, q, sp = TRUE, first = FALSE)
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
If \verb{TRUE} return spatial object as defined in \pkg{sp}; needs package \pkg{rdal}.
}
  \item{first}{
If \verb{TRUE} return only a single hit, the top most (nearby) one.
}
}
\details{
Nothing here yet.
}
\value{
A \verb{list} or \verb{SpatialPointsDataFrame} with \code{CRS("+init=epsg:4326")}.
}
\author{
Roland Kaiser
}
\seealso{
\code{\link{bergfex}}
}
\examples{
r <- bergfex(lng = 14.642202, lat = 47.530278, sp = FALSE)
class(r)
str(r)

r <- bergfex(lng = 14.642202, lat = 47.530278)
class(r)
head(r@data)

bergfex(lng = 14.642202, lat = 47.530278, first = TRUE, sp = FALSE)

r <- bergfex(q = "Kölblalm")
head(r@data)
coordinates(r)

bergfex(q = "Schwaitlalm", sp = FALSE, first = TRUE)
}
\keyword{ spatial }
\keyword{ database }
