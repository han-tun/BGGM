#' BGGM:  Bayesian Gaussian Graphical Models
#'
#' @description The \code{R} package \strong{BGGM} provides tools for making Bayesian inference in
#' Gaussian graphical models (GGM). The methods are organized around two general approaches for
#' Bayesian inference: (1) estimation \insertCite{Williams2019}{BGGM} and (2) hypothesis testing
#' \insertCite{Williams2019_bf}{BGGM}. The key distinction is that the former focuses on either the
#' posterior or posterior predictive distribution, whereas the latter focuses on model comparison.
#'
#' The methods in \strong{BGGM} build upon existing algorithms that are well-known in the literature.
#' The central contribution of \strong{BGGM} is to extend those approaches:
#'
#' \enumerate{
#'
#' \item Bayesian hypothesis testing with the novel matrix-F prior distribution \insertCite{Mulder2018}{BGGM}
#'
#' \item Comparing GGMs \insertCite{williams2020comparing}{BGGM}
#'
#' \item Assessing predictive accuracy ('predictability') with Bayesian variance explained
#'       \insertCite{gelman_r2_2019}{BGGM}
#' }
#'
#' Furthermore, the computationally intensive tasks are written in \code{c++} via the \code{R}
#' package \strong{Rcpp} \insertCite{eddelbuettel2011rcpp}{BGGM}.
#'
#' \bold{Supported Data Types}:
#'
#' \itemize{
#'
#' \item Continuous: The continuous method was described \insertCite{@in  @Williams2019_bf;textual}{BGGM}.
#'
#' \item Binary: The binary method builds directly upon \insertCite{@in @talhouk2012efficient;textual}{BGGM}.
#'
#' \item Ordinal: Ordinal data requires sampling thresholds. There are two approach included in \bold{BGGM}: (1)
#' the customary approach described in \insertCite{@in @albert1993bayesian;textual}{BGGM} (the default) and
#' the 'Cowles' algorithm described in \insertCite{@in @cowles1996accelerating;textual}{BGGM}.
#'
#'
#' \item Mixed: The mixed data (a combination of discrete and continuous) method was introduced
#' \insertCite{@in @hoff2007extending;textual}{BGGM}. This is a semi-parametric copula model
#' (i.e., a copula GGM) based on the ranked likelihood.
#'
#' }
#'
#' \strong{Interpretation of conditional (in)dependence models for latent data:}
#'
#' A  tetrachoric correlation (binary data) is a special case of a polychoric correlation (ordinal data).
#' Both relations are between "theorized normally distributed continuous \strong{latent} variables"
#' (\href{https://en.wikipedia.org/wiki/Polychoric_correlation}{Wikipedia}). In both instances,
#' the correpsonding partial correlation between observed variables is conditioned
#' on the remaining variables in the \emph{latent} space. This implies that interpration
#' is much the same as for continuous data, but with respect to latent variables.
#' We refer interested reader to \insertCite{@page 2364, section 2.2, in  @webb2008bayesian;textual}{BGGM}.
#' This also applies the the mixed data approach that is also latent variable model
#' \insertCite{hoff2007extending}{BGGM}.
#'
#' @references
#' \insertAllCited{}
#'
#'
#' @docType package
#'
#' @name BGGM-package
#'
#' @note
#'
#'
#'
#'
NULL