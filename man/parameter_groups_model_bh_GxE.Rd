% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameter_groups_model_bh_GxE.R
\name{parameter_groups_model_bh_GxE}
\alias{parameter_groups_model_bh_GxE}
\title{Get matrix with variables in column and effect in row from \code{\link{check_model.fit_model_bh_GxE}}}
\usage{
parameter_groups_model_bh_GxE(list_out_check_model_model_bh_GxE, parameter)
}
\arguments{
\item{list_out_check_model_model_bh_GxE}{A list whose elements are output from \code{\link{check_model.fit_model_bh_GxE}}}

\item{parameter}{parameter on which to get the matrix: alpha, beta or theta}
}
\value{
The function returns a data frame with variables in column and effect of paramters in row
}
\description{
\code{parameter_groups_model_bh_GxE} gets matrix with variables in column and effect in row
}
\seealso{
\code{\link{parameter_groups}}
}
\author{
Pierre Riviere
}
