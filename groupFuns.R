
# Calculate non-central moments
gmoment <- function(g, p=1){
	return(sapply(p, function(pc){
		return(with(g, sum(wts*means^(pc))))
	}))
}

# Calculate coefficient of variation
gcv <- function(g){
	mom <- gmoment(g,p=1:2)
	V <- mom[2]-mom[1]^2
	return(sqrt(V)/mom[1])
}

# Make a distribution with mean 1 and desired CV.  This needs a distribution function which takes a nominal CV and returns a group structure with _approximately_ that CV (typically, asymptotically it would have that CV).
makeDist <- function(CV=1, groups=10, dfun=gamFun, cvFactor=2){
	if (CV==0){
		return(data.frame(
			wts=1, means=1
		))
	}

	lowCV = CV/cvFactor
	highCV = CV*cvFactor

	if(gcv(dfun(lowCV, groups))>CV){
		stop("Can't get a small enough CV; is something wrong with your distribution function?")
	}

	if(gcv(dfun(highCV, groups))<CV){
		stop("Can't get a large enough CV; check the distribution function, or add more boxes?")
	}

	nomCV <- uniroot(function(nomCV){
		return(gcv(dfun(nomCV, groups)) - CV)
	}, c(lowCV, highCV))$root

	g <- dfun(nomCV, groups)
	g <- within(g, {
		wts <- wts/(sum(wts))
	})
	g$means <- g$means/gmoment(g)

	return(g)
}
