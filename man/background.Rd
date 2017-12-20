\name{background}
\alias{background}
\alias{plot.background}
\alias{print.background}


\title{
Configure Map Background
}
\description{
A simple function to collect data for a map background.
}
\usage{
background(extent, waters = TRUE, reliefmap = TRUE, gridlines = TRUE,
           pretty = FALSE, add = 0, tol = 0.005, strahler = 4, score = 3)

\method{plot}{background}(x, mar = rep(0,4), plain = FALSE, col,  ...)

\method{print}{background}(x, ...)
}

\arguments{
  \item{extent}{
Extent object as defined in \pkg{raster}. See also \code{\link{pretty}}.
}
  \item{waters}{
Include water bodies (rivers and lakes) from package \pkg{sabotagdata}. See \code{\link[sabotagdata:ecrins]{ecrins}}.
}
  \item{reliefmap}{
Include a colored relief map water from package \pkg{sabotagdata}. See \code{\link[sabotagdata:relief]{relief}}
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
Subset rivers with Strahler stream order
}
  \item{score}{
Subset lakes by lake score.
}
  \item{x}{
\verb{background} object.
}
  \item{mar}{
See margins. See \code{\link{par}}.
}
  \item{plain}{
Do not plot anything but open plotting window.
}
  \item{col}{
Color of water bodies. If missing an internal default is applied.
}
  \item{...}{
To be passed to functions. Experimental.
}
}
\details{
The functions crops layers to a common extent.
}
\value{
An object of class \verb{background}.
}
\author{
Roladn Kaiser
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
