\name{ilpp2}
\alias{ilpp2}
\docType{data}
\title{
Implicit learning data from Visser et al (2007). 
}

\description{

Implicit learning data from Visser et al (2007); these data are from blocks 1-12 of participant 2 of Experiment 1. 

}

\usage{data(ilpp2)}
\format{
  A data frame with 12 blocks of 395 trials of a sequential response time task;
  observations on the following variables:
  \describe{
  	\item{\code{id}}{participant id}
	\item{\code{ses}}{session number (1-2)}
	\item{\code{blk}}{block number within session (1-6)}
	\item{\code{tri}}{trial location (1-4)}
	\item{\code{ans}}{answer location (1-4)}
	\item{\code{rt}}{response time in seconds}
	\item{\code{acc}}{accuracy (factor with levels 'cor'rect and 'inc'orrect}
	\item{\code{acBin}}{accuracy in binary format}	
    \item{\code{blk2}}{block number continuous (1-12)}
    \item{\code{tt}}{trial type; factor with levels 'seq'uential and 'ran'dom}
  }
}
\details{
Data from Visser et al (2007), Memory and Cognition. 
}
\source{
Visser et al (2007), Memory and Cognition. 
}
\references{
Visser et al (2007), Memory and Cognition. 
}
\examples{
data(ilpp2)
}
\keyword{datasets}
