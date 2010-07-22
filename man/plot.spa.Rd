\name{plot.spa}
\alias{plot.spa}
\title{ Plot the graph}
\description{
	Plots the graph in two specified dimensions.
}
\usage{
\method{plot}{spa}(x,xscale=NULL,g=NULL,vars=1:2,
                   graph.grid=TRUE,plt.response,
                   lcol=8,llwd=1,\dots)
}
\arguments{
  \item{x}{ the \code{spa} object.}
  \item{xscale}{ the dimension space for plotting.  See \code{spa} for
    examples with ISOmap and data.}
  \item{g}{ graph adjacency matrix. }
  \item{vars}{ variables to read off of xscale, e.g. xscale[,var]
    (default=1:2)}
  \item{graph.grid}{ whether or not the graph edges should be plotted. }
  \item{plt.response}{ whether or not the graph edges should be plotted.}
  \item{lcol}{line color for graph edges(default=gray)}
  \item{llwd}{line thickness for graph edges (default=2)}
  \item{\dots}{additional parameters for plot}
}

\author{ Mark Culp}
\references{
 
M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}


\keyword{classes}
\keyword{models}
\keyword{methods}

