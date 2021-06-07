#Just testing this trello/github integration
X1=c(1,3.5,4,7.5,9)
X2=c(2,3,4,5,6)
Yi=c(16.5,14,6,10,3.5)
Y=matrix(data=Yi, nrow = 5, ncol = 1, byrow = FALSE)
intercepto=c(1,1,1,1,1)
X=cbind(intercepto,X1,X2)
XtX=t(X)%*%X