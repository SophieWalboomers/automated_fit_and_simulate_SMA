#' Average mutual information
#' 
#' Calculate the average mutual information (AMI) for a single dyad or multiple dyads, for one or more time-varying variables.
#' @param data input data.frame in wide format containing the relevant time series, and variables identifying observation, dyad and variable IDs for calculating the AMI. All variables except the ID variables are assumed to be time-varying.
#' @param dyad character vector or vector of integers specifying for which dyad(s) to calculate the AMI.
#' @param dyad_id character specifying the name of the variable which contains the dyad ID.
#' @param observation_id character specifying the name of the variable which contains the observation (person) ID.
#' @param variable character vector specifying for which time-varying variable(s) to calculate the AMI.
#' @param variable_id character specifying the name of the variable which contains the time-varying variable ID.
#' @param lag an integer or vector of integers specifying the lag(s). Default is 0.
#' @return An object of S3 class "AMI".
#' @keywords TBA
#' @export
#' @author Sophie Hendrikse & Wouter van Loon
#' @examples
#' data(sync_example)
#' ami_example <- AMI(sync_example, dyad=c(1,2), dyad_id="dyad", observation_id="subject", variable=c("FP1", "FP2"), variable_id="channel", lag=0)

AMI <- function(data, dyad, dyad_id, observation_id, variable, variable_id, lag=0){
  
  out <- vector("list", length(dyad))
  names(out) <- dyad
  
  for(i in dyad){
    out[[i]] <- vector("list", length(variable))
    names(out[[i]]) <- variable
    for(j in variable){
      
      # Select the dyad & variable for which to calculate the AMI
      dyta <- data[data[dyad_id] == i & data[variable_id] == j,]
      
      # Relevant observations IDs
      rel_id <- dyta[observation_id]
      
      # Select only the time series variables
      dyta <- dyta[,!names(dyta) %in% c(dyad_id, observation_id, variable_id)]
      
      # Transpose the dyta
      dyta <- t(dyta)
      
      # Compute the AMI
      out[[i]][[j]]$input$data <- dyta
      out[[i]][[j]]$input$lag <- lag
      out[[i]][[j]]$all_results <- compute_AMI_for_one(dyta[,1], dyta[,2], lag=lag)
      out[[i]][[j]]$value <- out[[i]][[j]]$all_results
      
    }
    class(out) <- "AMI"
  }
  return(out)
}

compute_AMI_for_one <- function(x, y, lag=0) {
  
  # INPUT: data (2 columns with x and y), a vector of lags
  # OUTPUT: average mutual information
  
  if (length(x) != length(y)){
    stop('The provided time series are not of the same length')
  } 
  
  # The mutual average information
  x <- x - min(x)
  x <- x * (1 - 2.2204e-16) / max(x)
  y <- y - min(y)
  y <- y * (1 - 2.2204e-16) / max(y)
  
  v <- rep(0, length(lag))
  lastbins <- 0
  
  for (i in 1:length(lag)) {
    
    abs_lag <- abs(lag[i])
    
    # Define the number of bins
    bins <- floor(1 + log(length(x)-abs_lag, 2) + 0.5)
    
    if (bins != lastbins) {
      binx <- floor(x * bins) + 1
      biny <- floor(y * bins) + 1
    }
    
    lastbins <- bins
    
    Pxy <- matrix(0, nrow = bins,ncol = bins)
    
    for (j in 1:(length(x)-abs_lag)) {
      k <- j + abs_lag
      if (lag[i] < 0) {
        temp <- j
        j <- k
        k <- temp
      }
      
      Pxy[binx[k], biny[j]] <- Pxy[binx[k], biny[j]] + 1
    }
    
    Pxy <- Pxy / (length(x) - abs_lag)
    #Pxy <- Pxy + 2.2204e-16 
    Px <- rowSums(Pxy)
    Py <- colSums(Pxy)
    
    q <- Pxy / (Px %*% t(Py))
    q <- Pxy * log(q,2)
    v[i] <- sum(q / log(bins,2), na.rm = T)
  }
  return(v)
}

