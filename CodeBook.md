#Code Book
Description of the run_analytics.R

##Build Environmentv and Getting Data

1. Load library plyr
2. Define Global Variables
3. Check the directory structure for the ZIP file prior to download.
4. Download the required data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) only if needed.
5. Create results folder if one does not exist

##Processing Data and build Results Files

1. Use the feature data set (features.txt) to build the column names
2. Build train data frame using X_train.txt col.name = features data set), y_train.txt (col.name = activity labels), subject_train.txt (col.names = ids)
3. Build test data frame using X_test.txt (col.name = features data set), y_test.txt (col.name = activity labels), subject_test.txt (col.names = ids)
4. Merge train and test data frames using rbind
5. Reorder the data frame by column name using arrange
6. Build data frame "activityLabels" table using activity_labels.txt
7. Use "activityLables" to label activities
8. Push the mean,std into datasetOne
9. Saves datasetOne into results/datasetOne.csv
10. Use ddply to subset the data frame, apply a function (colMeans) to calculate mean then combine results into a data frame
11. Appends "_mean|" to all data columns in datasetTwo
12. Saves datasetTwo into results/datasetTwo.csv

##Variables Used

* url - the url of the data
* zipfile - defins the name of the zip file 
* resultsFolder -  defines the results folder
* features - (data.frame) contains to features.txt used for column names
* activityLables- (data.frame) contains the activity_labels.txt from buildTable used for column names
* train - (data.frame) contains the train data from buildTables
* test - (data.frame) contains the test data from buildTables
* workingDataSet - contains the merged train and test data.framse using cbind the arrange (via "id")
* mergeStd - contains the "std" columns from workingDataSet
* mergeMean - contains the "mean" columns from workingDataSet
* datasetOne - merged mergeStd and mergeMean using cbind
* datasetTwo - use ddply for each subset (id and activity) of a datasetOne then apply the colMeans function to get the average of the columns then combine results into a data.frame. Finish the data.frame by using paste to add "_mean"

##Functions Used
* genTainData - uses the train files in the zip files to create three data.frames (using the buildTable function) for the subject_data, y_data and X_data.
	* argument features - used to define the column name for the x_data data.frame
	* return - data.frame of subject_data,y_data and x_data using cbind.
* genTestData - uses the test files in the zip files to create three data.frames (using the buildTable function) for the subject_data, y_data and X_data.
	* argument features - used to define the column name for the x_data data.frame
	* return - data.frame of subject_data,y_data and x_data using cbind.
* buildTable - uses unz to extract the requested file from the zip file and creates a data.frame and returns the same
	* argument filename - location and name of file within the zipfiles
	* argument colNames - column names to be used)
	* return - data.frame
* saveTable - saves the data.frame as a csv
	* argument data - the data.frame
	* argument name - the name of the file (csv)

##Output
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
|fBodyAcc.std...X	|fBodyAcc.std...X_mean|
|fBodyAcc.std...Y	|fBodyAcc.std...Y_mean|
|fBodyAcc.std...Z	|fBodyAcc.std...Z_mean|
|fBodyAccJerk.std...X	|fBodyAccJerk.std...X_mean|
|fBodyAccJerk.std...Y	|fBodyAccJerk.std...Y_mean|
|fBodyAccJerk.std...Z	|fBodyAccJerk.std...Z_mean|
|fBodyGyro.std...X	|fBodyGyro.std...X_mean|
|fBodyGyro.std...Y	|fBodyGyro.std...Y_mean|
|fBodyGyro.std...Z	|fBodyGyro.std...Z_mean|
|fBodyAccMag.std..	|fBodyAccMag.std.._mean|
|fBodyBodyAccJerkMag.std..	|fBodyBodyAccJerkMag.std.._mean|
|fBodyBodyGyroMag.std..	|fBodyBodyGyroMag.std.._mean|
|fBodyBodyGyroJerkMag.std..	|fBodyBodyGyroJerkMag.std.._mean|
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
|fBodyAcc.mean...X	|fBodyAcc.mean...X_mean|
|fBodyAcc.mean...Y	|fBodyAcc.mean...Y_mean|
|fBodyAcc.mean...Z	|fBodyAcc.mean...Z_mean|
|fBodyAcc.meanFreq...X	|fBodyAcc.meanFreq...X_mean|
|fBodyAcc.meanFreq...Y	|fBodyAcc.meanFreq...Y_mean|
|fBodyAcc.meanFreq...Z	|fBodyAcc.meanFreq...Z_mean|
|fBodyAccJerk.mean...X	|fBodyAccJerk.mean...X_mean|
|fBodyAccJerk.mean...Y	|fBodyAccJerk.mean...Y_mean|
|fBodyAccJerk.mean...Z	|fBodyAccJerk.mean...Z_mean|
|fBodyAccJerk.meanFreq...X	|fBodyAccJerk.meanFreq...X_mean|
|fBodyAccJerk.meanFreq...Y	|fBodyAccJerk.meanFreq...Y_mean|
|fBodyAccJerk.meanFreq...Z	|fBodyAccJerk.meanFreq...Z_mean|
|fBodyGyro.mean...X	|fBodyGyro.mean...X_mean|
|fBodyGyro.mean...Y	|fBodyGyro.mean...Y_mean|
|fBodyGyro.mean...Z	|fBodyGyro.mean...Z_mean|
|fBodyGyro.meanFreq...X	|fBodyGyro.meanFreq...X_mean|
|fBodyGyro.meanFreq...Y	|fBodyGyro.meanFreq...Y_mean|
|fBodyGyro.meanFreq...Z	|fBodyGyro.meanFreq...Z_mean|
|fBodyAccMag.mean..	|fBodyAccMag.mean.._mean|
|fBodyAccMag.meanFreq..	|fBodyAccMag.meanFreq.._mean|
|fBodyBodyAccJerkMag.mean..	|fBodyBodyAccJerkMag.mean.._mean|
|fBodyBodyAccJerkMag.meanFreq..	|fBodyBodyAccJerkMag.meanFreq.._mean|
|fBodyBodyGyroMag.mean..	|fBodyBodyGyroMag.mean.._mean|
|fBodyBodyGyroMag.meanFreq..	|fBodyBodyGyroMag.meanFreq.._mean|
|fBodyBodyGyroJerkMag.mean..	|fBodyBodyGyroJerkMag.mean.._mean|
|fBodyBodyGyroJerkMag.meanFreq..	|fBodyBodyGyroJerkMag.meanFreq.._mean|
