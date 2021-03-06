% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visRoleChanges.R
\name{visRoleChanges}
\alias{visRoleChanges}
\title{visRoleChanges}
\usage{
visRoleChanges(before, after)
}
\arguments{
\item{before}{A vector representing the job titles BEFORE a change.}

\item{after}{A vector representing the job titles AFTER a change. This must be paired with the BEFORE job titles and must be of the same length.}
}
\value{
visNetwork
}
\description{
This function requires two vectors representing
the titles of employees from two different time periods. This function is useful
for visualizing "before-and-after" role changes.
}
\examples{
before = c("builder","recruiter","manager","builder","builder")
after = c("builder","recruiter","manager","manager","builder")
visRoleChanges(before,after)
}
