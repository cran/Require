% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Require-helpers.R
\docType{data}
\name{rversions}
\alias{rversions}
\title{R versions}
\format{
An object of class \code{data.frame} with 21 rows and 2 columns.
}
\usage{
rversions
}
\description{
Reference table of R versions and their release dates (2018 and later).
}
\details{
Update this as needed using \code{rversions::r_versions()}:

\verb{
# install.packages("rversions")
v = rversions::r_versions()
keep = which(as.Date(v$date, format = "%Y-%m-%d") >=
             as.Date("2018-01-01", format = "%Y-%m-%d"))
dput(v[keep, c("version", "date")])
}
}
\keyword{datasets}
