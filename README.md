# Analyzing-Customer-Churn-4

#### pseudo-observations


### 	Creating regular statistical models that do NOT have a proportional hazards assumption.

## Abstract

In the cox model, we had to throw out the coupon variable because it was violating assumptions and potentially ruining the validity of our statistics. In this paper we will used pseudo observations model, we don’t have to worry about the assumptions! We’re good to go! (Of course, cox regression is still more respected in the academic world) but we’re looking for meaningful business insight.


#### What are pseudo-observations?
Pseudo-observations are computed values which show how each observation contributes to the value of some summary statistic across the entire data set. The summary statistic selected could be the value of the survival curve at a particular time (e.g., 365 days), the Restricted Mean Survival Time, or some other measure.



## Introduction

We will again be using data on our fictional guitar tab subscription service, NetLixx. The data set is the same as the one we used for the cox regression paper – it’s got survival data, along with gender, age, and whether or not the customer signed up using a coupon for one month of free service.



## Approach

We will calculate pseudo-observations using RMST. Pseudo-observations are computed using a “jackknife” procedure. The jackknife method calculates the value of a summary statistic for the entire data set. It then systematically re-computes the value over and over, leaving out one observation at a time. As it does so, it keeps track of information on how the value of that statistic changes when each observation is left out. That information then becomes the pseudo-observation for each value.
Since this process is based on various derivatives of Kaplan-Meier curves, right-censoring problems are taken care of during the pseudo-observation creation. This allows the pseudo-observations to be popped right into relatively vanilla statistical models.

## Method

We used the geese function in R’s geepack package to create a Generalized Estimating Equations model. With the settings applied here, it’s basically a normal regression model, except that it’s relatively immune to certain statistical weirdness that can be introduced by the jackknife procedure. The result as fellow:

 
The coefficients for each of these variables represent what each of the variables does to the value of the 365-day RMST for this group of customers. So, customers that signed up with a coupon provide over 30 days less revenue in their first year due to faster churn rates. Customers provide a fraction of a day of additional revenue for every year older they are… not much for a one-year difference, but that’ll add up when you’re comparing a 20-year-old to her dad. The results on the gender variable are not significant in this data set.


## Conclusion

The coefficients above show that there can be directly related to revenue. For a $5 a month service, that 30 days of additional lifetime we get out of non-coupon customers is worth, well, $5. 

Finally, we have completed lots of great methods that may help any researcher get a handle on customer churn. We have looked at:

#### •	Estimating survival rates over time with Kaplan-Meier estimators
#### •	Evaluating differences between survival curves with the log-rank test
#### •	Incorporating multiple explanatory variables with cox regression
#### •	Quantifying lost revenue with Restricted Mean Survival Time
#### •	Creating pseudo-observations for applying vanilla statistics


