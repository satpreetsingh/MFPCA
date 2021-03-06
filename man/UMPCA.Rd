% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/UMPCA.R
\name{UMPCA}
\alias{UMPCA}
\title{UMPCA: Uncorrelated Multilinear Principle Component Analysis}
\usage{
UMPCA(TX, numP)
}
\arguments{
\item{TX}{The input training data in tensorial representation, the last mode
is the sample mode. For \code{N}th-order tensor data, \code{TX} is of
\code{(N+1)}th-order with the \code{(N+1)}-mode to be the sample mode.
E.g., 30x20x10x100 for 100 samples of size 30x20x10.}

\item{numP}{The dimension of the projected vector, denoted as \eqn{P} in the
  paper. It is the number of elementary multilinear projections (EMPs) in
  tensor-to-vector projection.}
}
\value{
\item{Us}{The multilinear projection, consisting of \code{numP}
  (\eqn{P} in the paper) elementary multilinear projections (EMPs), each EMP
  is consisted of \code{N} vectors, one in each mode.} \item{TXmean}{The mean
  of the input training samples \code{TX}.} \item{odrIdx}{The ordering index
  of projected features in decreasing variance.}
}
\description{
This function implements the uncorrelated multilinear principal component
analysis for tensors of dimension 2, 3 or 4. The code is basically the same
as in the  MATLAB toolbox UMPCA by Haiping Lu (Link:
\url{http://www.mathworks.com/matlabcentral/fileexchange/35432}, see also
references).
}
\section{Warning}{
 As this algorithm aims more at uncorrelated features than
  at an optimal reconstruction of the data, hence it might give poor results
  when used for the univariate decomposition of images in MFPCA.
}
\examples{
set.seed(12345)

 # define "true" components
 a <- sin(seq(-pi, pi, length.out = 100))
 b <- exp(seq(-0.5, 1, length.out = 150))

 # simulate tensor data
 X <- a \%o\% b \%o\% rnorm(80, sd = 0.5)

 # estimate one component
 UMPCAres <- UMPCA(X, numP = 1)

 # plot the results and compare to true values
 plot(UMPCAres$Us[[1]][,1])
 points(a/sqrt(sum(a^2)), pch = 20) # eigenvectors are defined only up to a sign change!
 legend("topright", legend = c("True", "Estimated"), pch = c(20, 1))

 plot(UMPCAres$Us[[2]][,1])
 points(b/sqrt(sum(b^2)), pch = 20)
 legend("topleft", legend = c("True", "Estimated"), pch = c(20, 1))
}
\references{
Haiping Lu, K.N. Plataniotis, and A.N. Venetsanopoulos,
  "Uncorrelated Multilinear Principal Component Analysis for Unsupervised
  Multilinear Subspace Learning", IEEE Transactions on Neural Networks, Vol.
  20, No. 11, Page: 1820-1836, Nov. 2009.
}

