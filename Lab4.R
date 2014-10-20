load(url("http://www.openintro.org/stat/data/ames.RData"))

population <- ames$Gr.Liv.Area
samp <- sample(population, 60)

sample_mean <- mean(samp)

se <- sd(samp)/sqrt(60)
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)

mean(population)

samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60

for(i in 1:50){
  samp <- sample(population, n) # obtain a sample of size n = 60 from the population
  samp_mean[i] <- mean(samp) # save sample mean in ith element of samp_mean
  samp_sd[i] <- sd(samp) # save sample sd in ith element of samp_sd
}

lower <- samp_mean - 1.96 * samp_sd/sqrt(n)
upper <- samp_mean + 1.96 * samp_sd/sqrt(n)

c(lower[1], upper[1])

plot_ci(lower, upper, mean(population))

