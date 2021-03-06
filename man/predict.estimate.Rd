% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict.estimate.R
\name{predict.estimate}
\alias{predict.estimate}
\title{Model Predictions for \code{estimate} Objects}
\usage{
\method{predict}{estimate}(object, newdata = NULL, summary = TRUE, cred = 0.95, iter = NULL, ...)
}
\arguments{
\item{object}{object of class \code{estimate}}

\item{newdata}{an optional data frame for obtaining predictions (e.g., on test data)}

\item{summary}{summarize the posterior samples (defaults to \code{TRUE}).}

\item{cred}{credible interval used for summarizing}

\item{iter}{number of posterior samples (defaults to all in the object).}

\item{...}{currently ignored}
}
\value{
\code{summary = TRUE}: 3D array of dimensions n (observations),
        4 (posterior summary),
        p (number of nodes). \code{summary = FALSE}:
        list containing predictions for each variable
}
\description{
Model Predictions for \code{estimate} Objects
}
\examples{
\donttest{
# # data
Y <- ptsd

fit <- estimate(Y, iter = 250)

pred <- predict(fit)

}

}
