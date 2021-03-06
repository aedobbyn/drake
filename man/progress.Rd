% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-progress.R
\name{progress}
\alias{progress}
\title{Get the build progress of your targets
during a \code{\link[=make]{make()}}.}
\usage{
progress(..., list = character(0), no_imported_objects = FALSE,
  path = getwd(), search = TRUE, cache = drake::get_cache(path =
  path, search = search, verbose = verbose), verbose = 1L, jobs = 1)
}
\arguments{
\item{...}{Objects to load from the cache, as names (unquoted)
or character strings (quoted). Similar to \code{...} in
\code{remove()} and \code{rm()}.}

\item{list}{Character vector naming objects to be loaded from the
cache. Similar to the \code{list} argument of \code{\link[=remove]{remove()}}.}

\item{no_imported_objects}{Logical, whether to only return information
about imported files and targets with commands (i.e. whether to ignore
imported objects that are not files).}

\item{path}{Root directory of the drake project,
or if \code{search} is \code{TRUE}, either the
project root or a subdirectory of the project.
Ignored if a \code{cache} is supplied.}

\item{search}{Logical. If \code{TRUE}, search parent directories
to find the nearest drake cache. Otherwise, look in the
current working directory only.
Ignored if a \code{cache} is supplied.}

\item{cache}{drake cache. See \code{\link[=new_cache]{new_cache()}}.
If supplied, \code{path} and \code{search} are ignored.}

\item{verbose}{Logical or numeric, control printing to the console.
\itemize{
\item \code{0} or \code{FALSE}: print nothing.
\item \code{1} or \code{TRUE}: print only targets to build.
\item \code{2}: plus checks and cache info.
\item \code{3}: plus missing imports.
\item \code{4}: plus all imports.
\item \code{5}: plus execution and total build times for targets.
\item \code{6}: plus notifications when targets are being stored.
}}

\item{jobs}{Number of jobs/workers for parallel processing.}
}
\value{
The build progress of each target reached by
the current \code{\link[=make]{make()}} so far.
}
\description{
Objects that drake imported, built, or attempted
to build are listed as \code{"finished"} or \code{"in progress"}.
Skipped objects are not listed.
}
\examples{
\dontrun{
test_with_dir("Quarantine side effects.", {
if (requireNamespace("knitr")) {
load_mtcars_example() # Get the code with drake_example("mtcars").
make(my_plan) # Run the project, build the targets.
# Watch the changing progress() as make() is running.
progress() # List all the targets reached so far.
progress(small, large) # Just see the progress of some targets.
progress(list = c("small", "large")) # Same as above.
progress(no_imported_objects = TRUE) # Ignore imported R objects.
}
})
}
}
\seealso{
\code{\link[=diagnose]{diagnose()}}, \code{\link[=drake_get_session_info]{drake_get_session_info()}},
\code{\link[=cached]{cached()}}, \code{\link[=readd]{readd()}}, \code{\link[=drake_plan]{drake_plan()}}, \code{\link[=make]{make()}}
}
