load(url("http://www.openintro.org/stat/data/mlb11.RData"))

head(mlb11)

with(mlb11, plot(at_bats, runs))

cor(mlb11$runs, mlb11$at_bats)

plot_ss(x = mlb11$at_bats, y = mlb11$runs)
plot_ss(x = mlb11$at_bats, y = mlb11$runs, showSquares = TRUE)

m1 <- lm(runs ~ at_bats, data = mlb11)
summary(m1)
plot(m1)

m2 <- lm(runs ~ homeruns, data = mlb11)
summary(m2)

plot(mlb11$runs ~ mlb11$at_bats)
abline(m1)


plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0

hist(m1$residuals)
qqnorm(m1$residuals)
qqline(m1$residuals) # adds diagonal line to the normal prob plot


summary(lm(runs ~ hits, data = mlb11)) #0.6419
summary(lm(runs ~ wins, data = mlb11)) #0.361
summary(lm(runs ~ bat_avg, data = mlb11)) #0.6561
summary(lm(runs ~ at_bats, data = mlb11)) #0.3729

summary(lm(runs ~ new_obs, data = mlb11)) #0.9349
summary(lm(runs ~ new_slug, data = mlb11)) #0.8969
summary(lm(runs ~ new_onbase, data = mlb11)) #0.8491
