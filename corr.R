source("complete.R")
corr <- function(directory, threshold = 0){
  
  completes = complete(directory, 1:332)
  completes_above_threshold = subset(completes, nobs > threshold )
  
  ## Initialize vector
  corr_vect <- vector()
  
  ## Get list of filenames
  filenames = list.files(directory)
  
  ## For (i)th .csv file in id
  for(i in completes_above_threshold$id){
    
    ## Concatenate directory and filename
    ## directory = "C:/folder", filenames = vector("001.csv", "002.csv", ...), filepath="C:/folder/001.csv"
    filepath=paste(directory,"/" ,filenames[i], sep="")
    
    ## read in each file and store it in data
    data = read.csv(filepath, header = TRUE)
    
    ## Calculate and store the number of completed cases
    completeCases = data[complete.cases(data),]
    count = nrow(completeCases)    ## Count complete cases
    
    ## if threshhold is reached
    if( count >= threshold ) {
      corr_vect = c(corr_vect, cor(completeCases$nitrate, completeCases$sulfate) )
    }
  }
  corr_vect
}