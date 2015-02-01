complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        directory <- paste0(getwd(),"/", directory, "/", collapse = NULL)
  
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        if ( any(id < 1 | id > 332)) stop ('id is not between 1 to 332')
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        id_len <- length(id)
        complete_data <- rep(0, id_len)
        
        all_files <- as.character (list.files(directory))
        file_paths <- paste(directory, all_files, sep = "")
        
        j <- 1
        for (i in id){
            current_file <- read.csv(file_paths[i], header = TRUE, sep=",")
            ##complete_data[j] <- sum(complete.cases(current_file))
            complete_data[j] <- nrow(na.omit(current_file))
            j <- j+1
        }
        
        result <- data.frame (id = id, nobs = complete_data )
        return(result)
}

complete1 <- function(directory, id = 1:332) {
  # --- Assert 'directory' is a character vector of length 1 indicating the
  # location of the CSV files.  'id' is an integer vector indicating the
  # monitor ID numbers to be used Return a data frame of the form: id nobs 1
  # 117 2 1041 ...  where 'id' is the monitor ID number and 'nobs' is the
  # number of complete cases
  
  # --- Assert create an empty vector
  nobsNum <- numeric(0)
  
  for (cid in id) {
    # --- Assert get data frame as ID
    cDfr <- getmonitor(cid, directory)
    
    # --- Assert count the number of complete cases and append to numeric
    # vector
    nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))
  }
  
  # --- Assert return value is a data frame with TWO (2) columns
  data.frame(id = id, nobs = nobsNum)
}

getmonitor <- function(id, directory, summarize = FALSE) {
  # --- Assert 'id' is a vector of length 1 indicating the monitor ID
  # number. The user can specify 'id' as either an integer, a character, or
  # a numeric.  'directory' is a character vector of length 1 indicating the
  # location of the CSV files 'summarize' is a logical indicating whether a
  # summary of the data should be printed to the console; the default is
  # FALSE
  
  # --- Assert construct file name Directory is pre-appended to file name.
  # Use sprintf() to add leading zeroes.  E.g. 'specdata/001.csv'
  fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
                   sep = "")
  
  # --- Assert read csv
  rawDfr <- read.csv(fileStr)
  
  # --- Assert summary if true
  if (summarize) {
    print(summary(rawDfr))
  }
  
  # --- Return value is a data frame
  return(rawDfr)
}