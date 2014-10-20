load(url("http://www.openintro.org/stat/data/kobe.RData"))
head(kobe)

kobe_streak <- calc_streak(kobe$basket)
barplot(table(kobe_streak))

boxplot(kobe_streak)

outcomes <- c("heads", "tails")
sample(outcomes, size = 1, replace = TRUE)

sim_fair_coin <- sample(outcomes, size = 100, replace = TRUE)
sim_fair_coin
table(sim_fair_coin)

sim_unfair_coin <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.2, 0.8))

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 1, replace = TRUE)
sim_basket <- sample(outcomes, size = 133, replace = TRUE, prob = c(.45, .55))db

streaks <- calc_streak(sim_basket)

par(mfrow = c(1, 2))
barplot(table(kobe_streak))
barplot(table(streaks))


n <- 3000000
p <- 0.00001
k <- 35

choose(n, k) * (p^k) * ((1-p)^(n-k))
