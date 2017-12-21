\name{nominatim}
\alias{nominatim}
\alias{nominatim2}

\title{
Locality Descriptions from OpenStreetMap Web Service
}

\description{
Query \href{http://www.wiki.openstreetmap.org/wiki/Nominatim}{OpenStreetMap} server for locality descriptions.
}

\usage{
nominatim(lng, lat, sp = FALSE)

nominatim2(x)
}

\arguments{
  \item{lng}{
  Latitude. Geographic coordinates (e.g. 14.136882)
  }
  \item{lat}{
  Longitude. Geographic coordinates (e.g. 47.510895)
  }
  \item{sp}{
  If \verb{TRUE} return spatial object as defined in \pkg{sp}; needs package \pkg{rgdal}.
  }
  \item{x}{
  object of class \verb{SpatialPointsDataFrame}.
  }
}

\details{
A \verb{nominatim} provides a single coordinate pair interface. \verb{nominatim2} allows the query to be based on a \verb{SpatialPointsDataFrame}.
 
}

\value{
A \verb{list} or \verb{SpatialPointsDataFrame} with \code{CRS("+init=epsg:4326")}. The meaning of columns is as follows: \verb{ST} = country (Land), \verb{BL} = state (Bundesland), \verb{PB} = county (Bezirk), \verb{PG} = town/village (Gemeinde).
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{geocode.austria}}
}

\examples{
r <- nominatim(lng = 14.642202, lat = 47.530278, sp = FALSE)
class(r)
str(r)

r <- nominatim(lng = 14.642202, lat = 47.530278, sp = TRUE)
class(r)
head(r@data)

x <- data.frame(accuracy = 10, x = 13:16, y = 48)
coordinates(x) <- ~x+y
proj4string(x) <- CRS("+init=epsg:4326")

nominatim2(x)
}

\keyword{ spatial }
\keyword{ database }

