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
\S4method{pretty}{Extent}(x, resolution, add = 0, ...)
}

\arguments{
  \item{x}{
A \verb{Extent} or \verb{Spatial*} object.
}
  \item{resolution}{
One of \verb{"GRID"} or \verb{"CELL"}, see \code{\link{pretty}} for details.
}
  \item{add}{
Add number of bordering rectangle of grid cells (\verb{"GRID"}) around computed extent.
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
pretty(extent(13,15,46,48))

e1 <- pretty(extent(13,15,46,48), "GRID")
e2 <- pretty(extent(13,15,46,48), "GRID", add = 2)

plot(floragrid(e2, resolution = "GRID"))
plot(floragrid(e1, resolution = "GRID"), col = 2, add = TRUE)
}

\keyword{ spatial }

