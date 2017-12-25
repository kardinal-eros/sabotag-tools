\name{background}
\docType{methods}

\alias{background}

\alias{plot}
\alias{show}
\alias{pdf}
\alias{margin}
\alias{grid}
\alias{layers}
\alias{labelmargin}

\alias{plot,Background-method}
\alias{plot,Background,missing-method}

\alias{show,Background-method}

\alias{pdf,Background-method}

\alias{grid,Background-method}

\alias{layers,Background-method}

\alias{margin,Background-method}

\alias{labelmargin,Background-method}

\title{
Configure a Map Background
}

\description{
  A simple function to collect data for a map background (returns class
  \code{"Background"}) and methods operating an such a collection.
}
\usage{
background(extent, waters = TRUE, reliefmap = TRUE, gridlines = TRUE,
           pretty = FALSE, add = 0, tol = 0.005, strahler = 4, score = 3)

\S4method{plot}{Background}(x, mar = rep(0,4), plain = FALSE,
    frame = TRUE, col,  ...)

\S4method{show}{Background}(object)

\S4method{layers}{Background}(object, ...)

\S4method{grid}{Background}(object)

\S4method{margin}{Background}(object, ...)

\S4method{labelmargin}{Background}(object, ...)

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
    See \code{\link[sabotagdata:relief]{relief}}.
}
  \item{gridlines}{
    Include grid as lines additional to polygon grid. Defaults to \verb{TRUE}.
}
  \item{pretty}{
    Recalculate extent using \code{\link{pretty}}.
}
  \item{add}{
    Argument passed on to \verb{pretty}.
}
  \item{tol}{
    Simplify geometries using package \pkg{rgeos}. See \code{\link{gSimplify}}.
}
  \item{strahler}{
    Subset rivers with Strahler stream order. See
    \code{\link[sabotagdata:rivers]{rivers}}.
}
  \item{score}{
    Subset lakes by lake score.
}
  \item{object}{
    \verb{Background} object.
}
  \item{mar}{
    Add margins (see \code{\link{par}}). The default is to set all margins to zero.
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
    To be passed to methods. Experimental. \verb{resolution} should work.
}
}

\details{
\itemize{
  \item
    \verb{background}: returns an object where all layers are cropped to a common
    extent. These layers can be accessed by \verb{layers(object)}, the method
    returns a list. \verb{layers(x)$grid} returns what \verb{floragrid} calculated
    on the input extent.
  \item
    \verb{layers}: is a shortcut to return \verb{slot(object, "layers")}. This
    method should be used to return the content of this slot.
  \item
    \verb{grid}: returns the grid of objects of class \verb{background}.
  \item
    \verb{margins}: returns the outer margin of \verb{floragrid} computed on
    inherited extent of object (see \code{\link{extent}}).
  \item
    \verb{labelmargin}: returns an object (class \verb{SpatialPointsDataFrame})
    that can be used to plot margin labels. Row and column labels are computed
    according to defaults of \verb{margin}.
  \item
    \verb{pdf} creates PDF output.
}  
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
