complete <- function(directory, id= 1:332){
  
  ## Initialize ID vector
  id_vect= c()
  
  ## Initialize Object count vector
  Observ_count_vect = c() #nobss
  
  ## Get filenames
  filenames = list.files(directory)
  
  ## For each .csv file in id
  for(i in id){
    
    ## Concatenate the directory and filename
    ## directory = "C:/folder", filenames = vector("001.csv", "002.csv", ...), filepath="C:/folder/001.csv"
    filepath=paste(directory,"/" ,filenames[i], sep="")
    
    ## read each file and store in data
    data = read.csv(filepath, header = TRUE)
    
    ##Subset complete data (no NA)
    ##completeCases = subset(data, !is.na(Date) & !is.na(sulfate) & !is.na(nitrate) & !is.na(id),select = TRUE )
    completeCases = data[complete.cases(data), ]
    
    id_vect =  c(id_vect, i)                    ## concatenate a id vector with i as inddex
    Observ_count_vect = c(Observ_count_vect, nrow(completeCases) )      ## Concatenate the number of subsetted complete cases into a the observ count vector
    
  }
  ## Return the data frame
  data.frame(id=id_vect, nobs=Observ_count_vect)
}
