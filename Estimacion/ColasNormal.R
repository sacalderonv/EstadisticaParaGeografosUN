##Colas Normal====
# define the mean and the standard deviation

mu <- 0
sigma <- 1

linf<--5
lsup<-5
# create vector for values of x that span a sufficient range of

# standard deviations on either side of the mean; here we use values

# for x that are four standard deviations on either side of the mean

x <- seq(linf, lsup, 0.01)

# use dnorm() to calculate probabilities for each x

y <- dnorm(x, mean = mu, sd = sigma)

# plot normal distribution curve; the options xaxt = "i" and yaxt = "i"

# force the axes to begin and end at the limits of the data

plot(x, y, type = "l", lwd = 2, col = "ivory4", ylab = "Densidad", xlab = "x", xaxs = "i", yaxs = "i",main="Densidad Normal")

alpha= 0.05
alpha_med=alpha/2
# create vector for values of x between a lower limit of 8 and an upper limit of 15
lowquantile = qnorm(alpha/2,mean=mu,sd=sigma)

upquantile = qnorm(1-alpha/2,mean=mu,sd=sigma)

dx_lowquantile = seq(linf, lowquantile, 0.01)
dx_upquantile = seq(upquantile, lsup,0.01)
# use polygon to fill in area; x and y are vectors of x,y coordinates

# that define the shape that is then filled using the desired color

polygon(x = c(linf, dx_lowquantile, lowquantile), y = c(0, dnorm(dx_lowquantile, mean = mu, sd = sigma), 0), border = NA, col = "ivory4")
polygon(x = c(upquantile, dx_upquantile, lsup), y = c(0, dnorm(dx_upquantile, mean = mu, sd = sigma), 0), border = NA, col = "ivory4")

###Colas Student-t====

# define the mean and the standard deviation

gl<-10

linf<--5
lsup<-5
# create vector for values of x that span a sufficient range of

# standard deviations on either side of the mean; here we use values

# for x that are four standard deviations on either side of the mean

x <- seq(linf, lsup, 0.01)

# use dnorm() to calculate probabilities for each x

y <- dt(x,df = gl)

# plot normal distribution curve; the options xaxt = "i" and yaxt = "i"

# force the axes to begin and end at the limits of the data

plot(x, y, type = "l", lwd = 2, col = "ivory4", ylab = "Densidad", xlab = "x", xaxs = "i", yaxs = "i",main="Densidad t-Student")

alpha= 0.05
alpha_med=alpha/2
# create vector for values of x between a lower limit of 8 and an upper limit of 15
lowquantile = qt(alpha/2,df=gl)

upquantile = qt(1-alpha/2,df=gl)

dx_lowquantile = seq(linf, lowquantile, 0.01)
dx_upquantile = seq(upquantile, lsup,0.01)
# use polygon to fill in area; x and y are vectors of x,y coordinates

# that define the shape that is then filled using the desired color

polygon(x = c(linf, dx_lowquantile, lowquantile), y = c(0, dt(dx_lowquantile, df=gl), 0), border = NA, col = "ivory4")
polygon(x = c(upquantile, dx_upquantile, lsup), y = c(0, dt(dx_upquantile, df=gl), 0), border = NA, col = "ivory4")

