
# Getting and cleaning Data
# Codebook for Course Project

## Overview
The script, **run_analysis.R**, was created as part of the Course project in the Getting and Cleaning Data class offered by Johns Hopkins University
on Coursera.  

The script reads in fitness data collected from a Samsung
Galaxy S smartphone as part of an experiment conducted by UC Irving.
Detailed information on the experiment can be found at this link: 

[UCI Human Activity Recognition Experiment Site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

The original data files can be found here:

[Original Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

## Analysis Process

Below is a high level description of the steps taken in the analysis process. * (A more detailed explanation of the processing can be found by reviewing the detailed comments in the * **run_analysis.R** *script.)* :

1. The data files are downloaded end uncompressed
       + The script checks for existence of data files
       + If they are not present, the datafiles are download from the link above
2. The data files are read
       + Feature and Activity descriptions are read with meaningful column names assigned
       + Train and Test data are read assiging column names found in *feature.txt*
       + Subject data is read in and assigned meaningful column names
       + *NOTE: A detailed description of the files and their content can be found in the 'README.txt' file found in the original data file download*  
3. A 'tidy' dataset is created
       + The training,test and subject data sets are combined
       + Columns are reduced to include only those pertaining to *mean* and *standard deviation*
       + Activity ID's are replaced with their meaningful descriptions found in *activity_lables.txt*
       + The data is summarized to disply 'mean' by subject and activity and loaded into a 'tidy' dataset.
4. Column names are cleaned up for readability
5. The dataset is written out to a file: **tidydataset.txt**

## LIst of Columns included in the File

### Identifier column names
* subject - The subject ID for the participant in the experiment
* activity - The activity name that is being measured

The rest of the columns indicate the mean of the measurements taken for a given subject and activity across the duration of the experiment.  A description of the various measurement types can be found in the *features_info.txt* file that was included in the original set of files downloaded (a link to these files is provided above.) 

### Variable Column Names:
tBodyAccMeanX            tBodyAccMeanY           
tBodyAccMeanZ            tGravityAccMeanX        
tGravityAccMeanY         tGravityAccMeanZ        
tBodyAccJerkMeanX        tBodyAccJerkMeanY       
tBodyAccJerkMeanZ        tBodyGyroMeanX          
tBodyGyroMeanY           tBodyGyroMeanZ          
tBodyGyroJerkMeanX       tBodyGyroJerkMeanY      
tBodyGyroJerkMeanZ       tBodyAccMagMean         
tGravityAccMagMean       tBodyAccJerkMagMean     
tBodyGyroMagMean         tBodyGyroJerkMagMean    
fBodyAccMeanX            fBodyAccMeanY           
fBodyAccMeanZ            fBodyAccJerkMeanX       
fBodyAccJerkMeanY        fBodyAccJerkMeanZ       
fBodyGyroMeanX           fBodyGyroMeanY          
fBodyGyroMeanZ           fBodyAccMagMean         
fBodyBodyAccJerkMagMean  fBodyBodyGyroMagMean    
fBodyBodyGyroJerkMagMean tBodyAccStdX            
tBodyAccStdY             tBodyAccStdZ            
tGravityAccStdX          tGravityAccStdY         
tGravityAccStdZ          tBodyAccJerkStdX        
tBodyAccJerkStdY         tBodyAccJerkStdZ        
tBodyGyroStdX            tBodyGyroStdY           
tBodyGyroStdZ            tBodyGyroJerkStdX       
tBodyGyroJerkStdY        tBodyGyroJerkStdZ       
[tBodyAccMagStd           tGravityAccMagStd       
tBodyAccJerkMagStd       tBodyGyroMagStd         
tBodyGyroJerkMagStd      fBodyAccStdX            
fBodyAccStdY             fBodyAccStdZ            
fBodyAccJerkStdX         fBodyAccJerkStdY        
fBodyAccJerkStdZ         fBodyGyroStdX           
fBodyGyroStdY            fBodyGyroStdZ           
fBodyAccMagStd           fBodyBodyAccJerkMagStd  
fBodyBodyGyroMagStd      fBodyBodyGyroJerkMagStd
 
## Additional Information


       
