compute_IDM <- function(X, Y) {
  n_cases <- length(X)
  ID_x <- c()
  ID_y <- c()
  z_x <-  (X - mean(X))/sd(X) 
  z_y <- (Y - mean(Y))/sd(Y) 
  for (i in 1:(n_cases-1)){
    ID_x[i] <- z_x[i+1] - z_x[i] #Get instan. deriv. of person 1 for all data points
    ID_y[i] <- z_y[i+1] - z_y[i] #Get instan. deriv. of person 2 for all data points
  }
  #Get the average of the absolute difference
  IDM_differences <- abs(ID_x - ID_y) 
  res <- mean(IDM_differences)
  return(res)
}