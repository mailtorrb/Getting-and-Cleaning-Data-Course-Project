# Following are the steps to be performed to prepare tidy dataset.
# Part 1. Extract Data
# Part 2. Prepare tidy dataset.

## PART 1: EXTRACT DATA

## Step 1.	Create folder "Getting_cleaning_Data_Project" and Set the working directory
> setwd("C:/Users/xxx/Documents/R/WorkingDir/Getting_cleaning_Data_Project")
	
## Step 2.	Download the zip file and unzip to the working directory
   
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(fileUrl,destfile="./Dataset.zip")

> unzip(zipfile="./Dataset.zip")
####################################################################
## Files in folder ‘UCI HAR Dataset’ that will be used are:

## Data (Activities):
## test/y_test.txt
## train/y_train.txt

## Labels(Features):
## test/X_test.txt
## train/X_train.txt

## Subject:
## test/subject_test.txt
## train/subject_train.txt

## features.txt - Names of column variables in the dataTable
## activity_labels.txt - Links the class labels with their activity name.
#############################################################################

## Step 3.	Read data from files and create data tables

## Import Features:
> features    <- read.table('./UCI HAR Dataset/features.txt',header=FALSE); 

## Import Activity Type
> activityType <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE);

## Import Training Data:
> xTrain <- read.table('./UCI HAR Dataset/train/x_train.txt',header=FALSE);
> yTrain <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE);
> subjTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE);

## Import Test data:
> xTest <- read.table('./UCI HAR Dataset/test/x_test.txt',header=FALSE);
> yTest <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE);
> subjTest <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE);


## Step 4.	Rename column names
> colnames(activityType)  = c('ActivityId','ActivityType');
> colnames(features)  = c('FeatureId','FeatureName');

> colnames(xTrain) <- features[,2];
> colnames(yTrain) <- "ActivityId";
> colnames(subjTrain) <- "SubjectId";

> colnames(xTest) <- features[,2];
> colnames(yTest) <- "ActivityId";
> colnames(subjTest) <- "SubjectId";

## PART 2: PREPARE TIDY DATASET 

## Step 5.	Merge training data and store in “TrainData”
> TrainData <- cbind(xTrain,yTrain,subjTrain);

## Step 6.	Merge test data and store in “TestData”
> TestData <- cbind(xTest,yTest,subjTest);

## Step 7.	Create Final Dataset by combining TrainData and TestData ( dim(FinalData) –10299  563)
> FinalData <- rbind(TrainData,TestData);

## Step 8.	Extracts only the measurements on the mean and standard deviation for each measurement

## Pull Feature Names of features by measurements on the mean and standard deviation. Take featurenames with “mean” and “std”
> subFeaturesNames<-features$FeatureName[grep("mean\\(\\)|std\\(\\)", features$FeatureName)]

## Subset the resultant dataset by SubjectID and ActivityID
> FinalResultNames<-c(as.character(subFeaturesNames), "SubjectId", "ActivityId" )

> RefinedData <- subset(FinalData,select = FinalResultNames)

(Check Data: 10299 obs. of 68 variables)

## Step 9.	Uses descriptive activity names to name the activities in the data set
## Re-Label column names with descriptive and understandable names. 
## •	Acc is replaced by “Accelerometer”
## •	Gyro is replaced by “Gyroscope”
## •	Mag is replaced by “Magnitude”
## •	mean is replaced by “Mean”
## •	std is replaced by “SD”
## •	t is replaced by “Time”
## •	f is replaced by “Frequency”
## •	BodyBody is replaced by “Body”

> names(RefinedData) <- gsub("Acc", "Accelerometer", names(RefinedData))
> names(RefinedData) <- gsub("Gyro", "Gyroscope", names(RefinedData))
> names(RefinedData) <- gsub("Mag", "Magnitude", names(RefinedData))
> names(RefinedData) <- gsub("mean", "Mean", names(RefinedData))
> names(RefinedData) <- gsub("std", "SD", names(RefinedData))
> names(RefinedData) <- gsub("^t", "time", names(RefinedData))
> names(RefinedData) <- gsub("^f", "frenquency", names(RefinedData))
> names(RefinedData) <- gsub("BodyBody", "Body", names(RefinedData))


## Step 10.	Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load library “plyr”

## Create tidy dataset for grouped mean and SD for all selected features by ActivityId and SubjectId.
> TidyData<-aggregate(. ~SubjectId + ActivityId, RefinedData, mean)

> TidyData<- TidyData[order(TidyData$SubjectId,TidyData$ActivityId),]
## The resulting data table has 180 rows and 68 columns.

## Export the tidy dataset
> write.table(TidyData, file = "TidyData.txt",row.name=FALSE)




