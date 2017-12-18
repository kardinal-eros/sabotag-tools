\name{geocode}
\alias{geocode.austria}

\title{
Locality Description for Austria's administrative Boundaries.
}

\description{
Query \code{data(aut)} to get locality description for given coordinates.
}

\usage{
geocode.austria(x, p = 100, sp = FALSE, bergfex = FALSE, ...)
}

\arguments{
  \item{x}{
Object of class SpatialPointsDataFrame.
}
  \item{p}{
Value for accuracy estimate. The function searches for a column named "accuracy" or "precision" in \verb{x} and, if present, useses the given values.
}
  \item{sp}{
Return SpatialPointsDataFrame.
}
  \item{bergfex}{
Also query \code{\link{bergfex}} server to obtain local toponyms
}
  \item{...}{
Not used.
}
}

\details{
The function returns a string composed of country (Staat), state (Bundesland), district (Bezirk) and municiplaity (politische Gemeinde) aswell as a formated coordinate and elevation description. It is espaecially tailored for the region of Austria (and it's neighbouring countries). Setting \verb{bergfex = TRUE} will addditionally append a local toponym. The function will work only if you have set your geonames username with \verb{options(geonamesUsername="myusernamehere")}. You will need to create an account at \url{http://www.geonames.org/login/}.
}

\value{
A \verb{data.frame} or \verb{SpatialPointsDataFrame} with \code{CRS("+init=epsg:4326")}.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{bergfex}}
}

\examples{
x <- data.frame(accuracy = 10, x = 10:16, y = 48)
coordinates(x) <- ~x+y
proj4string(x) <- CRS("+init=epsg:4326")

# for the following to work options()$geonamesUsername
# should return a valid user name
\dontrun{
geocode.austria(x)
}
}

\keyword{ spatial }
\keyword{ database }

