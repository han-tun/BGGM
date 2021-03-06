% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roll_your_own.R
\name{roll_your_own}
\alias{roll_your_own}
\title{Compute Custom Network Statistics}
\usage{
roll_your_own(object, FUN, iter = NULL, select = FALSE, cred = 0.95, ...)
}
\arguments{
\item{object}{An object of class \code{estimate}.}

\item{FUN}{A custom function for computing the statistic. The first argument must be
a partial correlation matrix.}

\item{iter}{Number of iterations (posterior samples; defaults to the number in the object).}

\item{select}{Logical. Should the graph be selected ? The default is currently \code{FALSE}.}

\item{cred}{Numeric. Credible interval between 0 and 1  (default is 0.95) that is used for selecting the graph.}

\item{...}{Arguments passed to the function.}
}
\value{
An object defined by \code{FUN}.
}
\description{
This function allows for computing custom network statistics for
weighted adjacency matrices (partial correlations). The statistics are computed for
each of the sampled matrices, resulting in a distribution.
}
\details{
The user has complete control of this function. Hence, care must be taken as to what \code{FUN}
returns and in what format. The function should return a single number (one for the entire GGM)
or a vector (one for each node). This ensures that the print and \code{\link{plot.roll_your_own}}
will work.


When \code{select = TRUE}, the graph is selected and then the network statistics are computed based on
the weigthed adjacency matrix. This is accomplished internally by multiplying each of the sampled
partial correlation matrices by the adjacency matrix.
}
\examples{
\donttest{
####################################
###### example 1: assortment #######
####################################
# assortment
library(assortnet)

Y <- BGGM::bfi[,1:10]
membership <- c(rep("a", 5), rep("c", 5))

# fit model
fit <- estimate(Y = Y, iter = 1000)

# membership
membership <- c(rep("a", 5), rep("c", 5))

# define function
f <- function(x,...){
 assortment.discrete(x, ...)$r
}


net_stat <- roll_your_own(object = fit,
                          FUN = f,
                          types = membership,
                          weighted = TRUE,
                          SE = FALSE, M = 1)

# print
net_stat

# plot
plot(net_stat)

############################################
###### example 2: expected influence #######
############################################
# expected influence from this package
library(networktools)

# data
Y <- depression

# fit model
fit <- estimate(Y = Y, iter = 5000)

# define function
f <- function(x,...){
     expectedInf(x,...)$step1
}

# compute
net_stat <- roll_your_own(object = fit,
                          FUN = f,
                          iter = 1000)
# print
net_stat

# plot
plot(net_stat)


#######################################
### example 3: mixed data & bridge ####
#######################################
# bridge from this package
library(networktools)

# data
Y <- ptsd

fit <- estimate(Y,
                type = "mixed",
                iter = 1000)

# clusters
communities <- substring(colnames(Y), 1, 1)

# function is slow
f <- function(x, ...){
 bridge(x, ...)$`Bridge Strength`
}

net_stat <- roll_your_own(fit,
                          FUN = f,
                          select = TRUE,
                          communities = communities)

# print
net_stat

#plot
plot(net_stat)
}

}
