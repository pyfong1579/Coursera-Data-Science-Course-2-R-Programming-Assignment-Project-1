pollutantmean <- function(directory, pollutant, id= 1:332){

    ## Create an empty vector of pollutants
    pollutants = c()

    ## Get a list of filenames
    filenames = list.files(directory)

    ## For each .csv file in id
    for(i in id){
        ## Concatenate directory and filenames
        ## directory = "C:/folder", filenames = vector("001.csv", "002.csv", ...), filepath="C:/folder/001.csv"
        filepath=paste(directory,"/" ,filenames[i], sep="")

        ## Read files and store in data
        data = read.csv(filepath, header = TRUE)

        ##Concatenate the vectors from each file of the pollutant('sulfate' or 'nitrate') column to pollutants vector
        pollutants = c(pollutants, data[,pollutant])

    }
    ## Get the mean of the pollutants and remove NA values
    pollutants_mean = mean(pollutants, na.rm=TRUE)

    ## Return the mean 'pollutants_mean'
    pollutants_mean
}
# to change commit header