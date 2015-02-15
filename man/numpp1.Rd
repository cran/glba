\name{numpp1}
\alias{numpp1}
\docType{data}
\title{
Example data from a numerosity task. 
}

\description{

Example data from a numerosity task.  Participant is required to categorize
a display of randomly placed dots into 'few' or 'many'.

}

\usage{data(numpp1)}
\format{
  A data frame with 186 observations on the following 10 variables. Extreme data are removed. 
  \describe{
	\item{\code{stim}}{file name of the stimulus}
	\item{\code{trial}}{trial number}
	\item{\code{acc}}{accuracy in binary format}
	\item{\code{rt}}{response time in seconds}
	\item{\code{nr}}{required response; factor with levels 'few' and 'many'}	
	\item{\code{block}}{block number (1-5)}
    \item{\code{dots}}{number of dots in the display}
    \item{\code{diff}}{absolute value of 'dots'-50}
	\item{\code{df2}}{dichotomized version of 'diff'}
	\item{\code{id}}{participant id}
  }
}
\details{
Example data from a numerosity task. 
}
\source{
Unpublished data.
}
\references{
Unpublished data.
}
\examples{
data(numpp1)
}
\keyword{datasets}
