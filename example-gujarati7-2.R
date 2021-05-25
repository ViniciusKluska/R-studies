 #Exemplo 7.2 Gujarati. 1970/1980 (EUA)
 cups <- c(2.57, 2.5, 2.35, 2.3, 2.25, 2.2, 2.11, 1.94, 1.97, 2.06, 2.02)
 price <- c(0.77, 0.74, 0.72, 0.73, 0.76, 0.75, 1.08, 1.81, 1.39, 1.2, 1.17)
 Y_matrix <- matrix(data = cups, nrow = 11, ncol = 1, byrow = FALSE)
 intercept <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
 X_matrix <- cbind(intercept, price)
 XtX <- t(X_matrix) %*% X_matrix
 XtXinv <- solve(XtX)
 XtY <- t(X_matrix) %*% Y_matrix
 Betas <- XtXinv %*% XtY
 Betas
 plot(cups, price)