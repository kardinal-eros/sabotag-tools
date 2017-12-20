\name{occurences}
\alias{occurences}

\title{
Create Occurences
}

\description{
A simply constructor function for class \verb{"Occurneces"}.
}

\usage{
occurences(x, schema = c("taxon", "gridcell"))
}

\arguments{
  \item{x}{
A data.frame or Spatial* object.
}
  \item{schema}{
Character. Columns to be searched for. Column \verb{"taxon"} (case independent) has to be present in any case. If \verb{x} inherits Spatial* \verb{gridcell} can be missing and will be calculated.
}
}

\details{
Nothing here yet.
}

\value{
An object of class \verb{Occurences}
}

\author{
Roland Kaiser
}
\seealso{
\code{\link{background}}
}
\examples{
e <- extent(13,14,46,47)
g <- floragrid(e)
x1 <- data.frame(taxon = "Genus species", gridcell = sample(g$GRIDCELL, 10))
x2 <- data.frame(taxon = "Genus species spp. subspecies", gridcell = sample(g$GRIDCELL, 10))
x <- rbind(x1, x2)
coordinates(x) <- gridcell2lnglat(x$gridcell)

o <- occurences(x)

plot(o[o$taxon == "Genus species", ])

}

\keyword{spatial}
