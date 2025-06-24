#' Signal Matching (SM)
#' 
#' Calculate the Signal Matching (SM) for a single dyad or multiple dyads, for one or more time-varying variables.
#' @param data input data.frame in wide format containing the relevant time series, and variables identifying observation, dyad and variable IDs for calculating the Signal Matching (SM). All variables except the ID variables are assumed to be time-varying.
#' @param dyad character vector or vector of integers specifying for which dyad(s) to calculate the Signal Matching (SM).
#' @param dyad_id character specifying the name of the variable which contains the dyad ID.
#' @param observation_id character specifying the name of the variable which contains the observation (person) ID.
#' @param variable character vector specifying for which time-varying variable(s) to calculate the Signal Matching (SM).
#' @param variable_id character specifying the name of the variable which contains the time-varying variable ID.
#' @return An object of S3 class "Signal Matching (SM)".
#' @keywords TBA
#' @export
#' @author Sophie Hendrikse 
#' @examples
#' data(sync_example)
#' signal_matching_example <- SignalMatching(sync_example, dyad=c(1,2), dyad_id="dyad", observation_id="subject", variable=c("FP1", "FP2"), variable_id="channel")

SignalMatching <- function(data, 
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
      
      out[[i]][[j]] <- compute_SM(dyta[,1], dyta[,2])
      
    }
    class(out) <- "Signal Matching (SM)"
    
  }
  return(out)
}

compute_SM <- function(X, Y) {
  zscore_x <- (X - mean(X))/sd(X) 
  zscore_y <- (Y - mean(Y))/sd(Y) 
  out <- mean(abs(zscore_x - zscore_y))
  return(out)
}

