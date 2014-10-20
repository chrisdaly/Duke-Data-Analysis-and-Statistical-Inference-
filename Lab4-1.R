load(url("http://bit.ly/dasi_nc"))


hist(nc$gained)
summary(nc$gained)

gained_clean = na.omit(nc$gained)
n = length(gained_clean)

boot_means = rep(NA, 100)
for(i in 1:100){
  boot_sample = sample(gained_clean, n, replace = TRUE)
  boot_means[i] = mean(boot_sample)
}

# exercise: construct 90% bootstrap CI
mn <- mean(boot_means)
s <- sd(boot_means)
CI = mn + c(-1, 1) * (1.65) * (s / length(boot_means))

# New loop function for bootstrapping
source("http://bit.ly/dasi_inference")

# Percent Method
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.9, est = "mean",
          boot_method = "perc")

inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "mean",
          boot_method = "perc")

# Standard Error Method
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "mean",
          boot_method = "se")

# Interval for median
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "median",
          boot_method = "se")

inference(nc$fage, type="ci", method="simulation", conflevel=0.95, est = "mean",
          boot_method = "se")


boxplot(weight~habit, data=nc)

by(nc$weight, nc$habit, mean)
tapply(nc$weight, nc$habit, FUN=mean)

# Checking if inference conditions are satisfied
tapply(nc$weight, nc$habit, FUN=length)

inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0,
          alternative = "twosided", method = "theoretical")

inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", null = 0,
          alternative = "twosided", method = "theoretical")

# Q8
tapply(nc$mage, nc$mature, FUN=min)
tapply(nc$mage, nc$mature, FUN=max)

load(url("http://bit.ly/dasi_gss_ws_cl"))

summary(gss)

with(gss, tapply(wordsum, class, FUN = median))
boxplot(wordsum ~ class, data=gss)

inference(y = gss$wordsum, x = gss$class, est = "mean", type = "ht",
          alternative = "greater", method = "theoretical")

inference(y=gss$wordsum, x=gss$class, est="mean", type="ht", 
          alternative="greater", method="theoretical")