
# This script was created as part of the Course project in the
# Getting and Cleaning Data class offered by Johns Hopkins University
# on Coursera.

# Overview:
# The script reads in fitness data collected from a Samsung
# Galaxy S smartphone as part of an experiment conducted by UC Irving.
# Detailed information on the experiment can be found at this link:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# The original data files can be found here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The purpose of this script is to read in the data from the experiment,
# create a tidy data set from it and write that data set to a file.
#
# This script assumes that the data file directory is located in current working directory

# Load the dplyr and reshape2 libraries
library(dplyr)
library(reshape2)

# ##############################################################
# If needed, fetch and uncompress the original data files
# Download file
fileURL <-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if(!file.exists('UCIHARDataset.zip')){
        download.file(fileURL
                      ,destfile='UCIHARDataset.zip')
}

# Uncompress the original data file
if (!file.exists('UCI HAR Dataset')){
        unzip('UCIHARDataset.zip')
}

###############################################################
# Read the tables supplying meaningful descriptions 
# for activities and features

# read activity label data
activitylabels <- read.table('UCI HAR Dataset/activity_labels.txt'
                ,col.names = c('id','activityName')
                ,header = FALSE)
# read feature data
features <- read.table('UCI HAR Dataset/features.txt'
                        ,col.names = c('id', 'featureName')
                        ,header = FALSE)

################################################################
#read the train data tables

trainY <- read.table('UCI HAR Dataset/train/y_train.txt'
                        ,col.names = 'activity'
                        ,header = FALSE)
trainX <- read.table('UCI HAR Dataset/train/x_train.txt'
                        ,col.names = features$featureName
                        ,header = FALSE)
trainSubject <- read.table('UCI HAR Dataset/train/subject_train.txt'
                        ,col.names = 'subject'
                        ,header = FALSE)

###################################################################
#read test data tables

testY <- read.table('UCI HAR Dataset/test/y_test.txt'
                        ,col.names = 'activity'
                        ,header = FALSE)
testX <- read.table('UCI HAR Dataset/test/x_test.txt'
                        ,col.names = features$featureName
                        ,header = FALSE)
testSubject <- read.table('UCI HAR Dataset/test/subject_test.txt'
                        ,col.names = 'subject'
                        ,header = FALSE)

###################################################################
# Clean up X table data by combining train and test datasets.Keep
# only the columns that contain mean and standard deviation and exclude
# columns with 'freq' or 'angle'.
# This subset could be easily modified to pull-out or keep other 
# columns if desired.

allX <- rbind(trainX, testX)
allX <- select(allX
        ,contains("mean")
        ,contains("std")
        ,-contains("freq")
        ,-contains("angle")
        )


################################################################
# Combine train and test datasets and merge into one data.frame, change
# activity ids to meaninful activity descriptions

allData <- data.frame(   allX
                        ,rbind(trainY, testY)
                        ,rbind(trainSubject, testSubject)
                        )
allData$activity <- activitylabels[allData$activity,]$activityName

#################################################################
# Reshape data to show mean by subject and activity and create
# tidy dataset

dataMelt<-melt(allData, id = c('subject', 'activity'))
tidyData<-dcast(dataMelt, subject+activity ~ variable, mean)

##################################################################
# Clean up column names to make them more readable
names <- names(tidyData)
names <- gsub("\\.", "", names) # remove all '.' from column names

# Change lower case 'mean' and 'std' to 'Mean' and 'Std''
# for readability and to follow what appears to be a convention
# on the rest of the columns (and a personal preferance...)
names <- gsub("mean", "Mean", names) 
names <- gsub("std", "Std", names) 

colnames(tidyData) <- names

# write the tidyData set to a file
write.table(tidyData, file="tidydataset.txt", row.name=FALSE)

# The data table can be read in using the following command:
# "read.table('tidydataset.txt', header = TRUE)" assuming that
# the file 'tidydataset.txt' is located in the current working directory.
