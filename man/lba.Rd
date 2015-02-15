\name{lba}
\alias{lba}
\alias{tablba}
\alias{summary.lba}
\alias{logLik.lba}
\alias{print.lba}

\title{
Specify and fit lba models. 
}
\description{

Specification of lba models with explanatory variables on the parameters. Models are fitted
using full information maximum likelihood. 

}
\usage{
lba(rt, response, data, weights, 
sddr = ~1, 
sp = ~1, 
bound = ~1, 
nond = ~1, 
drift = ~1, 
scaling = "sum", 
loglink = c(FALSE, FALSE, FALSE, FALSE), 
sdstart=0.1,
startpars, 
fixed = NULL,
method = "L-BFGS-B",
hessian = FALSE,
lower = -Inf,
upper = Inf,
fit=TRUE,
debug=FALSE) 

\method{logLik}{lba}(object, ...)
\method{print}{lba}(x, ...)
\method{summary}{lba}(object, ...)

tablba(object)

}


%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rt}{The name of the response time variable in data.frame 'data'.}
  
  \item{response}{The name of the response time variable in data.frame 'data'.}
  
  \item{data}{Data.frame containing the variables.}
  
  \item{weights}{Optional case weights.}

  \item{sddr}{The model for the standard deviation of the drift rate, see Details.}
  
  \item{sp}{The model for the start point parameter, see Details.}
  
  \item{bound}{The model for the boundary parameter, see Details.}
  
  \item{nond}{The model for the non-decision time, see Details.}
  
  \item{drift}{The model for the drift rate parameter, see Details.}
  
  \item{scaling}{Options for making the model identifiable; options are 
  "sum" or "fixedSD".}
  
  \item{loglink}{Wheter parameters (sddr, sp, nond, and bound) should be
  fitted using a log link function (to avoid boundary estimation issues).}
  
  \item{sdstart}{Starting value of the standard deviation of the drift
  rates in case argument scaling uses option "fixedSD".}
  
  \item{startpars}{Vector of starting values for the parameters.  This is
  currently a required argument as no automatic starting values are
  available.}
  
  \item{fixed}{Logical; when startpars is given 'fixed' can be used to
  specify whether parameters should remain fixed during estimation;
  sometimes required for more stable estimation.}
  
  \item{method}{Optimization method; passed to optim.}
  
  \item{hessian}{Logical; indicating whether the estimated hessian at the
  minimum; passed to optim.}
  
  \item{lower, upper}{lower and upper boundaries for the parameters; only
  applicable with optimization method 'L-BFGS-B' is used.}
  
  \item{fit}{Logical; indicating whehter the model should be fit, ie, its
  parameters optimized or not.  Default is TRUE.}
  
  \item{debug}{Logical, default is FALSE; prints out detailed information
  on submodels, parameters et cetera during optimization.}
  
  \item{object}{a (fitted) lba model.}
  
  \item{x}{a (fitted) lba model.}
  
  \item{...}{not currently in use.}
  
  
}

\details{

The 5 sub-models of the LBA model can be specified using a formula.  Eg,
\code{nond=~diff}, specifies a model in which the \code{nond}ecision time
is modeled as function of \code{diff}iculty; \code{diff} may be a factor or
numerical variable.

Identification of the model is attained by having the drift rates for
alternatives in \code{response} sum to unity or by having a fixed standard
deviation of the drift rates.  These options are specified by scaling="sum"
or scaling="fixedSD", respectively.  In the latter case, the value of the
fixed standard deviation is assumed to be the first value of
\code{startpars}.

If \code{hessian} is set to TRUE, \code{optim} is used to get the Hessian
at the maximum likelihood estimates of the parameters.  This is used in
turn to compute standard errors.  The \code{summary} function pretty prints
a table of parameter estimates, standard errors, z- and p-values.  The
\code{summary} function also prints the separate sub-model specifications
and the parameter estimates.  The \code{print} function prints basic
information and a (named) vector of parameter estimates.

}

\value{
The \code{lba} function returns a list with the following components:
	\item{pars}{The values of fitted parameters.}
	\item{logl}{The optimized log likelihood}
	\item{convergence}{Convergence information from \code{optim}}
	\item{hessian}{Only included if \code{hessian} was set to TRUE}
	\item{ses}{Only included if \code{hessian} was set to TRUE and the hessian is non-singular}
	\item{fixed}{Vector of logical's indicating whether parameters were fixed}
	\item{model}{List of 5 sub-models of the LBA model, see Details above.}
	\item{npar}{The number of parameters of the model}
	\item{freepars}{The number of freely estimated parameters of the model}
	\item{nobs}{The number of observations, used in computing the BIC}
	\item{call}{The (matched) call to the \code{lba} function}
	
	Function \code{tablba} returns a \code{data.frame} with columns: 
	\item{value}{The estimated (or fixed) parameter value}
	\item{se}{The standard error of the parameter computed from the Hessian}
	\item{z}{The z-ratio of \code{value} and \code{se}}
	\item{p}{The p-value associated with \code{z}}
}

\references{
LBA models as in Brown and Heathcote, Cognitive science, 2008.
}

\author{
Ingmar Visser
}

\examples{
data(bh08)

# reduce the data set for faster runtimes
bh1 <- bh08[c(1:300,1001:1300,2001:2300),]

# remove extreme RTs
bh1 <- bh1[bh1$rt>.180&bh1$rt<2,]

# starting values based on the quantile parameter 
# estimates from Brown and Heathcote, 2008:
# pars <- c(.25,.3,.1,.2,.9,.75,.6)

# fit the model with starting values
pars <- c(.25,.3,.1,.2,.9,.75,.6)
m1 <- lba(rt=rt,response=acc,drift=~diff-1,data=bh1,
	startpars=pars)

m1

summary(m1)

\dontrun{
	# use random starting values instead
	set.seed(2)
	m1 <- lba(rt=rt,response=acc,drift=~diff-1,data=bh08,
	startpars=pars, hessian=TRUE)

	summary(m1)
	
	# get the parameters
	pp <- m1$pars
	# simulate some data from the model for the three conditions
	set.seed(1)
	dt1 <- rlba(1000, b=pp[3]+pp[2], A=pp[2], vs=c(pp[5],1-pp[5]), 
		s=pp[1], t0=pp[4], truncdrifts=TRUE)
	dt2 <- rlba(1000, b=pp[3]+pp[2], A=pp[2], vs=c(pp[6],1-pp[6]), 
		s=pp[1], t0=pp[4], truncdrifts=TRUE)
	dt3 <- rlba(1000, b=pp[3]+pp[2], A=pp[2], vs=c(pp[7],1-pp[7]), 
		s=pp[1], t0=pp[4], truncdrifts=TRUE)
	dt <- rbind(dt1,dt2,dt3)
	dt$diff <- gl(3,1000)
	dt$resp <- ifelse(dt$resp==2,0,1)
	
	# remove extreme RTs
	dt <- dt[dt$rt>.180&dt$rt<2,]
	
	# refit the model with the simualted data
	m1rf <- lba(rt=rt,response=resp,drift=~diff-1,data=dt,startpars=pp)
	
	data(numpp1)
	
	set.seed(9)
	m2 <- lba(rt=rt,response=acc,drift=~diff+block,data=numpp1,
	startpars=c(0.25,runif(4),0,0), scaling="fixedSD", 
		sdstart=0.25, hessian=TRUE) 
	tablba(m2) 
	
	}

}

\keyword{statmodel}
