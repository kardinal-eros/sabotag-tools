\name{zobodat}
\alias{zobodat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data From the Zobodat Database
}
\description{
Convert downloaded CSV-files from the Zobodat to \verb{SptaialPointsDataFrame}.
}
\usage{
zobodat(x)
}

\arguments{
  \item{x}{
File path.
}

}
\details{
The function discards all observation where coordinates are missing.
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
# zobodat(x)
}
\keyword{ spatial }
\keyword{ database }

