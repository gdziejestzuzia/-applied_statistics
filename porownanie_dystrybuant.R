n <- 500
mi <- 2
#a------------------------
losowe.rv <- function(mi, n) {
  u <- runif(n)
  x <- 2*mi*sqrt(u)
}
plot(losowe.rv(mi,n)) #wykres zmiennych losowych
#b--------------------------
dystr <- losowe.rv(mi, n) #funkcja losowe.rv dzia?a gdy j? si? przypisze do zmiennnej
plot(ecdf(dystr), main = "dystrybuanta empiryczna") # dystrybuanta empiryczna - funkcja ecdf

x1 <- seq(from = 0 , to = 2*mi, by = 0.01)
y1 = x1^2 / (4*mi^2) #dystrybuanta teoretyczna (ca?ka z podanej g?sto?ci)
#print(y1)
lines(x1, y1, type = "l", col = "red")
#c----------------------
c = 3/16
#d----------------------
theta_list <-c()
N <- 1000
for (i in 1:N) {
    z1 <- losowe.rv(2, 1)
    z2 <- losowe.rv(2, 1)
    theta <- c * (z1+3*z2)
theta_list[i] <- theta
}

sr <- mean(theta_list) #srednia z pr?bki
war <- var(theta_list) #wariancja z pr?bki
boxplot(theta_list) #boxplot estymator?w 

x_box <- seq(from = 0 , to = 2*mi, by = 0.01)
y_box <- c()
for(i in 1:length(x_box)){
  y_box[i] <- sr
}
lines(x_box, y_box, col = "red") #?rednia na boxplocie

#e---------------------------------------
n = 500
mi = 1

losowe.rv <- function(mi, n) {
  u <- runif(n)
  x <- 2*mi*sqrt(u)
  return <- x
}

u_wszystkie_1000 <- c()
max_pojedyncze <- max(losowe.rv(1, 500))
for(u in 1:1000){
  #1000 razy powtarzam generowanie 500razy U i wybieranie z tego max warto?ci
  max_pojedyncze <- max(losowe.rv(mi, 500))
  u_wszystkie_1000[u] <- max_pojedyncze
}
plot(ecdf(u_wszystkie_1000), main = "dystrybuanta empiryczna") #empiryczna

#teoretyczna

x_teor <- seq(0, 2, 0.001)
#y_teor <- c()
#x1 <- seq(from = 0 , to = 2*mi, by = 0.01)
y_teor = (x_teor/(2*mi))^(2*n)
#plot(x_teor, y_teor)
lines(x_teor, y_teor, col = "red")


