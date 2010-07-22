\name{spa.sim}
\alias{spa.sim}
\title{Simulated data for SPA}
\description{
  	An easy function to access the "moon" data set used to illustrate this package.  
}
\usage{
spa.sim(n=206,m=3,p=8,type=c("moon","supervised"),nonoise=TRUE)
}
\arguments{
  \item{n}{the total number of x observations to generate}
  \item{m}{the number of labeled cases (m<n) to generate}
  \item{p}{the diminsion on the x data.  First two columns are meaningful, others are noise.}
  \item{type}{the unlabeled border to generate}
  \item{nonoise}{whether or not the addiotional noisy columns should be returned}
  \item{\dots}{additional arguments passed into the function }
}
\author{Mark Culp}
\examples{
set.seed(100)
dat=spa.sim(type="moon") 

L=which(!is.na(dat$y))
U=which(is.na(dat$y))

##Fit data
gsemi<-spa(dat$y,graph=as.matrix(daisy(dat[,-1])))
gsemi
}

\references{

  M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}\keyword{classes}
\keyword{models}
\keyword{methods}
