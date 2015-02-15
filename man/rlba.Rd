\name{rlba}

\alias{rlba}

\title{Generate data from an LBA model.}

\description{Generate data from an LBA model.}

\usage{
rlba(n, b, A, vs, s, t0, st0 = 0, truncdrifts = TRUE)
}

\arguments{
  \item{n}{The number of random variates required.}
  \item{b}{The boundary parameter.}
  \item{A}{The start point parameter.}
  \item{vs}{The drift rates for each of the accumulators.}
  \item{s}{The standard deviation of the drift rates.}
  \item{t0}{The non-decision time.}
  \item{st0}{Variability of the non-decision time, uniformly distributed as t0+U(0,st0).}
  \item{truncdrifts}{Logical; whether drifts that are generated should be
  truncated at zero.  Negative RTs may result when set to FALSE.}
}

\details{
No more details.
}

\value{A data.frame with two variables, 'rt' and 'resp', for the response
time and the response, respectively.}

\references{
Function adapted from Brown and Heathcote. 

\url{http://www.newcl.org/publications/2008/lbasoftware.htm}
}

\author{
Ingmar Visser, function adapted from Brown and Heathcote. 

\url{http://www.newcl.org/publications/2008/lbasoftware.htm}
}

\examples{
# to be added later
}
\keyword{statmodel}
