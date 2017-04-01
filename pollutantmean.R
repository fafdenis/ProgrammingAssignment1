-------------------------------------------
# Stephanie Denis
# Course 2 - R Programming
# Assignment 1 - Part 1
# November 27, 2016
-------------------------------------------


# Loop for pollutant mean
pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        # Set the path
        path = "/Users/sdenis/Desktop/Rprogramming/specdata"
        
        # Get the file list in that directory
        fileList = list.files(path)
        
        # Extract the file names and store as numeric for comparison
        file.names = as.numeric(sub("\\.csv$", "", fileList))
        
        # Select files to be imported
        selected.files = fileList[match(id, file.names)]
         
        # Import data
        data = lapply(file.path(path, selected.files), read.csv)
        
        # Convert into data frame
        data = do.call(rbind.data.frame, data)
        
        # Calculate mean
        mean(data[, pollutant], na.rm = TRUE)
         
}

# Checks
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 23)

pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")