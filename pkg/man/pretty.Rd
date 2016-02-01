\encoding{UTF-8}

\name{pretty}
\docType{methods}

\alias{pretty}
\alias{pretty,Extent-method}

\title{
Find Nice Grid Spacing
}
\description{
Find nice interval in grid schema.
}
\usage{
\S4method{pretty}{Extent}(x, resolution, ...)
}

\arguments{
  \item{x}{
A \verb{Extent} or \verb{Spatial*} object.
}
  \item{resolution}{
One of \verb{"GRID"} or \verb{"CELL"}, see \code{\link{pretty}} for details.
}
  \item{...}{
Not used.
}
}
\details{
Nothing here yet.
}
\value{
A \verb{Exent} object.
}
\author{
Roland Kaiser
}
\seealso{
\code{\link{floragrid}}
}
\examples{
pretty(extent(13,15,46,49))
pretty(extent(13,15,46,49), "GRID")
}
\keyword{ spatial }
