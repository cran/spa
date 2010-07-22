\name{spa}
\alias{spa}
\alias{print.spa}
\alias{ftf.fit}
\title{ sequential prediction algorithm}
\description{

  This performs the sequential predictions algorithm \sQuote{spa} in R
  as described in the references below.  It can fit a graph only
  estimate (y=f(G)) and graph-based semi-parametric estimate
  (y=Xb+f(G)). Refer to the example below.

  The approach distinguishes between inductive prediction
  (\code{predict} function) and transductive prediction (\code{update}
  function).  This is documented in the user manual and references.
}
\usage{
spa(y,x,graph,type=c("soft","hard"),kernel=function(r,lam=0.1){exp(-r/lam)},
    global,control,...)
}
\arguments{
  \item{y}{ response of length m<=n }
  \item{x}{ n by p predictor data set (assumed XU is in space spanned by XL). }
  \item{graph}{ n by n dissimilarity matrix for a graph. }
  \item{type}{ whether soft labels (squared error), or hard labels
    (exponential). Soft is default.}
  \item{kernel}{ kernel function (default=heat)}
  \item{global}{ (optional) the global estimate to lend weight to
    (default is mean of known responses).
  }
  \item{control}{spa control parameters (refer to \code{spa.control} for
    more information)
  }
  \item{\dots}{ Currently ignored }
}
\details{
  If the response is continuous the algorithm only uses soft labels
  (hard labels is not appropriate or sensible).
  
  In classification the algorithm distinguishes between hard and soft
  labeled versions.  To use hard labels both type="hard" must be set and
  the response must be two leveled (note it does not have to be a
  factor, also classification of a set-aside x data is not possible). 
  The main issue between these involves rounding the PCE at
  each iteration (hard=yes, soft=no).  If soft labels are used then the
  base algorithm converges to a closed form solution, which results in
  fast approximations for GCV, and direct implementation of that
  solution as opposed to iteration (currently implemented).  For hard
  labels this is not the case.   As a result approximate GCV and full
  GCV are not properly developed and if specified the procedure performs 
  them with the soft version for parameter estimation.

  The update function also employs a distinction between hard/soft
  labels.  For hard labels the algorithm employs the pen=hlasso
  (hyperbolic l1 penalty) whereas soft labels employs the pen=ridge.
  One can also use the ridge penalty with hard labels but it is
  uncertain why this would be considered.

  The code provides semi-supervised graph-based support for R.
}

\note{
  To control parameter estimation, the parameters lmin, lmax and ldepth
  are set through spa.control.  For this procedure GCV is used as the
  criteria, where unlabeled data influence GCV.  Use spa.control to set
  this as well.  Options include, agcv for approximate transductive gcv,
  fgcv for gcv applied to the full smoother, lgcv for labeled data only
  or supervised gcv, and  tgcv for pure transductive gcv (slow).  The fgcv flag has been depreciated.  Refer
  to \code{spa.control} and the references below for more.
}
\references{
   M. Culp (2011). spa: A Semi-Supervised R Package for
   Semi-Parametric Graph-Based Estimation. Journal of Statistical
   Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

  M. Culp and G. Michailidis (2008) Graph-based Semi-supervised Learning.
  IEEE Pattern Analysis And Machine Intelligence.  30:(1)	
 
}

\examples{
## SPA in Multi-view Learing -- (Y,X,G) case.
## (refer to coraAI help page for more information).
## 1) fit model Y=f(G)+epsilon
## 2) fit model Y=XB+f(G)+epsilon

data(coraAI)
y=coraAI$class
x=coraAI$journals
g=coraAI$cite

##remove papers that are not cited
keep<-which(as.vector(apply(g,1,sum)>1))
y<-y[keep]
x<-x[keep,]
g=g[keep,keep]

##set up testing/training data (3.5\% stratified for training)
set.seed(100)
n<-dim(x)[1]
Ns<-as.vector(apply(x,2,sum))
Ls<-sapply(1:length(Ns),function(i)sample(which(x[,i]==1),ceiling(0.035*Ns[i])))
L=NULL
for(i in 1:length(Ns)) L=c(L,Ls[[i]])
U<-setdiff(1:n,L)
ord<-c(L,U)
m=length(L)
y1<-y
y1[U]<-NA

##Fit model on G
A1=as.matrix(g)
gc=spa(y1,graph=A1,control=spa.control(dissimilar=FALSE))
gc

##Compute error rate for G only
tab=table(fitted(gc)[U]>0.5,y[U])
1-sum(diag(tab))/sum(tab)

##Note problem
sum(apply(A1[U,L],1,sum)==0)/(n-m)*100  ##Answer:  39.79849

##39.8\% of unlabeled observations have no connection to a labeled one.

##Use Transuductive prediction with SPA to fix this with parameters k,l  
pred=update(gc,ynew=y1,gnew=A1,dat=list(k=length(U),l=Inf))
tab=table(pred[U]>0.5,y[U])
1-sum(diag(tab))/sum(tab)

##Replace earlier gj with the more predictive transductive model
gc=update(gc,ynew=y1,gnew=A1,dat=list(k=length(U),l=Inf),trans.update=TRUE)
gc

## (Y,X,G) case to fit Y=Xb+f(G)+e
gjc<-spa(y1,x,g,control=spa.control(diss=FALSE))
gjc

##Apply SPA as transductively to fix above problem
gjc1=update(gjc,ynew=y1,xnew=x,gnew=A1,dat=list(k=length(U),l=Inf),trans.update=TRUE)
gjc1

##Notice that the unlabeled transductive adjustment provided new estimates
sum((coef(gjc)-coef(gjc1))^2)

##Check testing performance to determine the best model settings
tab=table((fitted(gjc)>0.5)[U],y[U])
1-sum(diag(tab))/sum(tab)

tab=table((fitted(gjc1)>0.5)[U],y[U])
1-sum(diag(tab))/sum(tab)

}
\keyword{classes}
\keyword{models}
\keyword{methods}
