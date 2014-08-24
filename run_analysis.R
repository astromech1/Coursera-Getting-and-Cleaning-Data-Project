#------------------------------------------------------------------
# run_analysis.R
#
# The purpose of this project is to demonstrate your ability to 
#    collect, work with, and clean a data set. The goal is to prepare 
#    tidy data that can be used for later analysis. 
#    You will be required to submit: 
#       1) a tidy data set as described below
#       2) a link to a Github repository with your script for 
#               performing the analysis
#       3) a code book that describes the variables, the data, 
#               and any transformations or work that you performed 
#               to clean up the data called CodeBook.md. 
#
# You should also include a README.md in the repo with your scripts. 
#    This repo explains how all of the scripts work and how they 
#    are connected. 
#------------------------------------------------------------------
# ply provides tools for splitting, applying and combining data
library(plyr) 

#--------------------------------
# define global variables
setInternet2(TRUE)
url <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip"
zipfile <- "UCI HAR Dataset.zip"
resultsFolder <- "results"

#--------------------------------
# File download but check to see if  
#    the data zip file exists otherwise download
if(!file.exists(zipfile)){ 
  print("Downloading the Data Files")
  download.file(url,zipfile)   
} else {
  print("Using existing Data Files")
}

#--------------------------------
# Create the results folder if it does not already exist
if(!file.exists(resultsFolder)){
  print("Creating results folder")
  dir.create(resultsFolder)
} else {
  print("Using existing folder structure")
}

#--------------------------------
# FUNCTION Definitions
#--------------------------------
#--------------------------------
# Reads and creates a complete data set
genTrainData<-function(features){
# features 
# builds the path to the file to pass to buildTable
#--------------------------------        
  print("Gathering TRAIN data")
  subject_data<-buildTable("UCI HAR Dataset/train/subject_train.txt","id")
  y_data<-buildTable("UCI HAR Dataset/train/y_train.txt","activity")    
  x_data<-buildTable("UCI HAR Dataset/train/X_train.txt",features$V2) 
  
  # put them together using cbind (combines vector, matrix or data frame by columns)
  return (cbind(subject_data,y_data,x_data)) 
}

#--------------------------------
# Reads and creates a complete data set
genTestData<-function(features){
# features 
# builds the path to the file to pass to buildTable
#--------------------------------        
  print("Gathering TEST data")
  subject_data<-buildTable("UCI HAR Dataset/test/subject_test.txt","id")
  y_data<-buildTable("UCI HAR Dataset/test/y_test.txt","activity")    
  x_data<-buildTable("UCI HAR Dataset/test/X_test.txt",features$V2) 
  
  # put them together using cbind (combines vector, matrix or data frame by columns)
  return (cbind(subject_data,y_data,x_data)) 
}

#--------------------------------
# Reads the files from the zip as a table and applies colnames
buildTable<-function (filename,colnames = NULL){
# filename - the files name in the zip
# colnames - column name (default is NULL)
#--------------------------------  
  # Empty data.frame
  data<-data.frame()

  print(paste("Building table from:", filename))
  # UNZ reads (only) single files within zip files, in binary mode. 
  zipFile<-unz(zipfile, filename) 
  
  # check if the colnames is null add all columns
  #    else add the specified column 
  if(is.null(colnames)){
    data<-read.table(zipFile,as.is=TRUE)
  } else {
    data<-read.table(zipFile,as.is=TRUE,col.names= colnames)
  }        
  # return the data.frame
  data        
}

#--------------------------------
# saves the data into the result folder
saveTable<-function (data,name){
# data - dataset 
# name - saved name
#--------------------------------
  file<-paste(resultsFolder, "/", name,".csv" ,sep="")
  print(paste("Saving dataset to", file))  
  write.csv(data,file)
}

#--------------------------------
# MAIN - Run everything 
#--------------------------------
# features used for col names when creating train and test data sets
features<-buildTable("UCI HAR Dataset/features.txt")
# use activity names to name the activities in the data set
activityLabels<-buildTable("UCI HAR Dataset/activity_labels.txt")

# Load the data sets using features and pss the data through "buildTable"
train<-genTrainData(features)
test<-genTestData(features)
# Merges the train and the test sets to create one working data set using rbind
workingDataSet<-rbind(train, test)
# rearrange the data by columns
workingDataSet<-arrange(workingDataSet, id)

#--------------------------------
# DatasetOne
# use factor to set the activity lables
workingDataSet$activity<-factor(workingDataSet$activity, levels=activityLabels$V1, labels=activityLabels$V2)
# Extracts only the measurements on the standard deviation for each measurement
mergeStd<-workingDataSet[,c(1,2,grep("std", colnames(workingDataSet)))]
# Extracts only the measurements on the mean for each measurement
mergeMean<-workingDataSet[,grep("mean", colnames(workingDataSet))]
# cbind the tables together
datasetOne<-cbind(mergeStd,mergeMean)
# save datasetOne into results folder
saveTable(datasetOne,"datasetOne")

#--------------------------------
# DatasetTwo
# Create the data set with the average of each variable for each activity and each subject
datasetTwo<-ddply(datasetOne,.(id, activity),.fun=function(x){ colMeans(x[,-c(1:2)]) })
# Add "_mean" to column names
colnames(datasetTwo)<-paste(colnames(datasetTwo),"_mean",sep="")
# Save datasetTwo into results folder
saveTable(datasetTwo,"datasetTwo")

write.table(datasetTwo,file="submit.txt",row.name=FALSE)