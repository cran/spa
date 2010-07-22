\name{predict.spa}
\alias{predict.spa}
\title{Inductive Predict Procedure For SPA}
\description{
  This implements the inductive prediction for an spa object.  
  The impact of the observation(s) on the existing labeled and
  unlabeled data is ignored.

  For transductive predicton use \code{update} function.
}
\usage{
\method{predict}{spa}(object,xnew,gnew,type=c("vector","probs","both"),\dots)}
\arguments{
  \item{object}{ an existing object of type \code{spa} }
  \item{xnew}{ the new xdata to predict, of diminsion ngXdim(object[2]) (only applicable if object was called with x data)}
  \item{gnew}{ the new graph links.  The diminsion on this matrix is ngX dim(object)[1] with ng as the number of observations to predict.}
  \item{type}{ the type of prediction to return.}
  \item{\dots}{additional arguments passed into the function.}
}

\author{Mark Culp}
\examples{
## Use simulated example (two moon) and generate a contour plot of the border
set.seed(100)
dat=spa.sim(type="moon") 

L=which(!is.na(dat$y))
U=which(is.na(dat$y))
Dij=as.matrix(daisy(dat[,-1]))

##Use spa to train with a supervised/transductive kernel smoother
gsup<-spa(dat$y[L],graph=Dij[L,L],control=spa.control(gcv="lGCV"))
gsemi<-spa(dat$y,graph=Dij,control=spa.control(gcv="aGCV"))

##Use predict to define a grid for contour plot
gsize=100
a1<-seq(min(dat$x1),max(dat$x1),length=gsize)
a2<-seq(min(dat$x2),max(dat$x2),length=gsize)

zsup=matrix(0,gsize,gsize)
for(i in 1:gsize){
  val=sqrt(t(sapply(1:gsize,function(j)(dat$x1[L]-a1[i])^2+(dat$x2[L]-a2[j])^2)))
  zsup[i,]=predict(gsup,gnew=val)  ##supervised prediction with k-smoother
}
zsemi=matrix(0,gsize,gsize)
for(i in 1:gsize){
  val=sqrt(t(sapply(1:gsize,function(j)(dat$x1-a1[i])^2+(dat$x2-a2[j])^2)))
  zsemi[i,]=predict(gsemi,gnew=val) ##inductive prediction with transductive rule
}

## Plot results
gr=c(2,4)
plot(0,1,cex=1.5,xlab="x1",ylab="x2",type="n",
     xlim=c(-0.5,6.5),ylim=c(-6.5,3.5))
gr=gray(c(.7,.9))
points(dat$x1,dat$x2,pch=16,col=8,cex=1)
points(dat$x1[L],dat$x2[L],pch=16,col=gr[dat$y[L]+1],cex=2)
points(dat$x1[L],dat$x2[L],pch=1,col=1,cex=2)
contour(a1,a2,zsup, levels=.5,add=TRUE,lty=1,method="edge",drawlabels=FALSE,lwd=2,col=gray(0.6))
contour(a1,a2,zsemi,levels=.5,add=TRUE,lty=1,method="edge",drawlabels=FALSE,lwd=2,col=1)
exp1=expression(hat(Y)*"="*hat(f)(G[X]))
exp2=expression(Y[L]*"="*f(X[L])+epsilon)
legend(4.25,par()$usr[4],c(exp1,exp2),cex=1.24,fill=gray(c(0,0.6)),bg="white")
legend(4.25,par()$usr[4],c(exp1,exp2),cex=1.24,fill=gray(c(0,0.6)))

title(switch(attr(dat,"type"),moon="Two Moon Simulated Data",supervised="Supervised Border Simulated set"))
title("\n\nInductive Prediction with a Transductive Model",cex.main=1.1)
box()

}
\references{
 
M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}

\keyword{classes}
\keyword{models}
\keyword{methods}
