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
\S4method{pretty}{Extent}(x, resolution, add = 0, mar = c(0,0,0,0), verbose = FALSE, ...)
}

\arguments{
  \item{x}{
    \verb{Extent} or \verb{Spatial*} object.
}
  \item{resolution}{
    Character. One of \verb{"GRID"} or \verb{"CELL"}, see
    \code{\link{floragrid}} for details.
}
  \item{add}{
    Integer. Number of bordering rectangles of grid units (resolution
    \verb{GRID}) or grid cells (resolution \verb{CELL}) around computed extent.
}
  \item{mar}{
    Integer vector. Numerical vector of the form
    \verb{c(bottom, left, top, right)} which gives the number of rows or
    columns of grid units (resolution \verb{GRID}) or grid cells
    (resolution \verb{CELL}) to be added on the four sides of the extent;
    in addition to the value (already) specified by argument \verb{add}.
    In this way it is possible to create asymmetric extent shapes,
    e.g. widen the extent on a particular side.
}
  \item{...}{
Not used.
}
  \item{verbose}{
    Print used resultion.
  }

}

\details{
  The function helps in setting up an appropriate grid with options to add
  additional strips of grid units systematically at all sides (argument
  \verb{add}) or at specified margins (\verb{mar}). Arguments can be
  combined.
}

\value{
  \verb{Exent} object.
}

\author{
  Roland Kaiser
}

\seealso{
  \code{\link{floragrid}}
}

\examples{
# initial extent 	
e0 <- extent(12.8,15.3,46.8,48.3)

# default is to use resolution GRID
pretty(e0)

# versions using resolution GRID
e1 <- pretty(e0, "GRID")
e2 <- pretty(e0, "GRID", add = 2)
e3 <- pretty(e2, "GRID", add = 0, mar = c(1,2,3,4))

# additional strips of gridcells at
# bottom (1), left (2), top (3), and right (4), black
plot(floragrid(e3, resolution = "GRID"),
    border = "white", col = "black")

# pretty spacing of extent plus 2 "rings" of encompassing cells, red
plot(floragrid(e2, resolution = "GRID"),
    border = "red", col = "white", add = TRUE)

# pretty spacing of extent, green
plot(floragrid(e1, resolution = "GRID"),
    border = "green", col = "gray", add = TRUE)

# initial (input) extent, blue
plot(extent2polygon(e0),
    border = "blue", lwd = 2, add = TRUE)

# add axes to plot
axis(1)
axis(2)


}

\keyword{ spatial }

