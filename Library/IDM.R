#' Instantaneous derivative matching (IDM)
#' 
#' Calculate the Instantaneous derivative matching (IDM) for a single dyad or multiple dyads, for one or more time-varying variables.
#' @param data input data.frame in wide format containing the relevant time series, and variables identifying observation, dyad and variable IDs for calculating the AMI. All variables except the ID variables are assumed to be time-varying.
#' @param dyad character vector or vector of integers specifying for which dyad(s) to calculate the AMI.
#' @param dyad_id character specifying the name of the variable which contains the dyad ID.
#' @param observation_id character specifying the name of the variable which contains the observation (person) ID.
#' @param variable character vector specifying for which time-varying variable(s) to calculate the AMI.
#' @param variable_id character specifying the name of the variable which contains the time-varying variable ID.
#' @return An object of S3 class "Instantaneous derivative matching (IDM)".
#' @keywords TBA
#' @export
#' @author Sophie Hendrikse 
#' @examples
#' data(sync_example)
#' IDM_example <- IDM(sync_example, dyad=c(1,2), dyad_id="dyad", observation_id="subject", variable=c("FP1", "FP2"), variable_id="channel")


IDM <- function(data, 
                           dyad, 
                           dyad_id, 
                           observation_id, 
                           variable, 
                           variable_id) {
  out <- vector("list", length(dyad))
  names(out) <- dyad
  
  for(i in dyad){
    out[[i]] <- vector("list", length(variable))
    names(out[[i]]) <- variable
    for(j in variable){
      
      # Select the dyad & variable for which to calculate the WCLC
      dyta <- data[data[dyad_id] == i & data[variable_id] == j,]
      
      # Relevant observations IDs
      rel_id <- dyta[observation_id]
      
      # Select only the time series variables
      dyta <- dyta[,!names(dyta) %in% c(dyad_id, observation_id, variable_id)]
      
      
      dyta <- t(dyta)
      
      out[[i]][[j]] <- compute_IDM(dyta[,1], dyta[,2])
      
    }
    class(out) <- "Instantaneous derivative matching (IDM)"
    
  }
  return(out)
}

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
