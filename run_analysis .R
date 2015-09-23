# run_analysis - Getting And Cleaning Data Course Project
# Author: k. ricklin

# Part I - Set working directory, download and unzip project file, load required R Packages.
#setwd("~/Documents/Online Courses/Getting and Cleaning Data/Project/data/UCI HAR Dataset")

setwd("~/Documents/Online Courses/Getting and Cleaning Data/Project/GetCleanData")

library("data.table", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

print("Setup Complete")

# -----------------------------------------------------------------------------

# The download and unzip-ing of the project file is functional but not needed
# following the initial download, so the following code is skipped:

# if(!file.exists("./data")){dir.create("./data")}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
# download.file(fileUrl,destfile="./huars.zip",method="curl")
# dateDownloaded <- date()
#
# unzip("huars.zip", exdir = "./data")

# -----------------------------------------------------------------------------

# Part II - Process Test Data - 2947 Rows
# 1) Load the Test Measurements into a DF
# 2) Load the Test Subject IDs into a separate DF
# 3) Add the Subject IDs to the Test Measurements in a new column.
# 4) Load the Test Activities into a separate vector.
# 5) Add the Activities to the Test Measurements in a new column.

print("Begin Loading Test Data...")

test_measures <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")

test_subjects <-  read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")

test_m_s <- mutate(test_measures, subject_id = as.vector(test_subjects$V1))

test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "")

test_m_s_a <- mutate(test_m_s, activity = as.vector(test_activities$V1), partition = "TESTING" )

print("Finished Loading Test Data")

# Part II - Process Training Data - 7352 Rows

print("Begin Loading Training Data...")

train_measures <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")

train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")

train_m_s <- mutate(train_measures, subject_id = as.vector(train_subjects$V1))

train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "")

train_m_s_a <- mutate(train_m_s, activity = as.vector(train_activities$V1), partition = "TRAINING" )

print("Finished Loading Training Data...")

# Part III - Merge the mutated Data Frames, Move "subject_id" and "activity" columns to first two columns, assign Column Names - 10,299 Rows x 563 Cols

print("Part 3 - Merge and Rearrange")
merge_list = list(test_m_s_a, train_m_s_a)
merged_test_train <- rbindlist(merge_list)
all_rows <- select(merged_test_train, subject_id, partition, activity, V1:V561)

# Change the activity column values from numbers to text
all_rows$activity[all_rows$activity == 1] <- "WALKING"
all_rows$activity[all_rows$activity == 2] <- "WALKING_UPSTAIRS"
all_rows$activity[all_rows$activity == 3] <- "WALKING_DOWNSTAIRS"
all_rows$activity[all_rows$activity == 4] <- "SITTING"
all_rows$activity[all_rows$activity == 5] <- "STANDING"
all_rows$activity[all_rows$activity == 6] <- "LAYING"

# Change "activity" from class "character" to class "factor"
all_rows$activity <- as.factor(all_rows$activity)
all_rows$partition <- as.factor(all_rows$partition)

# Assign Column Names
feature_names <-  read.table("UCI HAR Dataset/features.txt", sep = "")
variable_names <- as.vector(feature_names$V2)
setnames(all_rows, old=c(4:564), new=variable_names)

# Create a DF that is a subset of the "all_rows" DF.  Include columns:
# "subject_id", "activity", and any column containing the strings "mean" or "std()

print("Part 4 - Subset and Sumarize")
rows_std_mean <- select(all_rows, subject_id, partition, activity, contains("mean", ignore.case = TRUE), contains("std()"))

# Remove any rows beginning with "angle"
rows_std_mean <- select(rows_std_mean, -starts_with("angle"))

# Create a new DF that shows the average of each measurement
sum_df <- rows_std_mean %>% group_by(subject_id, partition, activity)  %>%
        summarise_each(funs(mean))

# Order the data by Volunteer ID and Activity
sum_ordered <- setorder(sum_df, subject_id, activity)

# Modify variable names to improve meaning and readabilty
# pass1
new_names <- sub("^f", "f_", names(sum_df))
# pass2
new_names <- sub("^t", "t_", new_names)
# pass3
new_names <- gsub("-", "_", new_names)
# pass4
new_names <- gsub("meanFreq", "mean_freq", new_names)
# pass5
new_names <- gsub("BodyBody", "Body", new_names)
# pass6
new_names <- gsub("Body", "Body_", new_names)
# pass7
new_names <- gsub("Gravity", "Gravity_", new_names)
# pass8
new_names <- gsub("Acc", "Accel_", new_names)
# pass9
new_names <- gsub("Gyro", "Gyro_", new_names)
# pass10
new_names <- gsub("JerkMag", "Jerk_Mag", new_names)
# pass11
new_names <- gsub("__", "_", new_names)
# pass12
new_names <- tolower(new_names)
# pass13
new_names <- gsub("\\(\\)", "", new_names)

# Use setnames() as more efficient than colnames()
setnames(sum_df, c(new_names))

# Create the output file
#write.table(sum_df, file="../../data/analysis_output.txt", sep=" ", row.names=FALSE, quote=FALSE)
write.table(sum_df, file="huars_tidy_subset.txt", sep=" ", row.names=FALSE, quote=FALSE)

print("Analysis Complete")
