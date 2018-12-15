\name{occurrences}

\docType{methods}

\alias{occurrences}

\alias{pdf,Occurrences-method}

\alias{plot,Occurrences-method}
\alias{plot,Occurrences,missing-method}

\alias{text,Occurrences-method}
\alias{text,Occurrences}

\title{
Create Occurrences
}

\description{
A simply constructor function for class \verb{"Occurrences"}.
}

\usage{
occurrences(x, schema = c("taxon", "gridcell"))

\S4method{plot}{Occurrences}(x, type,  ...)

\S4method{text}{Occurrences}(x, type,  ...)

\S4method{pdf}{Occurrences}(object, background, file, width, height, dingbats = FALSE, ...)
}

\arguments{
  \item{x}{
A data.frame or Spatial* object.
}
  \item{schema}{
Character. Columns to be searched for. Column \verb{"taxon"} (case independent) has to be present in any case. If \verb{x} inherits Spatial* \verb{gridcell} can be missing and will be calculated.
}
  \item{object}{
  An object of class \code{"Occurrences"} to be plotted.
}  
  \item{background}{
An object of class \code{"Background"} to be used to set up plotting region with perfect alignment to background map when stacked graphically/visually.
}
  \item{type}{
    Either \verb{ASIS} (coordinates) or \verb{GRIDCELL}.
  }
  \item{file, width, height, dingbats}{
    Arguments for pdf. See \code{\link[grDevices:pdf]{pdf}}.
}
\item{...}{
	Not used.
}
}

\details{
Use the \verb{pdf} function to plot occurrence points \emph{to top} of map background saved mit pdf method for that class.
}

\value{
An object of class \verb{Occurrences}.
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

o <- occurrences(x)

plot(o[o$taxon == "Genus species", ])

}

\keyword{spatial}
