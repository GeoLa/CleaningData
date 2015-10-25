### Course project for Cleaning Data ###

# The data are collected from the accelerometers from the Samsung Galaxy S smartphone
# The dataset is separated into a training and test data set
# More information about the data can be found at
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The purpose of this code is to 
# 1. Merge the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

## Set working directory
# Make sure that the folder of the data is saved in the working directory
list.files()
features <- read.table("features.txt")
activitylab <- read.table("activity_labels.txt")

## Load and read train data
# train data
setwd("./train")
list.files()
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

names(x_train) <- features$V2
dftrain <- x_train
dftrain$Activity <-y_train$V1
dftrain$Subject <- subject_train$V1
dftrain$Type <- "train"

## Load and read test data
# test data
setwd("./test")
list.files()
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

names(x_test) <- features$V2
dftest <- x_test
dftest$Activity <-y_test$V1
dftest$Subject <- subject_test$V1
dftest$Type <- "test"

## Combine train and test data
df <- rbind(dftrain,dftest)

## Extract only mean and std meansurements

tmp1 <- df[,grep("mean()", colnames(df))]
tmp2 <- df[,grep("std()", colnames(df))]
df1 <- cbind(tmp1,tmp2)
remove(tmp1, tmp2)

## Use descriptive activity names to name the activities in the data set
df1$Activity <- df$Activity
df1$Subject <- df$Subject
df2 <- merge(df1, activitylab, by.x="Activity", by.y="V1")
colnames(df2)[colnames(df2)=="V2"] <- "ActivityLabel"

## creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(dplyr)

groups <- group_by(df2,Subject, Activity)
final <- summarise_each(groups, funs(mean(., na.rm=TRUE)), -ActivityLabel)
final <- merge(final, activitylab, by.x="Activity", by.y="V1")
colnames(final)[colnames(final)=="V2"] <- "ActivityLabel"

## Save dataset
setwd("../")
write.table(final,file="AvgHARdata.txt",row.name=FALSE)
