pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
  
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## set the full path of the directory by concatenating working 
        ## directory and 'specdata/' dir
        directory <- paste0(getwd(),"/", directory, "/", collapse = NULL)
        ##print(directory)
        
        #p_mean is a initialised as an empty vector store for value
        p_mean <- c() 
        all_files <- as.character (list.files(directory))
        file_paths <- paste(directory, all_files, sep = "")
        
        ## setup for loop to read files
        for (i in id){
          
          x <- read.csv(file_paths[i], header = TRUE)
        
          getValue <- x[!is.na(x[ , pollutant]), pollutant]
          p_mean <- c(p_mean, getValue)
        }
        
        ## Calculate mean and print result
        result <- mean(p_mean)
        print(round(result,3))

}