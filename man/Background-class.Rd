\name{Background-class}
\Rdversion{1.1}
\docType{class}
\alias{Background-class}

\title{Class \code{"Background"}}

\description{
Class to hold data of map background.
}

\section{Objects from the Class}{
Objects can be created by calls to function \code{\link{background}}.
}

\section{Slots}{
  \describe{
    \item{\code{layers}:}{
      list. A collection of Spatial* objects in slot \code{slot(object, "layers")}.
      The slot contains a \verb{list} of objects with names.
    }
    \item{\code{symbology}:}{
      A list a arguments to style plot. Currently not used.
    }
  }
}

\section{Methods}{
  \describe{
    \item{plot}{
      \code{signature(x = "Background", y = "missing")}:
      Plot object (\code{\link{plot}}).
    }
    \item{show}{
      \code{signature(object = "Background")}:
      Print object (\code{\link{show}}).
    }
    \item{pdf}{
      \code{signature(object = "Background")}:
      Print to PDF (\code{\link{pdf}}).
    }

  }
}

\author{
Roland Kaiser
}

\seealso{
\code{\linkS4class{Occurrences}}
}

\examples{
showClass("Background")
}

\keyword{classes}

