library(rmarkdown)
---
title: "Exercício semana 8"
output: word_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
Aluno: (Vinícius Araújo Kluska)  

Ao resolver esta Lista de Exercícios, devem ser mostrados os comandos em R utilizados, juntamente com a solução de cada item. 

# 1) Regressão Múltipla com Mínimos Quadrados Ordinários (MQO)  
Utilizando os dados da tabela "crime1.txt" extraída do Wooldridge e disponível no Moodle, estime a regressão de narr86 como variável dependente em função de pcnv, avgsen, ptime86, qemp86. A descrição das variáveis se encontra no arquivo texto "crime1.DES", também disponível no Moodle.  
  
a) Apresente os resultados obtidos com o R incluindo comandos, estimativas, teste t, teste F e R quadrado e analise-os.  
b) Analise o teste t. Apresente a H0 e responda à questão: os coeficientes da regressão são significativos a 5%?  
c) Analise o teste F. Apresente a H0 e responda à questão: os coeficientes da regressão são significativos conjuntamente?   
d) Analise o R quadrado, respondendo à questão: quanto a regressão explica das variações da variável dependente?  

##  a)
tCrime<-read.table("C:/Users/klusk/Projects/R-studies/Econometrics_s308/Crime_1.txt", header=TRUE, sep="")
regCrime=lm(Y~X2+X3+X4+X5, data=tCrime)
Regression<-summary(regCrime)
resregCrime=regCrime$residuals
Print(Regression)


##  b)    


##  c)  


##  d)  

  


