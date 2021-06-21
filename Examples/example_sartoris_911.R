# Undesrtanding heterocedasticity
#--------------------------------
# Back end
# Open R using radian (only for those who use radian)
# Open data base related to the example
t911<-read.table("C:/Users/klusk/Projects/R-studies/Examples/Satoris_911.txt", header=TRUE, sep="")
reg911=lm(consumo~Renda+juros, data=t911)
Regression<-summary(reg911)
resreg911=reg911$residuals
# Here we will plot a new graph using ggplot2
# In case you don't have ggplot2 -> install.packages(c('ggplot2') (use number 9 to Parana's repositorty)
library(ggplot2)
GresRenda<-ggplot(data = t911, aes(y=resreg911, x = Renda))+geom_point(col='Blue')+geom_abline(slope = 0)
GresJuro<-ggplot(data = t911, aes(y=resreg911, x = juros))+geom_point(col='Blue')+geom_abline(slope = 0)

# Step 1

# Park test for heterocedasticity
resreg911quad=resreg911^2
regpark911=lm(log(resreg911quad)~log(t911$Renda))
# Look for P-value in the end. If it does go over 5%, don't reject H0, so there isn't heterocedasticity - H0 = Beta can be 0

# Step 2

# Glesjser test for heterocedasticity
# Watch out for Beta. Is it significant - does t-value is significant?
glesjser_1=lm(abs(resreg911)~t911$Renda)
glesjser_2=lm(abs(resreg911)~sqrt(t911$Renda))
# Adjusting Renda to the third regression
Renda_Inv= 1/(t911$Renda)
glesjser_3=lm(abs(resreg911)~Renda_Inv)
# Adjusting Renda to the fourth regression
Renda_sqrt_Inv= 1/(sqrt(t911$Renda))
glesjser_4=lm(abs(resreg911)~Renda_sqrt_Inv)

# Step 3

# Spearman test for heterocedasticity
# We don't want any correlation between residuals and variables
# It will literally show if it is significant or not
Spearman=cor.test(abs(resreg911), t911$Renda, method= 'spearman')

# Step 4

# Goldfeld - Quandt for heterocedasticity
# If variable growns, the var(res) growns too - IT CANT DO THAT
# Here we will use lmtest
# In case you don't have lmtest -> install.packages(c('lmtest') (use number 9 to Paraná's repositorty)

library(lmtest)
gqtest=gqtest(reg911, order.by = ~Renda, data = t911, fraction = 4)
# fraction is the exact number of central observation that will be excluded to the test
# if p-value it is higher than 5%, we cant ignore H0 - there isn't heterocedasticity

# Step 5

# BPG test
# Here we will use car
# In case you don't have car -> install.packages('car') (use number 9 to Paraná's repository)

library(car)
bpg=ncvTest(lm(t911$consumo~t911$Renda))

# Step 6

# White test
# Here we will use skedastic
# In case you don't have car -> install.packages('skedastic') (use number 9 to Paraná's repository)

library(skedastic)
White_test=white_lm(reg911, interactions=FALSE, statonly=FALSE)
# Interactions -> X1X2 interactions between variables

White_test_crossed=white_lm(reg911, interactions=TRUE, statonly=FALSE)
# Stat only -> only the statistcs

#--------------------------------
# Front end
print(t911)
print(Regression)
print(resreg911)
print(GresRenda)
print(GresJuro)
print(resreg911quad)
print(summary(regpark911))
print(summary(glesjser_1))
print(summary(glesjser_2))
print(summary(glesjser_3))
print(summary(glesjser_4))
print(Spearman)
print(gqtest)
print(bpg)
print(White_test)
print(White_test_crossed)