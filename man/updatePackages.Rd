% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Require2.R
\name{updatePackages}
\alias{updatePackages}
\title{Update installed packages with latest available versions}
\usage{
updatePackages(
  libPaths = .libPaths()[1],
  purge = FALSE,
  verbose = getOption("Require.verbose")
)
}
\arguments{
\item{libPaths}{The library to update; defaults to \code{.libPaths()[1]}}

\item{purge}{Logical. Should the assessment of \code{installed.packages} purge the cached
version. Default is \code{FALSE}}

\item{verbose}{Numeric or logical indicating how verbose should the function
be. If -1 or -2, then as little verbosity as possible. If 0 or FALSE,
then minimal outputs; if \code{1} or TRUE, more outputs; \code{2} even more. NOTE: in
\code{Require} function, when \code{verbose >= 2}, also returns details as if
\code{returnDetails = TRUE} (for backwards compatibility).}
}
\value{
Run for its side effect, namely, updating installed packages to their latest
possible state, whether they are on CRAN currently, archived, or on GitHub.
}
\description{
Similar to \code{update.packages}, but works for archived, non-archived,
and Github packages.
}
