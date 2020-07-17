Known issues: https://github.com/PredictiveEcology/reproducible/issues

version 0.0.5
==============

## New features
* moved several functions that have to do with package loading and installing from `reproducible` to `Require`, including `pkgDep`, `pkgDepTopoSort`

## minor
* errors in `available.packages` on old release on Mac. Worked around by manually running `available.packages` on specific systems.
* minor changes in non-exported functions
* handling of bugs in base::available.packages for old Mac machines and R versions

## bugfixes
* several minor
* recursive pkgDep did not correctly resolve multiple instances of the same package, each with different minimum version numbering. Now it reports minimum version required for all package dependencies

version 0.0.4
==============

## minor
remove `installed.packages` from test code, as per CRAN request

version 0.0.3
==============

## minor
Change title to Title Case in DESCRIPTION


version 0.0.2
==============

## minor
Change backticks to single quotes in DESCRIPTION

version 0.0.1
==============

## New features
* This is a rewrite of the function, `Require` (and helpers) which will be removed from package `reproducible`
* This function is intended to be a tool for package management used within a "reproducible" workflow
* It differs from all other attempts at achieving this goal by having the trait that the first and subsequent times the function `Require` is run, the result will be the same
