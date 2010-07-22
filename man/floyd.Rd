\name{floyd}
\alias{floyd}
\alias{uDist}
\title{Shortest Path Distances }
\description{
  \sQuote{uDist} Computing shortest path distance
  (hop count) for an unweighted similarity graph where 1=edge and 0=no
  edge (i.e. invoke knnGraph with weight=FALSE)

  \sQuote{floyd} Floyd's algorithm (SLOW) for computing shortest path
  distances (weighted hop count) for distance weighted graphs
  (i.e. invoke knnGraph with weight=TRUE).
}
\usage{
floyd(x,verbose=FALSE)

uDist(g, k)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ the adjacency n by n matrix (distance weighted)}
  \item{verbose}{print the progress for Floyd's algorithm}
  \item{g}{  the adjacency n by n matrix (unweighted)}
  \item{k}{  input parameter for determining the maximum distance to
    compute (a distance of greater than k is taken as infinity)}
}
\details{
  These implementations are not yet optimized for large data sets (>5000
  observations)
}
\value{
  \item{D}{Distance Matrix n by n}
}
%\references{Coming soon (Floyd and IsoMap)}
\author{Mark Culp}
\seealso{ \code{\link{spa}} \code{\link{knnGraph}} \code{\link{epsGraph}} }
\keyword{classes}
\keyword{models}
\keyword{methods}
