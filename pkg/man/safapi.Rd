\name{safapi}
\alias{safapi}

\title{
Locality Description for Austria
}
\description{
Query \emph{Standortsanalyse} server to get locality description for a given longitude and latitude. \verb{safapi} stands for Standorts-Analyse-Fundort-API. The server infrastructure is kindly provided by Albin Blaschka.
}
\usage{
safapi(lng, lat, layers, format = "txt", service = "geoapi", server = "46.252.27.126", key = "574nd0r754n4ly53", sp = FALSE)
}

\arguments{
  \item{lng}{
Latitude. Geographic coordinates (e.g. 14.136882)
}
  \item{lat}{
Longitude. Geographic coordinates (e.g. 47.510895)
}
  \item{layers}{
Possible case insensitive choices are: \verb{bundesland}, \verb{bezirk}, \verb{gemeinde}, \verb{gebirge}, \verb{quadrant},\verb{corine}, and \verb{gzert}. If missing all layers are queried. Argument(s) may be abbreviated.
}
  \item{format}{
One out of \verb{"txt"}, \verb{"csv"}, \verb{"json"}.
}
  \item{service}{
Currently only a single service is available.
}
  \item{server}{
Url of server. Currently there is no DSN available.
}
  \item{key}{
API key.
}
  \item{sp}{
If \verb{TRUE} return spatial object as defined in \pkg{sp}; needs package \pkg{rdal}.
}

}
\details{
Nothing here yet.
}
\value{
Depending on argument \verb{format} a charactarer vector, a list, or if \verb{sp=TRUE} a SpatialPointsDataFrame.
}
\author{
Roland Kaiser
}
\examples{
r <- safapi(13, 47, c("geb", "q"), "txt")
str(r)

r <- safapi(13, 47, c("geb", "q"), "json")
str(r)

r <- safapi(13, 47, c("geb", "q"), "json", sp = TRUE)
require(maps)
map(regions = 'Austria')
plot(r, add = TRUE, col = 2)
}
\keyword{ spatial }
\keyword{ database }

