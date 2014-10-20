load(url("http://www.openintro.org/stat/data/ames.RData"))

area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
hist(area)

samp0 <- sample(area, 50)
samp1 <- sample(area, 50)

sample_means50 <- rep(NA, 5000)
for (i in 1:5000) {
  samp <- sample(area, 50)
  sample_means50[i] <- mean(samp)
}

hist(sample_means50)
hist(sample_means50, breaks = 25)

sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)
for (i in 1:5000) {
  samp <- sample(area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area, 100)
  sample_means100[i] <- mean(samp)
}


sample_means50 <- sample(price, 50)


sample_means150 <- sample(price, 150)
