% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictability.R
\name{predictability}
\alias{predictability}
\title{Predictability: Bayesian Variance Explained (R2)}
\usage{
predictability(
  object,
  select = FALSE,
  cred = 0.95,
  BF_cut = 3,
  iter = NULL,
  ...
)
}
\arguments{
\item{object}{object of class \code{estimate} or \code{explore}}

\item{select}{logical. Should the graph be selected ? The default is currently \code{FALSE}.}

\item{cred}{numeric. credible interval between 0 and 1  (default is 0.95) that is used for selecting the graph.}

\item{BF_cut}{numeric. evidentiary threshold (default is 3).}

\item{iter}{interger. iterations (posterior samples) used for computing R2.}

\item{...}{currently ignored.}
}
\value{
object of classes \code{bayes_R2} and \code{metric}
}
\description{
Compute nodewise predictability or  Bayesian variance explained \insertCite{@R2 @gelman_r2_2019}{BGGM}.
              In the context of GGMs, this method was described in \insertCite{Williams2019;textual}{BGGM}.
}
\note{
\strong{Binary and Ordinal Data}:

R2 is computed from the latent data.


\strong{Mixed Data}:

The mixed data approach is somewhat ad-hoc \insertCite{@see for example p. 277 in  @hoff2007extending;textual}{BGGM}. This
is becaue uncertainty in the ranks is not incorporated, which means that variance explained is computed from
the 'empirical' \emph{CDF}.

\strong{Model Selection}:

Currently the default to include all nodes in the model when computing R2. This can be changed (i.e., \code{select = TRUE}), which
then sets those edges not detected to zero. This is accomplished by subsetting the correlation matrix according to each neighborhood
of relations.
}
\examples{
\donttest{

# data
Y <- ptsd

fit <- estimate(Y, iter = 250)

r2 <- predictability(fit, select = TRUE, iter = 250)

# summary
r2

# plot
plot(r2)

}

}
\references{
\insertAllCited{}
}
