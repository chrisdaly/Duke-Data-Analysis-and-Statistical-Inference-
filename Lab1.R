source("http://www.openintro.org/stat/data/cdc.R")
names(cdc)
dim(cdc)
head(cdc)
tail(cdc)

summary(cdc$weight)
mean(cdc$weight)
var(cdc$weight)
median(cdc$weight)

table(cdc$smoke100)
table(cdc$smoke100)/20000
barplot(table(cdc$smoke100))

summary(cdc$genhlth)
4657/length(cdc$genhlth)

## mosaic plot, using tables
table(cdc$gender)
gender_smokers = table(cdc$gender, cdc$smoke100)
mosaicplot(gender_smokers)

dim(cdc)
cdc[567, 6]
cdc[1:10, 6]
cdc$gender == "m"
mdata = subset(cdc, cdc$gender == "m")
m_and_over30 = subset(cdc, cdc$gender == "m" & cdc$age > 30)

under23.and.smoke <- subset(cdc, cdc$age < 23 & cdc$smoke100 == 1)
dim(under23.and.smoke)

boxplot(cdc$height)
summary(cdc$height)
boxplot(cdc$height ~ cdc$gender)

## boxplot ~
bmi = (cdc$weight/cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)

hist(cdc$age)
hist(bmi)
hist(bmi, breaks = 50)

plot(cdc$wtdesire, cdc$weight)
abline(lm(cdc$weight ~ cdc$wtdesire), col= "red")

