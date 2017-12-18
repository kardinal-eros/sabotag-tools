\name{elevation}
\alias{elevation}

\title{
Returns the Elevation Obtained from Open-Elevation API
}

\description{
Query \url{https://open-elevation.com} server to get elevation for a given longitude and latitude from the SRTM version 4.1 dataset at spatial resolution: 30 Arc-Seconds equivalent to 250 meters.
}

\usage{
elevation(lng, lat, x, sp = FALSE)
}

\arguments{
  \item{lng}{
Latitude. Vector of Geographic coordinates (e.g. 14.136882)
}
  \item{lat}{
Longitude. Vector of Geographic coordinates (e.g. 47.510895)
}
  \item{x}{
Object of class \verb{SpatialPointsDataFrame}.
}
  \item{sp}{
If \verb{TRUE} return spatial object as defined in \pkg{sp}; needs package \pkg{rgdal}.
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
\code{\link{geocode.austria}}
}

\examples{
# single latitude longitude pair	
r <- elevation(lng = 13, lat = 47, sp = FALSE)
class(r)
print(r)

# latitude longitude duplet
r <- elevation(lng = c(13,14), lat = c(47,48), sp = FALSE)
class(r)
print(r)

# return SpatialPointsDataFrame
r <- elevation(lng = c(13,14), lat = c(47,48), sp = TRUE)
print(r)

# use Spatial object as argumnet 'x'
r <- elevation(x = r)
print(r)
}

\keyword{ spatial }
\keyword{ database }
