\name{Occurences-class}
\Rdversion{1.1}
\docType{class}
\alias{Occurences-class}

\title{Class \code{"Occurences"}}
\description{
Class Occurences.
}
\section{Objects from the Class}{
Objects should be created with function \code{\link{occurences}}.
}
\section{Slots}{
  \describe{
    \item{\code{taxa}:}{Object of class \code{"character"} ~~ }
    \item{\code{symbology}:}{Object of class \code{"list"} ~~ }
%    \item{\code{data}:}{Object of class \code{"data.frame"} ~~ }
%    \item{\code{coords.nrs}:}{Object of class \code{"numeric"} ~~ }
%    \item{\code{coords}:}{Object of class \code{"matrix"} ~~ }
%    \item{\code{bbox}:}{Object of class \code{"matrix"} ~~ }
%    \item{\code{proj4string}:}{Object of class \code{"CRS"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{SpatialPointsDataFrame}"}, directly.
Class \code{"\linkS4class{SpatialPoints}"}, by class "SpatialPointsDataFrame", distance 2.
Class \code{"\linkS4class{Spatial}"}, by class "SpatialPointsDataFrame", distance 3.
Class \code{"\linkS4class{SpatialVector}"}, by class "SpatialPointsDataFrame", distance 3.
Class \code{"\linkS4class{SpatialPointsNULL}"}, by class "SpatialPointsDataFrame", distance 3.
}
\section{Methods}{
No methods defined for the class so far. Note, all Spatial method for \verb{SpatialPointsDataFrame} apply.
}
\author{
Roland Kaiser
}
\examples{
showClass("Occurences")
}
\keyword{classes}
