corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## directory <- paste0(getwd(),"/", directory, "/", collapse = NULL)
  
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        ## Call previous function "complete()"; get "nobs" data
        datatable <- complete(directory)
        nobs <- datatable$nobs
        ## print(nobs)
        
        ## Find the valid ids that meets threshold requirement
        valid_ids <- datatable$id[nobs > threshold]
        ## print(valid_ids)
        
        ## find all files in the specdata folder
        all_files <- as.character( list.files(directory) )
        file_paths <- paste0(directory,"/", all_files, sep="")
        
        ## Start Correlation calculations
        cor_vector <- rep(0,length(valid_ids))
        j <- 1
        for (i in valid_ids){
              this_file <- read.csv(file_paths[i], header =TRUE)
              cor_vector[j] <- cor(this_file$sulfate, this_file$nitrate, use ="complete.obs") ## used for completely observed observations
              j <- j+1
        }
        
        # Return Correlation results
        if (length(cor_vector) == 0 )  {cor_vector <- as.numeric(0)}
        else {return(round(cor_vector,6))}  # returns rounded result 
        
}