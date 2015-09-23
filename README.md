# run_analysis.R README
ken r.  
Sept. 21, 2015  

##Background
In December, 2012 scientists of the University of Genova's Smartlab Research Laboratory conducted a series of experiments designed to measure human movement via smartphone technology. Utilizing the smartphone's built-in accelerometer and gyroscope, the scientists were able to measure six activities for each of 30 volunteers. These experiments culminated in a data set the scientists labeled "Human Activity Recognition Using Smartphones (HARUS) Data Set Version 1.0".

##Code Description
When executed, **run_analysis.r** proceeds to subset the original HARUS data set, creating a new, much smaller data set of mean and  standard deviation activity measurements for each subject. Each variable in the new data set will be labeled with descriptive activity names. Using this new data set as input, the script creates a second, independent data set containing the average of each variable for each activity, for each subject. The output of this script will be **analysis_output.txt**; a tidy, wide dataset:

180 rows x 84 variables.
There are 30 subjects. Each subject is tied to 6 rows of activity measurements - one per activity.
For each row, each measurement contains an average of mean or standard deviation values, of which there are 82.

##Data Processing

###Raw Data Collection
An overview of the HARUS Smartlab data set documentation can be downloaded from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The actual data set and descriptive files can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on Original HARUS Data Set 
The HARUS data set consists of a number of text files. These files contain subject  activity measurements (up to 6 for each subject), subject identifiers, features, and activity lables. Subjects were randomly assigned to either a "TESTING" or "TRAINING" group; there are subject data files for each group. 

The "TRAINING" subject data is contained in:

- **X_train.txt**: Activity measurments for the "TRAINING" subjects.
- **y_train.txt**: "TRAINING" subject identifiers.

The "TESTING" subject data is contained in:

- **X_test.txt**: Activity measurments for the "TESTING" subjects.
- **y_test.txt**: "TESTING" subject ID.

For the six activities hundreds of "features" were measured:

- **features.txt**: Lists 561 features.
- **features_info.txt**: Shows information about the variables used on the feature vector.
- **activity_labels.txt**: List of the activities measured for each subject.

*Note: The HUARS data set includes "Inertial" files for both the "TESTING" and "TRAINING" groups. These files are NOT utilized for this project.*

###Record Content
When the original files are appropriately combined, a single file of 10,299 results. According to the original HUARS README, each record therein contains:

>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
>- Triaxial Angular velocity from the gyroscope 
>- A 561-feature vector with time and frequency domain variables 
>- It's activity label 
>- An identifier of the subject who carried out the experiment


##Steps to Execute run_analysis.R

###Installation

*Note: "R" and/or "RStudio" must be installed on the target workstation.*

To create a tidy data file from the original HARUS data set:

1. Clone the "GCD_analysis" Github repo to a new folder on your workstation. The repo is located at:
https://github.com/kricklin/gcd_analysis
2. Launch the "RStudio" application, or "R" from the command line
3. Set the "working directory" to the new folder that contains the repo
4. Run the "run_analysis.R" file.

###Code Processing Overview
The code in "analysis.R" performs the following steps:

####Part I - Set Up
1. Load required R packages - **data.table**, **dplyr**, and **stringr**
2. Download and expand the "Dataset.zip" archive into a "./data" sub-directory

####Part II - Process Test Data - 2947 Rows
1. Load the Test Measurements into a data frame
2. Load the Test Subject IDs into a separate data frame
3. Add the Subject IDs to the Test Measurements in a new column
4. Load the Test Activities into a separate vector
5. Add the Activities to the Test Measurements in a new column

####Part III - Process Training Data - 7352 Rows
"Process Test Data" steps 1-5 are repeated for Training Data 

####Part IV - Merge Subject Data
1. Merge the mutated Test and Training Data Frames
2. Move "subject_id" and "activity" columns to first two columns
3. Using the "features.txt" file assign Column Names
4. Using the "activity_labels.txt" file to change the activity column values from numeric values (1-6) to text factors

The merged data results in a data frame of 10,299 Rows x 563 Columns.

####Part V - Subset and Summarize
1. Subset all variables with labels containing "std()" or "mean"

*Notes: Only feature names containing "std()" or "mean" are included in the subset. However, seven features with names  beginning with "angle" and containing "mean" are excluded. The result is 82 features/values per observation.*
 
2. To improve meaning and reability, modified variable names as follows:


 Original        | New
 ----------------|-----------------
 begins with "f" | begins with "f_"
 begins with "t" | begins with "t_"
 "-"             | "\_"
 "BodyBody"      | "body_"
 "Body"          | "body_"
 "Gravity"       | "gravity_"
 "Acc"           | "accel_"
 "Gyro"          | "gyro_"
 "JerkMag"       | "jerk_mag"
 UPPER CASE      | lower case


3. Create a new, independent tidy data set with the average of each variable for each activity and each subject

###Resulting Data Set Notes

####Dimensions
180 observations/rows of 82 variables/columns

####Data Summary
- Each row represents all measurements for a single activity  for a single subject.
- Each column represents an average value for a specific measurement
 
##Original HUARS Data Set License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
