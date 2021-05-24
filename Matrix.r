#Exemplo 4.8 Hoffmann. Yi-=B(0)+B(1)X(1i)+B(2)X(2i)+u(i)
X1=c(1,3.5,4,7.5,9)
X2=c(2,3,4,5,6)
Yi=c(16.5,14,6,10,3.5)
Y=matrix(data=Yi, nrow = 5, ncol = 1, byrow = FALSE)
intercepto=c(1,1,1,1,1)
X=cbind(intercepto,X1,X2)
XtX=t(X)%*%X
XtX
#         intercepto    X1  X2
# intercepto          5  25.0  20
# X1                 25 166.5 120
# X2                 20 120.0  90
 XtXinv=solve(XtX)
 XtXinv
#            intercepto         X1        X2
# intercepto        7.8  2.0000000 -4.400000
# X1                2.0  0.6666667 -1.333333
# X2               -4.4 -1.3333333  2.766667
 XtY=t(X)%*%Y
 XtY
        #    [,1]
# intercepto   50
# X1          196
# X2          170
 betas=XtXinv%*%XtY
 betas
        #    [,1]
# intercepto   34
# X1            4
# X2          -11
 plot(X1,Yi)
 plot(X2,Yi)
 plot(X1,X2)
 var(X1,X2)
# [1] 5