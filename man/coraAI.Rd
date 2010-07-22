\name{coraAI}
\alias{coraAI}
\alias{protLoc}
\docType{data}
\title{ The Cora AI Data}
\description{
  The \code{coraAI} data consists of a response, journal indication
  matrix, and co-citation network. This data is a subset of the Cora
  text mining project (refer to reference). 
  
  The observations are text documents that consist of 879 published
  papers about either Artificial Intelligence (\code{AI}) or Machine
  Learning (\code{ML}).  The journal name for each document is available
  (8 journals and an other category). The observed co-citation graph
  is also available, where each vertex is a document (observation), and
  the edge is the count of citations in common between each document and
  all other documents.

  The goal is to incorporate both the text information and co-citation
  information for the prediction of paper subject \code{AI}/\code{ML}.
  Another, interesting problem might be to predict the journal of the
  paper given the text information and the categorization.  
}
\usage{data(coraAI)}
\format{
  The \code{coraAI} data consists of three objects each discussed next.

  \code{class}: categorization of the document(observation) as either
  \code{AI} or \code{ML}.  Typically the response.

  \code{journals}: indication of the document as published in a specific
  journal, (other, artificial-intelligence, machine-learning,
  nueral-computing, ieee-trans-Nnet, ieee-tpami,
  j-artificial-intelligence-research, ai-magazine, JASA)

  \code{cite}: the adjacency matrix of the co-citation network for these
  879 documents.
}
\details{

  The spa is particularly appealing for this data since it fits a
  function directly to the graph and coeficient vector to the
  journals. Other approaches require convergence of the journal
  information into a graph for processing, which is unclear when the
  data is a binary design matrix. 
  
}
\source{
  The data was generated using AWK scripting from the cora raw sweet
  (first reference).  The journal names were fixed to obtain a useable
  representation (e.g. tpami, ieee tpami, pami are all ieee-tpami).
}
\references{
 A. McCallum, K. Nigam, J. Rennie, and K. Seymore (2000). Automating the construction of
 internet portals with machine learning. Information Retrieval Journal,
 3.

  M. Culp (2011). spa: A Semi-Supervised R Package for
  Semi-Parametric Graph-Based Estimation. Journal of Statistical
  Software, 40(10), 1-29. URL http://www.jstatsoft.org/v40/i10/.

}

\keyword{datasets}
