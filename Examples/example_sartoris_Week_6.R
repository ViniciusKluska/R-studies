# Understandig multicollinearity 
# Open new data - example_sartoris.R
Sartoris<-read.table("C:/Users/klusk/Projects/R-studies/Examples/Exemplo_Sartoris.csv", header=TRUE, sep=";")
summary(Sartoris)
# Ploting a new hist just for fun :)
hist(Sartoris$consumo, main="Consumo", col="orange", xlab="Consumo", ylab="Frequência")
# Elaborating a regression
regsartoris=lm(consumo~renda+taxa_de_juros, data=Sartoris)
# Estimation results
summary(regsartoris)
# Here lives the problem: though F test says the regression model is valid (Ftab = 3,81 ; Fcalc = 17,6), the coeficients aren't significants (they failed test T bellow 0.1 significance).
cor(Sartoris$renda, Sartoris$taxa_de_juros)
# cor is too high!!! - multicollinearity
# We must consider that, how F is valid, a bigger sample from this ppopulation is a good way to mitigaste multicollinearity.
# testing each variable alone:
regsartoris_renda <- lm(consumo~renda, data = Sartoris)
regsartoris_taxa <- lm(consumo~taxa_de_juros, data = Sartoris)
renda = summary(regsartoris_renda)
taxa = summary(regsartoris_taxa)
# The results from these commands are significants - both tests F and T are highly significants
residuo <- (regsartoris$residuals)

#jarque-Bera test
library(lawstat)
jarquebera=rjb.test(residuo, option="JB")

# --------------------------------------------------------
# front
documentclass(article)
begin(document)
# Graphic analanys
plot(residuo)
hist(residuo)
qqnorm(residuo)
# If residual has a normal distribution,it will show a linear graph.


# write.table(my_data, file = my_data.txt, sep ",")
print("regsartoris renda:")
print(renda)
print("regsartoris taxa:")
print(taxa)
print("Jarque Bera:")
print(jarquebera)
end(document)