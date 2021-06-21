# What to do if heteroscedasticity
#--------------------------------
# Back end
# Open R using radian (only for those who use radian)
# Open data base related to the example
tdefesa<-read.table("C:/Users/klusk/Projects/R-studies/Examples/defesa_Gujarati_7_8.txt", header=TRUE, sep="")
regDefesa=lm(Y~X2+X3+X4+X5, data=tdefesa)
Regression<-summary(regDefesa)
resregDefesa=regDefesa$residuals
# Step 1

# Park
resregDefesaquad=resregDefesa^2
regpark=lm(log(resregDefesaquad)~log(tdefesa$X2))
# Look for P-value in the end. If it does go over 5%, don't reject H0, so there isn't heterocedasticity - H0 = Beta can be 0

# Step 2

# Glesjser
# Watch out for Beta. Is it significant - does t-value is significant?
glesjser_1=lm(abs(resregDefesa)~tdefesa$X2)
glesjser_2=lm(abs(resregDefesa)~sqrt(tdefesa$X2))
# Adjusting X2 to the third regression
X2_Inv= 1/(tdefesa$X2)
glesjser_3=lm(abs(resregDefesa)~X2_Inv)
# Adjusting X2 to the fourth regression
X2_sqrt_Inv= 1/(sqrt(tdefesa$X2))
glesjser_4=lm(abs(resregDefesa)~X2_sqrt_Inv)

# Step 3

# Spearman
# We don't want any correlation between residuals and variables
# It will literally show if it is significant or not
Spearman=cor.test(abs(resregDefesa), tdefesa$X2, method= 'spearman')

# Step 4

# Goldfeld - Quandt
# If variable growns, the var(res) growns too - IT CANT DO THAT
# Here we will use lmtest
# In case you don't have lmtest -> install.packages(c('lmtest') (use number 9 to Paraná's repositorty)

library(lmtest)
gqtest=gqtest(regDefesa, order.by = ~X2, data = tdefesa, fraction = 4)
# fraction is the exact number of central observation that will be excluded to the test
# if p-value it is higher than 5%, we cant ignore H0 - there isn't heterocedasticity

# Step 5

# BPG test
# Here we will use car
# In case you don't have car -> install.packages('car') (use number 9 to Paraná's repository)

library(car)
bpg=ncvTest(lm(tdefesa$Y~tdefesa$X2))

# Step 6

# White test
# Here we will use skedastic
# In case you don't have car -> install.packages('skedastic') (use number 9 to Paraná's repository)

library(skedastic)
White_test=white_lm(regDefesa, interactions=FALSE, statonly=FALSE)
# Interactions -> X1X2 interactions between variables

White_test_crossed=white_lm(regDefesa, interactions=TRUE, statonly=FALSE)
# Stat only -> only the statistcs

#--------------------------------
# Front end
print(tdefesa)
print(Regression)
print(resregDefesa)
print(resregDefesaquad)
print(summary(regpark))
print(summary(glesjser_1))
print(summary(glesjser_2))
print(summary(glesjser_3))
print(summary(glesjser_4))
print(Spearman)
print(gqtest)
print(bpg)
print(White_test)
print(White_test_crossed)