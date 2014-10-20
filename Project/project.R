library(vcd)
# Load the dataset.
load("statistics-project-anes.RData")

# Load the 'inference' function:
source("http://bit.ly/dasi_inference")

# codebook: https://d396qusza40orc.cloudfront.net/statistics%2Fproject%2Fanes1.html
# https://class.coursera.org/statistics-002/forum/thread?thread_id=724

# Do voters with higher income favour a republican candidate?

vote <- anes$presvote2012_x
income <- anes$incgroup_prepost
DF <- data.frame(vote, income)

DF <- DF[complete.cases(DF), ]

levels(DF$income)

levels(DF$income) <- c("<5", "<15", "<15", "<15", "<20", 
                        "<20", "<30", "<30", "<30", "<30", 
                        "<40", "<40", "<60", "<60", "<60", 
                        "<80", "<80", "<80", "<80", "<100", 
                        "<100", "<250", "<250", "<250", "<250", 
                        "<250", "<250", ">250")


with(DF, plot(income, vote, col = c("blue", "red", "pink"), xlab = "Voter Income ($)", 
               ylab = "Candidate", main = "Voter Income vs Candidate for USA 2012"))

a <- table(DF$income, DF$vote)

mosaicplot(a, xlab = "Voter Income group ($1000)", 
           ylab = "Candidate voted for", main = "Voter Income vs Candidate for USA 2012", 
           col = c("#FF3333", "#3333FF", "#33CC00"))

chisq.test(a)


inference(y = droplevels(DF$income), x = DF$vote, est = "proportion", 
          type = "ht", alternative = "greater", method = "simulation", 
          eda_plot = FALSE, inf_plot = FALSE, sum_stats = TRUE)

