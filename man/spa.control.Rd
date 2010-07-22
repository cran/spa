\name{spa.control}
\alias{spa.control}
\title{Control Parameters for spa}
\description{
    Controls various aspects of fitting the \sQuote{spa} object.
}
\usage{
  spa.control(eps=1e-6,maxiter=20,gcv=c("lGCV","tGCV","fGCV","aGCV"),
              lqmax=0.2,lqmin=0.05,ldepth=10,ltmin=0.05,lgrid=NULL,
              lval=NULL,dissimilar=TRUE,pce=FALSE,adjust=0,warn=FALSE,...)
}
\arguments{
  \item{eps}{ the tolerance parameter for spa using a
    type=\sQuote{class} argument.
  }
  \item{maxiter}{ the maximum number of iterations to run the algorithm
    using type=\sQuote{class} argument. This parameter forces the
    algorithm to stop even if eps is not met.
  }
  \item{gcv}{aGCV=approximate GCV using the smoother
    SLL+t(SU)*SUL, tGCV=GCV using the smoother
    SLL+SLUsolve(I-SUU,SUL)  (can be slow), lGCV=GCV using the
    supervised smoother (fast but not that good), and fGCV=approximate GCV using the smoother S with
    approximation above (this is no longer documented but it is still implemented).
}
\item{lqmax}{max quantile on the density of distance for data-driven estimation}
\item{lqmin}{min quantile on the density of distance for data-driven estimation}
\item{ldepth}{the depth of the search for divide and conquer parameter estimation}
\item{ltmin}{the minimum value, in-case \code{lqmin} is negative}
\item{lgrid}{if set to an integer, then the divide and conquer approach is bypassed}
\item{lval}{if set then the smoothing parameter is \code{lval}}
\item{dissimilar}{if the edges represent similarity then set this to
    TRUE.  This flag is intended for use with the Laplacain smoother as
    input (for SPS this flag is ignored and the graph is assumed to
    be dissimilar).  If the flag is FALSE then the supplied kernel is used to
    convert the graph to similarity.}
  \item{warn}{if TRUE then the procedure warns the user that a ginv will
    be used in the matrix inversion (i.e. the matrix is not invertible)
  }
  \item{pce}{ parameter adjust is meant for adjusting hard probability
    class estimates to soft (i.e. if p(z)=1 then p(z)=0.9999), for GCV
    estimation, this pushes GCV away from selecting smaller values.
  }
  \item{adjust}{ apply adjustment W=W+adjust.}
  \item{\dots}{ mop up additional parameters passed in. }
}
\note{
  Keep in mind, that for exponential loss (hard) we are being
  somewhat non-conventional by using GCV at all, i.e. loss/df where
  df=1-tr/m (m is known data size).  
}
\author{Mark Culp}
\references{
 
M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}


\keyword{classes}
\keyword{models}
\keyword{methods}


