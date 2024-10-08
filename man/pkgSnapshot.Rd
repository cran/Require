% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pkgSnapshot.R
\name{pkgSnapshot}
\alias{pkgSnapshot}
\alias{pkgSnapshot2}
\title{Take a snapshot of all the packages and version numbers}
\usage{
pkgSnapshot(
  packageVersionFile = getOption("Require.packageVersionFile"),
  libPaths = .libPaths(),
  standAlone = FALSE,
  purge = getOption("Require.purge", FALSE),
  exact = TRUE,
  includeBase = FALSE,
  verbose = getOption("Require.verbose")
)

pkgSnapshot2(
  packageVersionFile = getOption("Require.packageVersionFile"),
  libPaths,
  standAlone = FALSE,
  purge = getOption("Require.purge", FALSE),
  exact = TRUE,
  includeBase = FALSE,
  verbose = getOption("Require.verbose")
)
}
\arguments{
\item{packageVersionFile}{A filename to save the packages and their currently
installed version numbers. Defaults to \code{"packageVersions.txt"}.
If this is specified to be \code{NULL}, the function will return the exact
\code{Require} call needed to install all the packages at their current
versions. This can be useful to add to a script to allow for reproducibility of
a script.}

\item{libPaths}{The path to the local library where packages are installed.
Defaults to the \code{.libPaths()[1]}.}

\item{standAlone}{Logical. If \code{TRUE}, all packages will be installed to and
loaded from the \code{libPaths} only. NOTE: If \code{TRUE}, THIS WILL CHANGE THE
USER'S \code{.libPaths()}, similar to e.g., the \code{checkpoint} package. If
\code{FALSE}, then \code{libPath} will be prepended to \code{.libPaths()} during the
\code{Require} call, resulting in shared packages, i.e., it will include the
user's default package folder(s). This can be create dramatically faster
installs if the user has a substantial number of the packages already in
their personal library. Default \code{FALSE} to minimize package installing.}

\item{purge}{Logical. Should all caches be purged? Default is
\code{getOption("Require.purge", FALSE)}. There is a lot of internal caching of
results throughout the \code{Require} package. These help with speed and reduce
calls to internet sources. However, sometimes these caches must be purged.
The cached values are renewed when found to be too old, with the age limit.
This maximum age can be set in seconds with the environment variable
\code{R_AVAILABLE_PACKAGES_CACHE_CONTROL_MAX_AGE}, or if unset, defaults to 3600
(one hour -- see \code{\link[utils:available.packages]{utils::available.packages}}).

Internally, there are calls to \code{available.packages}.}

\item{exact}{Logical. If \code{TRUE}, the default, then for GitHub packages, it
will install the exact SHA, rather than the head of the \code{account/repo@branch}. For
CRAN packages, it will install the exact version. If \code{FALSE}, then GitHub
packages will identify their branch if that had been specified upon installation,
not a SHA. If the package had been installed with reference to a SHA, then it
will return the SHA as it does not know what branch it came from.
Similarly, CRAN packages will report their version and specify with a \code{>=},
allowing a subsequent user
to install with a minimum version number, as opposed to an exact version number.}

\item{includeBase}{Logical. Should R base packages be included, specifically,
those in \code{tail(.libPaths(), 1)}}

\item{verbose}{Numeric or logical indicating how verbose should the function
be. If -1 or -2, then as little verbosity as possible. If 0 or FALSE,
then minimal outputs; if \code{1} or TRUE, more outputs; \code{2} even more. NOTE: in
\code{Require} function, when \code{verbose >= 2}, also returns details as if
\code{returnDetails = TRUE} (for backwards compatibility).}
}
\value{
Will both write a file, and (invisibly) return a vector of packages with the
version numbers. This vector can be used directly in \code{Require}, though it should likely
be used with \code{require = FALSE} to prevent attaching all the packages.
}
\description{
This can be used later by \code{Require} to install or re-install the correct versions. See examples.
}
\details{
A file is written with the package names and versions of all packages within \code{libPaths}.
This can later be passed to \code{Require}.

\code{pkgSnapshot2} returns a vector of package names and versions, with no file output. See
examples.
}
\examples{
\dontrun{
if (Require:::.runLongExamples()) {
  opts <- Require:::.setupExample()

  # install one archived version so that below does something interesting
  libForThisEx <- tempdir2("Example")
  Require("crayon (==1.5.1)", libPaths = libForThisEx, require = FALSE)
  # Normal use -- using the libForThisEx for example;
  #    normally libPaths would be omitted to get all
  #    packages in user or project library
  tf <- tempfile()

  # writes to getOption("Require.packageVersionFile")
  # within project; also returns a vector
  # of packages with version
  pkgs <- pkgSnapshot(
    packageVersionFile = tf,
    libPaths = libForThisEx, standAlone = TRUE # only this library
  )

  # Now move this file to another computer e.g. by committing in git,
  #   emailing, googledrive
  #   on next computer/project
  Require(packageVersionFile = tf, libPaths = libForThisEx)

  # Using pkgSnapshot2 to get the vector of packages and versions
  pkgs <- pkgSnapshot2(
    libPaths = libForThisEx, standAlone = TRUE
  )
  Install(pkgs) # will install packages from previous line

  Require:::.cleanup(opts)
  unlink(getOption("Require.packageVersionFile"))
}
}

}
