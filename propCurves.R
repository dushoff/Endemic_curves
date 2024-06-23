bet <- exp(seq(log(0.1), log(8), length.out=100))
cvlist <- seq(0, 2, by=0.5)
numGroups <- 20

clist <- lapply(cvlist, function(cv){
	g <- makeDist(CV=cv, groups=numGroups)
	I <- propI(g, mult=bet)
})

cx <- 1.5
lwd <- 2.5
par(mar = c(5, 6, 4, 1.5), cex.lab = cx, cex.axis = cx, cex = cx)
## simple plot for comparison
plot(
	bet*(1+cvlist[[1]]^2), clist[[1]],
	type="l", log="x", lwd = lwd,
	xlab=expression(R[0]), ylab="Proportion affected", main = 'endemic equilibrium',
	xlim=c(0.1, max(bet)), bty='n', ylim = c(0,1.05), 
	yaxt='n')
axis(2, seq(0,1, by = .25), NA)
axis(2, seq(0,1, by = .5), las = 2)
abline(h=0.1, lty=2, lwd = lwd)
legend('topleft', c('homogeneous'), lwd = 2, bty = 'n')

## real R0 version
cols <- rainbow(length(clist))
cols[1] <- 'black'
par(mar = c(5, 6, 4, 1.5), cex.lab = cx, cex.axis = cx, cex = cx)
plot(
	bet*(1+cvlist[[1]]^2), clist[[1]],
	type="l", log="x",
	xlab=expression(R[0]), ylab="Proportion affected", lwd = lwd,
     main = 'endemic equilibrium', 
	xlim=c(0.1, max(bet)), bty = 'n', ylim = c(0,1.05),
	yaxt='n')
axis(2, seq(0,1, by = .25), NA)
axis(2, seq(0,1, by = .5), las = 2)
for (i in length(clist):1){
	lines(bet*(1+cvlist[[i]]^2), clist[[i]], col = cols[i], lwd = lwd)
}
legend('topleft',leg =cvlist, lty = 1, col = cols, bty = 'n', lwd = lwd,
       title = 'coefficient of variation')
abline(h=0.1, lty=2, lwd = lwd)


# Mixing rate version
par(mar = c(5, 6, 4, 1.5), cex.lab = cx, cex.axis = cx, cex = cx)
plot(bet, clist[[1]], type="l", log="x", xlab="Mean effective mixing (Rnull)", ylab="Proportion affected",
     main = 'endemic equilibrium', 
     	xlim=c(0.1, max(bet)), lwd = lwd, bty='n', ylim = c(0,1.05),
	yaxt='n')
axis(2, seq(0,1, by = .25), NA)
axis(2, seq(0,1, by = .5), las = 2)
cols[1] <- 'black'
par(mar = c(5, 6, 4, 1.5), cex.lab = cx, cex.axis = cx, cex = cx)
for (i in length(clist):1){
	lines(bet, clist[[i]], col = cols[i], lwd = lwd)
}
legend('topleft',leg =cvlist, lty = 1, col = cols, bty = 'n', lwd = lwd,
       title = 'coefficient of variation')
abline(h=0.1, lty=2, lwd = lwd)

## Even simpler plot (for a public lecture)
plot(
	bet*(1+cvlist[[1]]^2), clist[[1]],
	type="l", log="x", lwd = lwd,
	xlab="Population-level risk", ylab="Proportion affected", main = '',
	xlim=c(0.1, max(bet)), bty='n', ylim = c(0,1.05), 
	yaxt='n')
axis(2, seq(0,1, by = .25), NA)
axis(2, seq(0,1, by = .5), las = 2)
## abline(h=0.1, lty=2, lwd = lwd)
## legend('topleft', c('homogeneous'), lwd = 2, bty = 'n')
       
