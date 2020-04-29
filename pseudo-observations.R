# Load the pseudo library

library(pseudo)

# Read in the data

mydata <- read.csv('C:/Users/tahan/OneDrive/Desktop/Customer Churn/NetLixxCox.csv')
summary(mydata)
str(mydata)
attach(mydata)

# Create pseudo observations using 365-day RMST

mydata$pseudo<- pseudomean(time,churn,365)


# Load the geepack library

library(geepack)

# Add an ID to each observation, since it's required by the geese function

n <- length(time)

mydata<- data.frame(mydata,id=1:n)
head(mydata)


#Fit a regression model

fit <- geese(pseudo ~ female + age + coupon,
             
             data = mydata, id = id, jack = TRUE, family = gaussian,
             
             corstr = "independence", scale.fix = FALSE)
summary(fit)


















