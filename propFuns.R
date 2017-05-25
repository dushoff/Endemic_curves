Lfun <- function(g, L){
	return(with(g, sum(wts*means^2/(1+means*L))))
}

propLam <- function(g, mult=NULL){
	if(!is.null(mult)) {g$means <- mult*g$means}
	mom <- gmoment(g, 1:3)
	Lmax <- mom[3]/mom[2]
	if(Lfun(g, 0) <= mom[1]) {return (0)}
	if(Lfun(g, Lmax) > mom[1]) {
		stop("Problem with propLam (or your distribution)!")
	}

	return(uniroot(function(L){
		return(Lfun(g, L)- mom[1])
	},
		interval=c(0, Lmax)
	)$root)
}

propI <- function(g, mult){
	sapply(mult, function(m){
		g$means <- m*g$means
		Lam <- propLam(g)
		return(with(g, 
			sum(wts*means*Lam/(1+means*Lam))
		))
	})
}
