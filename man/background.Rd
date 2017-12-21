\name{background}
\docType{methods}

\alias{background}

\alias{plot}
\alias{show}
\alias{pdf}

\alias{plot-methods}
\alias{plot,Background-method}
\alias{plot,Background,missing-method}

\alias{show-methods}
\alias{show,Background-method}

\alias{pdf,Background-method}


\title{
Configure a Map Background
}

\description{
  A simple function to collect data for a map background and methods for class
  \code{"Background"}.
}
\usage{
background(extent, waters = TRUE, reliefmap = TRUE, gridlines = TRUE,
           pretty = FALSE, add = 0, tol = 0.005, strahler = 4, score = 3)

\S4method{plot}{Background}(x, mar = rep(0,4), plain = FALSE,
    frame = TRUE, col,  ...)

\S4method{show}{Background}(object)

\S4method{pdf}{Background}(object, file, width, height, dingbats = FALSE, ...)
}

\arguments{
  \item{extent}{
Extent object as defined in \pkg{raster}. See also \code{\link{pretty}}.
}
  \item{waters}{
Include water bodies (rivers and lakes) from package \pkg{sabotagdata}.
See \code{\link[sabotagdata:ecrins]{ecrins}}.
}
  \item{reliefmap}{
Include a colored relief map water from package \pkg{sabotagdata}.
See \code{\link[sabotagdata:relief]{relief}}
}
  \item{gridlines}{
Include grid as lines additional to polygon grid.
}
  \item{pretty}{
Recalculate extent using \code{\link{pretty}}.
}
  \item{add}{
Argument passed on to \verb{pretty}.
}
  \item{tol}{
Simplify geometries using package \pkg{rgeos}.
}
  \item{strahler}{
Subset rivers with Strahler stream order.
}
  \item{score}{
Subset lakes by lake score.
}
  \item{x, object}{
\verb{Background} object.
}
  \item{mar}{
Add margins (see \code{\link{par}}).
}
  \item{plain}{
Do not plot anything but open plotting window.
}
  \item{frame}{
Draw a frame around figure.
}
  \item{col}{
Color of water bodies. If missing an internal default is applied.
}
  \item{file, width, height, dingbats}{
    Arguments for pdf. See \code{\link[grDevices:pdf]{pdf}}.
}
  \item{...}{
To be passed to functions. Experimental.
}
}
\details{
\verb{background} returns an object where all layers are cropped to a common extent.
}
\value{
An object of class \verb{background}. A list with elements of class Spatial*.
}
\author{
Roland Kaiser
}

\seealso{
\code{\link[sabotagdata]{sabotagdata}}
}
\examples{
x <- background(extent(12,13,47,48))
plot(x)
}

\keyword{ spatial }
\keyword{ database }
