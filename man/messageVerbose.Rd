% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{messageDF}
\alias{messageDF}
\alias{messageVerbose}
\alias{messageVerboseCounter}
\title{Use message to print a clean square data structure}
\usage{
messageDF(df, round, verbose = getOption("Require.verbose"), verboseLevel = 1)

messageVerbose(..., verbose = getOption("Require.verbose"), verboseLevel = 1)

messageVerboseCounter(
  pre = "",
  post = "",
  verbose = getOption("Require.verbose"),
  verboseLevel = 1,
  counter = 1,
  total = 1,
  minCounter = 1
)
}
\arguments{
\item{df}{A data.frame, data.table, matrix}

\item{round}{An optional numeric to pass to \code{round}}

\item{verbose}{Numeric or logical indicating how verbose should the function
be. If -1 or -2, then as little verbosity as possible. If 0 or FALSE,
then minimal outputs; if \code{1} or TRUE, more outputs; \code{2} even more. NOTE: in
\code{Require} function, when \code{verbose >= 2}, also returns details as if
\code{returnDetails = TRUE} (for backwards compatibility).}

\item{verboseLevel}{A numeric indicating what verbose threshold (level) above
which this message will show.}

\item{...}{Passed to \code{install.packages}. Good candidates are e.g., \code{type} or
\code{dependencies}. This can be used with \code{install_githubArgs} or
\code{install.packageArgs} which give individual options for those 2 internal
function calls.}

\item{pre}{A single text string to paste before the counter}

\item{post}{A single text string to paste after the counter}

\item{counter}{An integer indicating which iteration is being done}

\item{total}{An integer indicating the total number to be done.}

\item{minCounter}{An integer indicating the minimum (i.e,. starting value)}
}
\value{
Used for side effects, namely messaging that can be turned on or off with different
numeric values of \code{verboseLevel}. A user sets the \code{verboseLevel} for a particular
message.
}
\description{
Sends to \code{message}, but in a structured way so that a data.frame-like can
be cleanly sent to messaging.

This will only show a message if the value of \code{verbose} is greater than the
\code{verboseLevel}. This is mostly useful for developers of code who want to give
users of their code easy access to how verbose their code will be. A developer
of a function will place this \code{messageVerbose} internally, setting the \code{verboseLevel}
according to how advanced they may want the message to be. \code{1} is a reasonable
default for standard use, \code{0} would be for "a very important message for all users",
\code{2} or above would be increasing levels of details for e.g., advanced use.
If a user sets to \code{-1} with this numeric approach, they can avoid all messaging.
}
