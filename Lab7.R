load(url("http://www.openintro.org/stat/data/evals.RData"))

# Q3
median(evals$score)
boxplot(evals$score)
length(evals$score[evals$score < 3])
length(evals$score[evals$score > 4.6])/ length(evals$score)


# Q4
plot(evals$score ~ evals$bty_avg)

x = jitter(evals$score)
plot(x ~ evals$bty_avg, amount=1.5)

m_bty <- lm(score ~ bty_avg, data=evals)
abline(m_bty, col="red")


# Q5
plot(m_bty)

# Q6
plot(evals$bty_avg ~ evals$bty_f1lower)
cor(evals$bty_avg, evals$bty_f1lower)

plot(evals[,13:19])

m_bty_gen <- lm(score ~ bty_avg + gender, data = evals)
summary(m_bty_gen)

plot(m_bty_gen)

# Q7
multiLines(m_bty_gen)

# Q8
m_bty_rank <- lm(score ~ bty_avg + rank, data = evals)
summary(m_bty_rank)

# Q9
m_full <- lm(score ~ rank + ethnicity + gender + language + 
               age + cls_perc_eval + cls_students + cls_level + 
               cls_profs + cls_credits + bty_avg, data = evals)

summary(m_full)

# Q10
# rank removed
m1 <- lm(score ~ ethnicity + gender + language + age + 
           cls_perc_eval + cls_students + cls_level + 
           cls_profs + cls_credits + bty_avg, data = evals)
summary(m1)$adj.r.squared

# ethnicity removed
m2 = lm(score ~ rank + gender + language + age + cls_perc_eval +
          cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m2)$adj.r.squared

# bty_avg removed
m3 <- lm(score ~ rank + ethnicity + gender + language + 
           age + cls_perc_eval + cls_students + cls_level + 
           cls_profs + cls_credits, data = evals)
summary(m3)$adj.r.squared

# cls_profs removed
m4<- lm(score ~ rank + ethnicity + gender + language + 
          age + cls_perc_eval + cls_students + cls_level + 
          cls_credits + bty_avg, data = evals)
summary(m4)$adj.r.squared


# cls_students removed
m5 <- lm(score ~ rank + ethnicity + gender + language + 
           age + cls_perc_eval + cls_level + 
           cls_profs + cls_credits + bty_avg, data = evals)
summary(m5)$adj.r.squared