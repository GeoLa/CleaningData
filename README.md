Cleaning Data - Course project 

The purpose of the project was to create an R script that does the following
	
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with 
	   the average of each variable for each activity and each subject.

Using the Human Activity Recognition Using Smartphones Data Set. The dataset and more details about it can be found at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This repository contains the an R script called run_analysis.R which does the above 5 actions. 

The ouptup of the run code is a dataset called final that contains 180 observations and 82 variables
The tidy datasets contains the average values for each measure by activity and group.

More details about the values included in the dataset can be found in the codebook.md file



