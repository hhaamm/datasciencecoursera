Code Book: Tidy UCI HAR Dataset
===============================

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which is included in the "UCI HAR Dataset" directory, originally downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Data background
---------------

The experiment is carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The original (un-tidy) data is on the folder "UCI HAR Dataset".

The run_analysis.R script takes only the mean and std measurements of that data and executes the mean of every measurement for each volunteeer and for each activity.

The result is a tidy dataset containing one row for every volunteer and activity combination. The tidy dataset has 68 columns (comma separated, the file is a CSV). Of those columns, 66 are the mean of a measurement and the other two identifies the activity and the volunteer (Subject).

Data transformation steps
-------------------------

The run_analysis.R script makes the transformations mentioned below:

1. Loads all the training and test dataset and merges into one data frame.
2. Load the features.txt file (which contains the measurements names) and assign this values to the column names. Additionally, it adds the "Activity" and "Subject" column names.
3. It creates a new dataset containing only the mean and standard deviation measures of the merged dataset.
4. Because the previous steps are a bit expensive in load time, it saves a temporal result in a tmp folder (which is created if it doesn't exist). This is useful to accelerate the script development.
5. It runs the aggregate function over the saved data frame to group all the rows by activity and subject and execute the mean function over each of the row groups, returning a row for every group and creating a new tidy dataset.
6. Deletes the first two columns (the aggregate function, apparently, adds those two columns to the first part of the dataset).


Variables
---------
  
This dataset mantains the variables of the previous dataset, only modifying the variable names of Activity and Subject.

The final dataset includes this 68 variables:

| Variable name | Detail
| ------------- |---------
| tBodyAcc-mean()-X | Mean time for acceleration of body for X direction.
| tBodyAcc-mean()-Y | Mean time for acceleration of body for Y direction.
| tBodyAcc-mean()-Z | Mean time for acceleration of body for Z direction.
| tBodyAcc-std()-X | Standard deviation of time for acceleration of body for X direction.
| tBodyAcc-std()-Y | Standard deviation of time for acceleration of body for Y direction.
| tBodyAcc-std()-Z | Standard deviation of time for acceleration of body for Z direction.
| tGravityAcc-mean()-X | Mean time of acceleration of gravity for X direction.
| tGravityAcc-mean()-Y | Mean time of acceleration of gravity for Y direction.
| tGravityAcc-mean()-Z | Mean time of acceleration of gravity for Z direction.
| tGravityAcc-std()-X | Standard deviation of time of acceleration of gravity for X direction.
| tGravityAcc-std()-Y | Standard deviation of time of acceleration of gravity for Y direction.
| tGravityAcc-std()-Z | Standard deviation of time of acceleration of gravity for Z direction.
| tBodyAccJerk-mean()-X | Mean time of body acceleration jerk for X direction.
| tBodyAccJerk-mean()-Y | Mean time of body acceleration jerk for Y direction
| tBodyAccJerk-mean()-Z | Mean time of body acceleration jerk for Z direction
| tBodyAccJerk-std()-X | Standard deviation of time of body acceleration jerk for X direction.
| tBodyAccJerk-std()-Y | Standard deviation of time of body acceleration jerk for Y direction.
| tBodyAccJerk-std()-Z | Standard deviation of time of body acceleration jerk for Z direction.
| tBodyGyro-mean()-X | Mean body gyroscope measurement for X direction.
| tBodyGyro-mean()-Y | Mean body gyroscope measurement for Y direction.
| tBodyGyro-mean()-Z | Mean body gyroscope measurement for Z direction.
| tBodyGyro-std()-X | Standard deviation of body gyroscope measurement for X direction.
| tBodyGyro-std()-Y | Standard deviation of body gyroscope measurement for Y direction.
| tBodyGyro-std()-Z | Standard deviation of body gyroscope measurement for Z direction.
| tBodyGyroJerk-mean()-X | Mean jerk signal of body for X direction.
| tBodyGyroJerk-mean()-Y | Mean jerk signal of body for Y direction.
| tBodyGyroJerk-mean()-Z | Mean jerk signal of body for Z direction.
| tBodyGyroJerk-std()-X | Standard deviation of jerk signal of body for X direction.
| tBodyGyroJerk-std()-Y | Standard deviation of jerk signal of body for Y direction.
| tBodyGyroJerk-std()-Z | Standard deviation of jerk signal of body for Z direction.
| tBodyAccMag-mean() | Mean magnitude of body Acc
| tBodyAccMag-std() | Standard deviation of magnitude of body Acc
| tGravityAccMag-mean() | Mean gravity acceleration magnitude.
| tGravityAccMag-std() | Standard deviation of gravity acceleration magnitude.
| tBodyAccJerkMag-mean() | Mean magnitude of body acceleration jerk.
| tBodyAccJerkMag-std() | Standard deviation of magnitude of body acceleration jerk.
| tBodyGyroMag-mean() | Mean magnitude of body gyroscope measurement.
| tBodyGyroMag-std() | Standard deviation of magnitude of body gyroscope measurement.
| tBodyGyroJerkMag-mean() | Mean magnitude of body body gyroscope jerk measurement.
| tBodyGyroJerkMag-std() | Standard deviation of magnitude of body body gyroscope jerk measurement.
| fBodyAcc-mean()-X | Mean frequency of body acceleration for X direction.
| fBodyAcc-mean()-Y | Mean frequency of body acceleration for Y direction.
| fBodyAcc-mean()-Z | Mean frequency of body acceleration for Z direction.
| fBodyAcc-std()-X | Standard deviation of frequency of body acceleration for X direction.
| fBodyAcc-std()-Y | Standard deviation of frequency of body acceleration for Y direction.
| fBodyAcc-std()-Z | Standard deviation of frequency of body acceleration for Z direction.
| fBodyAccJerk-mean()-X | Mean frequency of body accerlation jerk for X direction.
| fBodyAccJerk-mean()-Y | Mean frequency of body accerlation jerk for Y direction.
| fBodyAccJerk-mean()-Z | Mean frequency of body accerlation jerk for Z direction.
| fBodyAccJerk-std()-X | Standard deviation frequency of body accerlation jerk for X direction.
| fBodyAccJerk-std()-Y | Standard deviation frequency of body accerlation jerk for Y direction.
| fBodyAccJerk-std()-Z | Standard deviation frequency of body accerlation jerk for Z direction.
| fBodyGyro-mean()-X | Mean frequency of body gyroscope measurement for X direction.
| fBodyGyro-mean()-Y | Mean frequency of body gyroscope measurement for Y direction.
| fBodyGyro-mean()-Z | Mean frequency of body gyroscope measurement for Z direction.
| fBodyGyro-std()-X | Standard deviation frequency of body gyroscope measurement for X direction.
| fBodyGyro-std()-Y | Standard deviation frequency of body gyroscope measurement for Y direction.
| fBodyGyro-std()-Z | Standard deviation frequency of body gyroscope measurement for Z direction.
| fBodyAccMag-mean() | Mean frequency of body acceleration magnitude.
| fBodyAccMag-std() | Standard deviation of frequency of body acceleration magnitude.
| fBodyBodyAccJerkMag-mean() | Mean frequency of body acceleration jerk magnitude.
| fBodyBodyAccJerkMag-std() | Standard deviation of frequency of body acceleration jerk magnitude.
| fBodyBodyGyroMag-mean() | Mean frequency of magnitude of body gyroscope measurement.
| fBodyBodyGyroMag-std() | Standard deviation of frequency of magnitude of body gyroscope measurement.
| fBodyBodyGyroJerkMag-mean() | Mean frequency of magnitude of body gyroscope jerk measurement.
| fBodyBodyGyroJerkMag-mean() | Mean frequency of magnitude of body gyroscope jerk measurement.
| Activity | The activity peformed.
| Subject | The ID of the subject.