\name{formatGridcell}
\alias{formatGridcell}
\alias{deparseGridcell}

\title{
Format Grid Cell Identifier
}

\description{
\verb{formatGridcell} formats a string as to match a standard. The default format applied in this package is to separate one of the four grid cells (\emph{\sQuote{Quadrant}}) of a grid unit (\emph{\sQuote{Grundfeld}}) with a dash (\verb{\dQuote{-}}). Function \verb{deparseGridcell} returns the components plus row and column. See \code{\link{floragrid}}.
}

\usage{
formatGridcell(x, sep = NULL)

deparseGridcell(x, sep = "-", row.width = 2, col.width = 2)
}

\arguments{
  \item{x}{
    Vector to be coerced to character.
  }
  \item{sep}{
    Separator.
  }
  \item{row.width}{
    Number of characters defining a row.
  }
  \item{col.width}{
    Number of characters defining a column.
  }  
}

\details{
The most common use case we find in (private) databases is not to signalize the \emph{grid cell} with any separating character. The forward slash (\verb{\dQuote{/}}) is often encountered also. Likewise, some data sets apply the dash (\verb{\dQuote{-}}) as separator. The function deals with all these forms. The default (\verb{split = NULL}) handles the case where no seperator is used.
}

\value{
A character.
}

\author{
Roland Kaiser
}

\seealso{
\code{\link{floragrid}}
}
\examples{
x1 <- c( 80442  ,  78452  ,  79461  )
x2 <- c("8044-2", "7845-2", "7946-1")
x3 <- c("8044/2", "7845/2", "7946/1")

formatGridcell(x1)
formatGridcell(x2, sep = "-")
formatGridcell(x3, sep = "/")
}

\keyword{ database }

