\name{knnGraph}
\alias{knnGraph}
\alias{epsGraph}
\title{ Convert a data matrix to a K-NN graph or epsilon graph}
\description{
  These functions are designed to convert data sets or distance
  matrices to graphs.  
}
\usage{
knnGraph(x, k = 5, weighted = TRUE, dist = FALSE, \dots)
epsGraph(x, eps = 0.2, weighted = TRUE, dist=FALSE, \dots)
}
\arguments{
  \item{x}{ the data matrix, if \code{dist}=TRUE then x is a distance
    matrix}
  \item{k}{ the number of neighbors for a knn graph  }
  \item{eps}{ size of fixed radius }
  \item{weighted}{ if TRUE the graph will be weighted.  Note if TRUE use
    \code{floyd} for shortest path distance otherwise use
    \code{fastDist}.}
  \item{dist}{ when dist=TRUE then x is a distance matrix }
  \item{\dots}{ Extra parameters for the daisy(\dots) method }
}
\details{
  The daisy function in cluster library is used primarily due to its
  speed and reliability.  
}
\value{
  \item{g }{A graph made from data x or distance matrix as input.}
}
%\references{ reference for cluster coming }
\author{Mark Culp}
\note{ This command relies on the cluster library }

\seealso{ \code{\link{spa}} \code{\link{knnGraph}} \code{\link{epsGraph}} }
\references{
 
M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}

\keyword{classes}
\keyword{models}
\keyword{methods}
