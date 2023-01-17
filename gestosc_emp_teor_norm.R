EX<- 0
VarX<- 1
Ylist<- c()
n <- 1000
X <- rnorm(n, EX, VarX)

x<- seq(from = -10, to =10, by=0.1)
plot(x, pnorm(x,mean=0, sd=1), type = 'o', col='red')
lines(ecdf(X), col = 'blue')


