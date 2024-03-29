% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{linkOrCopy}
\alias{linkOrCopy}
\alias{fileRenameOrMove}
\title{Create link to file, falling back to making a copy if linking fails.}
\usage{
linkOrCopy(from, to, allowSymlink = FALSE)

fileRenameOrMove(from, to)
}
\arguments{
\item{from, to}{character vectors, containing file names or paths.}

\item{allowSymlink}{Logical. If \code{FALSE}, the default, then it will try
\code{file.link} first, then \code{file.copy}, omitting the \code{file.symlink} step}
}
\description{
First try to create a hardlink to the file. If that fails, try a symbolic
link (symlink) before falling back to copying the file. "File" here can mean
a file or a directory.
}
