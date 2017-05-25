gamFun <- function(nomCV, numGroups){
	wts <- rep(1/numGroups, length=numGroups)
	breaks <- seq(0, 1, length.out=1+numGroups)
	mids <- (breaks[-1]+breaks[-length(breaks)])/2
	means <- qgamma(mids, shape=1/nomCV^2)
	return(data.frame(
		wts=wts, means=means
	))
}
