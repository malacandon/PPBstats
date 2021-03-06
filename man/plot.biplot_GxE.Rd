% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.biplot_GxE.R
\name{plot.biplot_GxE}
\alias{plot.biplot_GxE}
\title{Get ggplot to visualize output from \code{\link{biplot_data.check_model_GxE}}}
\usage{
\method{plot}{biplot_GxE}(x, ...)
}
\arguments{
\item{x}{Output from \code{\link{biplot_data.check_model_GxE}}}

\item{...}{further arguments passed to or from other methods}
}
\value{
It returns a list with 3 elements:
  \itemize{
   \item ecovalence
   \item interaction which display the interaction matrix
   \item biplot, a list of four elements :
    \itemize{
     \item simple_biplot : the biplot of location and germplasm
     \item which_won_where : plot to assess which germplasm win in which location (see \code{\link{ggplot_which_won_where}} for more information). Done only if gxe_analysis is GGE in \code{\link{model_GxE}}.
     \item mean_vs_stability : a list of two elements (see \code{\link{ggplot_mean_vs_stability}} for more information). Done only if gxe_analysis is GGE in \code{\link{model_GxE}}.
      \itemize{
       \item mean : assess mean of each germplasm (see Details for more information).
       \item stability : assess stability of each germplasm (see Details for more information).
      }
     \item discrimitiveness_vs_representativeness (see \code{\link{ggplot_discrimitiveness_vs_representativeness}} for more information) : a list of two elements. Done only if gxe_analysis is GGE in \code{\link{model_GxE}}.
      \itemize{
       \item discrimitiveness : assess discrimitiveness of each location (see Details for more information).
       \item representativeness : assess representativeness of each location (see Details for more information).
      }
     \item discrimitiveness_vs_representativeness :represents discrimitiveness versus representativeness (see Details for more information). 
    }
  }
}
\description{
\code{plot.biplot_GxE} returns ggplot to visualize outputs from \code{\link{biplot_data.check_model_GxE}}
}
\details{
S3 method.
The plot are done with the factoextra package
}
\seealso{
\itemize{
 \item \code{biplot_data}
}
}
\author{
Pierre Riviere
}
