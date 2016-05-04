## Code Book
This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

The full description of the source data explained under the following link.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### The data

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

#### Preparing Tidy Dataset R script - run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code has beed divided into two parts.

PART 1: EXTRACT DATA

PART 2: PREPARE TIDY DATASET 

#### Following steps are performed in run_analysis.R script. (Refer script for the code)



1.	Create folder "Getting_cleaning_Data_Project" and Set the working directory
2.	Download the zip file and unzip to the working directory
3.	Read data from files and create data tables

  3a.Import Features
  
  3b.Import Activity Type
  
  3c.Import Training Data
  
  3d.Import Test data
  
4.	Rename column names
5.	Merge training data and store in “TrainData”
6.	Merge test data and store in “TestData”
7.	Create Final Dataset by combining TrainData and TestData
8.	Extracts only the measurements on the mean and standard deviation for each measurement
9.	Uses descriptive activity names to name the activities in the data set

  Re-Label column names with descriptive and understandable names. 
  
  •	Acc is replaced by “Accelerometer”
  
  •	Gyro is replaced by “Gyroscope”
  
  •	Mag is replaced by “Magnitude”
  
  •	mean is replaced by “Mean”
  
  •	std is replaced by “SD”
  
  •	t is replaced by “Time”
  
  •	f is replaced by “Frequency”
  
  •	BodyBody is replaced by “Body”
  
10.	Create a second, independent tidy data set with the average of each variable for each activity and each subject.
11. Export the tidy dataset


## Final Dataset
> str(TidyData)

'data.frame':	180 obs. of  68 variables:
 
