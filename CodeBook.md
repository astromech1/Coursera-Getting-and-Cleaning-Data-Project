Code Book
Description of the run_analytics.R

Build Environmentv and Getting Data

Load library plyr
Define Global Variables
Check the directory structure for the ZIP file prior to download.
Download the required data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) only if needed.
Create results folder if one does not exist
Processing Data and build Results Files

Use the feature data set (features.txt) to build the column names
Build train data frame using X_train.txt col.name = features data set), y_train.txt (col.name = activity labels), subject_train.txt (col.names = ids)
Build test data frame using X_test.txt (col.name = features data set), y_test.txt (col.name = activity labels), subject_test.txt (col.names = ids)
Merge train and test data frames using rbind
Reorder the data frame by column name using arrange
Build data frame "activityLabels" table using activity_labels.txt
Use "activityLables" to label activities
Push the mean,std into datasetOne
Saves datasetOne into results/datasetOne.csv
Use ddply to subset the data frame, apply a function (colMeans) to calculate mean then combine results into a data frame
Appends "_mean|" to all data columns in datasetTwo
Saves datasetTwo into results/datasetTwo.csv
datasetOne.csv (10299 rows and 81 columns)

datasetTwo.csv (180 rows and 81 columns)

|DatasetOne	|DatasetTwo|
|-----------|-------------|
|id	|id|
|activity	|activity|
|tBodyAcc.std...X	|tBodyAcc.std...X_mean||
|tBodyAcc.std...Y	|tBodyAcc.std...Y_mean||
|tBodyAcc.std...Z	|tBodyAcc.std...Z_mean||
|tGravityAcc.std...X	|tGravityAcc.std...X_mean||
|tGravityAcc.std...Y	|tGravityAcc.std...Y_mean||
|tGravityAcc.std...Z	|tGravityAcc.std...Z_mean||
|tBodyAccJerk.std...X	|tBodyAccJerk.std...X_mean|
|tBodyAccJerk.std...Y	|tBodyAccJerk.std...Y_mean|
|tBodyAccJerk.std...Z	|tBodyAccJerk.std...Z_mean|
|tBodyGyro.std...X	|tBodyGyro.std...X_mean|
|tBodyGyro.std...Y	|tBodyGyro.std...Y_mean|
|tBodyGyro.std...Z	|tBodyGyro.std...Z_mean|
|tBodyGyroJerk.std...X	|tBodyGyroJerk.std...X_mean|
|tBodyGyroJerk.std...Y	|tBodyGyroJerk.std...Y_mean|
|tBodyGyroJerk.std...Z	|tBodyGyroJerk.std...Z_mean|
|tBodyAccMag.std..	|tBodyAccMag.std.._mean|
|tGravityAccMag.std..	|tGravityAccMag.std.._mean|
|tBodyAccJerkMag.std..	|tBodyAccJerkMag.std.._mean|
|tBodyGyroMag.std..	|tBodyGyroMag.std.._mean|
|tBodyGyroJerkMag.std..	|tBodyGyroJerkMag.std.._mean|
fBodyAcc.std...X	fBodyAcc.std...X_mean|
fBodyAcc.std...Y	fBodyAcc.std...Y_mean|
fBodyAcc.std...Z	fBodyAcc.std...Z_mean|
fBodyAccJerk.std...X	fBodyAccJerk.std...X_mean|
fBodyAccJerk.std...Y	fBodyAccJerk.std...Y_mean|
fBodyAccJerk.std...Z	fBodyAccJerk.std...Z_mean|
fBodyGyro.std...X	fBodyGyro.std...X_mean|
fBodyGyro.std...Y	fBodyGyro.std...Y_mean|
fBodyGyro.std...Z	fBodyGyro.std...Z_mean|
fBodyAccMag.std..	fBodyAccMag.std.._mean|
fBodyBodyAccJerkMag.std..	fBodyBodyAccJerkMag.std.._mean|
fBodyBodyGyroMag.std..	fBodyBodyGyroMag.std.._mean|
fBodyBodyGyroJerkMag.std..	fBodyBodyGyroJerkMag.std.._mean|
|tBodyAcc.mean...X	|tBodyAcc.mean...X_mean|
|tBodyAcc.mean...Y	|tBodyAcc.mean...Y_mean|
|tBodyAcc.mean...Z	|tBodyAcc.mean...Z_mean|
|tGravityAcc.mean...X	|tGravityAcc.mean...X_mean|
|tGravityAcc.mean...Y	|tGravityAcc.mean...Y_mean|
|tGravityAcc.mean...Z	|tGravityAcc.mean...Z_mean|
|tBodyAccJerk.mean...X	|tBodyAccJerk.mean...X_mean|
|tBodyAccJerk.mean...Y	|tBodyAccJerk.mean...Y_mean|
|tBodyAccJerk.mean...Z	|tBodyAccJerk.mean...Z_mean|
|tBodyGyro.mean...X	|tBodyGyro.mean...X_mean|
|tBodyGyro.mean...Y	|tBodyGyro.mean...Y_mean|
|tBodyGyro.mean...Z	|tBodyGyro.mean...Z_mean|
|tBodyGyroJerk.mean...X	|tBodyGyroJerk.mean...X_mean|
|tBodyGyroJerk.mean...Y	|tBodyGyroJerk.mean...Y_mean|
|tBodyGyroJerk.mean...Z	|tBodyGyroJerk.mean...Z_mean|
|tBodyAccMag.mean..	|tBodyAccMag.mean.._mean|
|tGravityAccMag.mean..	|tGravityAccMag.mean.._mean|
|tBodyAccJerkMag.mean..	|tBodyAccJerkMag.mean.._mean|
|tBodyGyroMag.mean..	|tBodyGyroMag.mean.._mean|
|tBodyGyroJerkMag.mean..	|tBodyGyroJerkMag.mean.._mean|
fBodyAcc.mean...X	fBodyAcc.mean...X_mean|
fBodyAcc.mean...Y	fBodyAcc.mean...Y_mean|
fBodyAcc.mean...Z	fBodyAcc.mean...Z_mean|
fBodyAcc.meanFreq...X	fBodyAcc.meanFreq...X_mean|
fBodyAcc.meanFreq...Y	fBodyAcc.meanFreq...Y_mean|
fBodyAcc.meanFreq...Z	fBodyAcc.meanFreq...Z_mean|
fBodyAccJerk.mean...X	fBodyAccJerk.mean...X_mean|
fBodyAccJerk.mean...Y	fBodyAccJerk.mean...Y_mean|
fBodyAccJerk.mean...Z	fBodyAccJerk.mean...Z_mean|
fBodyAccJerk.meanFreq...X	fBodyAccJerk.meanFreq...X_mean|
fBodyAccJerk.meanFreq...Y	fBodyAccJerk.meanFreq...Y_mean|
fBodyAccJerk.meanFreq...Z	fBodyAccJerk.meanFreq...Z_mean|
fBodyGyro.mean...X	fBodyGyro.mean...X_mean|
fBodyGyro.mean...Y	fBodyGyro.mean...Y_mean|
fBodyGyro.mean...Z	fBodyGyro.mean...Z_mean|
fBodyGyro.meanFreq...X	fBodyGyro.meanFreq...X_mean|
fBodyGyro.meanFreq...Y	fBodyGyro.meanFreq...Y_mean|
fBodyGyro.meanFreq...Z	fBodyGyro.meanFreq...Z_mean|
fBodyAccMag.mean..	fBodyAccMag.mean.._mean|
fBodyAccMag.meanFreq..	fBodyAccMag.meanFreq.._mean|
fBodyBodyAccJerkMag.mean..	fBodyBodyAccJerkMag.mean.._mean|
fBodyBodyAccJerkMag.meanFreq..	fBodyBodyAccJerkMag.meanFreq.._mean|
fBodyBodyGyroMag.mean..	fBodyBodyGyroMag.mean.._mean|
fBodyBodyGyroMag.meanFreq..	fBodyBodyGyroMag.meanFreq.._mean|
fBodyBodyGyroJerkMag.mean..	fBodyBodyGyroJerkMag.mean.._mean|
fBodyBodyGyroJerkMag.meanFreq..	fBodyBodyGyroJerkMag.meanFreq.._mean|
