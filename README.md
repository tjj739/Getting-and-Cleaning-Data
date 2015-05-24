
# README for the Course Project in Getting and Cleaning Data

## Overview
The files in this github repository were created as part of the course project in the Getting and Cleaning Data class offered by Johns Hopkins University on Coursera. 

## Contents of Repository
* run_analysis.R - R script that transforms the original data files into a tidy dataset by reading in the data, merging it, aggregating the mean and writing out a tidy dataset.
* tidydataset.txt - The output file created by run_analysis.R (data in a tidy format for analysis)
* codebook.md - Contains a description of the steps taken to transform the data as well as a high-level description of the variables.
* README.md - This file. Contains a directory of files, a brief description of any processing and instructions on how to run the script.

##How to view the data:

Copy, paste and execute the following code within your R environment to view the tidy data set( this code downloads the data from Coursera, reads it and executes the view() function):


```r
# Begin Copy Here
address <- "https://s3.amazonaws.com/coursera-uploads/user-85d1f22572dad26b544d3573/973501/asst-3/bc9f2eb0023111e59943ed94f6688ff0.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)
# End Copy Here
```

## Running the *run_analysis.R* script
1. Read through the *run_analysis.R* code and comments, the *codebook.md* file and this *README.md* file to gain a high level understanding of how the code works and the overall process taken.
2. Download the script file and data into the same working directory.
3. Load and run the script within your R environment.


## Additional Information
A more detailed description of the processing done can be found by reviewing the detailed comments in the **run_analysis.R** script and by reviewing the information in the code book **(codebook.md)** 



