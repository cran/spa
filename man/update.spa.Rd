\name{update.spa}
\alias{update.spa}
\title{Update procedure for transductive prediction with the SPA}
\description{
  This implements the transductive prediction for an spa object.  It
  performs regularization/region approach for transductive prediction.
  In addition it can also updates an existing spa object with new
  transductive estimate.
}
\usage{
\method{update}{spa}(object,ynew,xnew,gnew,
                     type=c("vector","probs","coef","all"),
                     reg=c("ridge","hlasso"),trans.update=FALSE,
                     dat=list(k=0,l=Inf),verbose=FALSE,FUN=sum,\dots)
}
\arguments{
  \item{object}{ an object of type \code{spa} }
  \item{ynew}{ an object of type \code{spa} }
  \item{xnew}{ an object of type \code{spa} }
  \item{gnew}{ an object of type \code{spa} }
  \item{type}{
    the type of predictions in classification, classes, probabilities or
    both.  In the case of both the object will return an additional
    penalty vector corresponding to the rate function for each case.
  }
  \item{reg}{
    for regression it is automatically taken as a ridge
    penalty.  In the case of classification one can use either ridge or
    the hyperbolic l1 penalty (hlasso).
  }
  \item{trans.update}{comming soon}
  \item{verbose}{comming soon}
  \item{dat}{
    data driven estimation routine consists of list k for the number of
    vertex sets, and l for the regularization (see reference). default
    dat=list(k=0,l=Inf)}

  \item{FUN}{ measure used to sort WUL, the unlabeled-labeled partition.  The
    FUN=sum multiplies WUL times a vector of ones, others may include
    max.
  }
  \item{\dots}{additional arguments passed into the function }
}

\author{Mark Culp}
\examples{
## Use simulated example (two moon)
set.seed(100)
dat=spa.sim(type="moon") 

##Use spa to train with a supervised/transductive kernel smoother
gsemi<-spa(dat$y,graph=as.matrix(daisy(dat[,-1])))

##Use spa to update the object with new data
dat<-rbind(dat,spa.sim(100,0))
gsemi<-update(gsemi,ynew=dat$y,,as.matrix(daisy(dat[,-1])),trans.update=TRUE)

}

\references{
 
  M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}

\keyword{classes}
\keyword{models}
\keyword{methods}
