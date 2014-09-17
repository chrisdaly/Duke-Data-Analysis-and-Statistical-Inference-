# https://d396qusza40orc.cloudfront.net/statistics%2FDocuments%2FLabs%2FLab_Unit1_Lab0.pdf

source("http://www.openintro.org/stat/data/present.R")

dim(present)

present$boys

plot(x = present$year, y = present$girls)
plot(x = present$year, y = present$girls, type = "l")

plot(present$year, present$boys + present$girls, type = "l")

max( present$boys + present$girls)

sort( present$boys + present$girls)

DF <- data.frame(present$year,  present$boys + present$girls)
names(DF) <- c("Year", "Births")
DF <- DF[with(DF, order(-Births, Year)), ]

plot(present$year, present$boys/(present$boys + present$girls)
, type = "l")

plot(present$year, present$boys/present$girls, type = "l")

DF1 <- data.frame(present$year,  present$boys-present$girls)
names(DF1) <- c("Year", "Difference")
b <- DF1[]
DF1 <- DF1[with(DF1, order(-Difference)), ]
DF1
