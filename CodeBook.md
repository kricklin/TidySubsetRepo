# run_analysis.R Codebook
ken r.  
Sept. 21, 2015  

##Background
This codebook provides overview for the file **analysis_output.txt** that is created by the **run_analysis.r** script included in the "GetCleanData" repository.

##Data Processing
For an overview of the original HUARS data set and the script  used to create the **analysis_output.txt** file, please see the [README](https://github.com/kricklin/GetCleanData) included with the "GetCleanData" repository.

###analysis_output.r Notes

####Dimensions
180 observations/rows of 82 variables/columns

####Data Summary

#####180 Rows/Observations:

   + 30 Test Subjects   
   + 6 Activities per Subject
- Each row represents a collection of all *mean* and *standard deviation* measurements assocated with a specific activity for a single volunteer as captured by smartphone technology. 

#####82 Columns/Variables:                         

   + 3 Observation Identifiers/Keys   
   + 79 Averaged Features/Measures    
- With the exception of the Identifier columns (**subject_id**, **partition**, **activity**), each column represents the average value for a specific measurement of *mean* or *standard deviation*.
 
####Variable Names:


| Number|Old Name |New Name |Class |
|-------|---------|---------|------|
|  1.   | subject_id | subject_id <sup>1</sup> | integer
|  2.   | partition | partition <sup>2</sup> | factor
|  3.   | activity  | activity <sup>3</sup> | factor
|  4.   | tBodyAcc-mean()-X | t_body_accel_mean_x | double    
|  5. |  tBodyAcc-mean()-Y | t_body_accel_mean_y | double            
|  6. |  tBodyAcc-mean()-Z  | t_body_accel_mean_z | double
  7. |  tGravityAcc-mean()-X | t_gravity_accel_mean_x | double          
  8. |  tGravityAcc-mean()-Y | t_gravity_accel_mean_y | double          
  9. |  tGravityAcc-mean()-Z | t_gravity_accel_mean_z | double          
 10. |  tBodyAccJerk-mean()-X | t_body_accel_jerk_mean_x | double         
 11. |  tBodyAccJerk-mean()-Y | t_body_accel_jerk_mean_y | double          
 12. |  tBodyAccJerk-mean()-Z | t_body_accel_jerk_mean_z | double          
 13. |  tBodyGyro-mean()-X | t_body_gyro_mean_x | double 
 14. |  tBodyGyro-mean()-Y | t_body_gyro_mean_y | double              
 15. |  tBodyGyro-mean()-Z |  t_body_gyro_mean_z | double              
 16. |  tBodyGyroJerk-mean()-X | t_body_gyro_jerk_mean_x | double         
 17. |  tBodyGyroJerk-mean()-Y | t_body_gyro_jerk_mean_y | double          
 18. |  tBodyGyroJerk-mean()-Z | t_body_gyro_jerk_mean_z | double          
 19. |  tBodyAccMag-mean()  | t_body_accel_mag_mean | double             
 20. |  tGravityAccMag-mean() | t_gravity_accel_mag_mean | double          
 21. |  tBodyAccJerkMag-mean() | t_body_accel_jerk_mag_mean | double         
 22. |  tBodyGyroMag-mean() | t_body_gyro_mag_mean | double            
 23. |  tBodyGyroJerkMag-mean() | t_body_gyro_jerk_mag_mean | double         
 24. |  fBodyAcc-mean()-X | f_body_accel_mean_x | double             
 25. |  fBodyAcc-mean()-Y | f_body_accel_mean_y | double             
 26. |  fBodyAcc-mean()-Z | f_body_accel_mean_z | double             
 27. |  fBodyAcc-meanFreq()-X | f_body_accel_mean_freq_x | double           
 28. |  fBodyAcc-meanFreq()-Y | f_body_accel_mean_freq_y | double            
 29. |  fBodyAcc-meanFreq()-Z | f_body_accel_mean_freq_z | double            
 30. |  fBodyAccJerk-mean()-X | f_body_accel_jerk_mean_x | double          
 31. |  fBodyAccJerk-mean()-Y | f_body_accel_jerk_mean_y | double          
 32. |  fBodyAccJerk-mean()-Z | f_body_accel_jerk_mean_z | double          
 33. |  fBodyAccJerk-meanFreq()-X | f_body_accel_jerk_mean_freq_x | double      
 34. |  fBodyAccJerk-meanFreq()-Y | f_body_accel_jerk_mean_freq_y | double     
 35. |  fBodyAccJerk-meanFreq()-Z |  f_body_accel_jerk_mean_freq_z | double      
 36. |  fBodyGyro-mean()-X | f_body_gyro_mean_x | double             
 37. |  fBodyGyro-mean()-Y | f_body_gyro_mean_y | double            
 38. |  fBodyGyro-mean()-Z | f_body_gyro_mean_z | double             
 39. |  fBodyGyro-meanFreq()-X | f_body_gyro_mean_freq_x | double          
 40. |  fBodyGyro-meanFreq()-Y | f_body_gyro_mean_freq_y | double          
 41. |  fBodyGyro-meanFreq()-Z | f_body_gyro_mean_freq_z | double          
 42. |  fBodyAccMag-mean() | f_body_accel_mag_mean | double             
 43. |  fBodyAccMag-meanFreq() | f_body_accel_mag_mean_freq | double          
 44. |  fBodyBodyAccJerkMag-mean() | f_body_accel_jerk_mag_mean | double    
 45. |  fBodyBodyAccJerkMag-meanFreq() | f_body_accel_jerk_mag_mean_freq | double  
 46. |  fBodyBodyGyroMag-mean() | f_body_gyro_mag_mean | double         
 47. |  fBodyBodyGyroMag-meanFreq() | f_body_gyro_mag_mean_freq | double     
 48. |  fBodyBodyGyroJerkMag-mean() | f_body_gyro_jerk_mag_mean | double   
 49. |  fBodyBodyGyroJerkMag-meanFreq() | f_body_gyro_jerk_mag_mean_freq | double
 50. |  tBodyAcc-std()-X | t_body_accel_std_x | double                
 51. |  tBodyAcc-std()-Y | t_body_accel_std_y | double               
 52. |  tBodyAcc-std()-Z | t_body_accel_std_z | double              
 53. |  tGravityAcc-std()-X | t_gravity_accel_std_x | double              
 54. |  tGravityAcc-std()-Y | t_gravity_accel_std_y | double           
 55. |  tGravityAcc-std()-Z | t_gravity_accel_std_z | double           
 56. |  tBodyAccJerk-std()-X | t_body_accel_jerk_std_x | double           
 57. |  tBodyAccJerk-std()-Y | t_body_accel_jerk_std_y | double          
 58. |  tBodyAccJerk-std()-Z | t_body_accel_jerk_std_z | double          
 59. |  tBodyGyro-std()-X | t_body_gyro_std_x | double             
 60. |  tBodyGyro-std()-Y | t_body_gyro_std_y | double             
 61. |  tBodyGyro-std()-Z | t_body_gyro_std_z | double               
 62. |  tBodyGyroJerk-std()-X | t_body_gyro_jerk_std_x | double              
 63. |  tBodyGyroJerk-std()-Y | t_body_gyro_jerk_std_y | double
 64. |  tBodyGyroJerk-std()-Z | t_body_gyro_jerk_std_z | double             
 65. |  tBodyAccMag-std() | t_body_accel_mag_std | double               
 66. |  tGravityAccMag-std() | t_gravity_accel_mag_std | double          
 67. |  tBodyAccJerkMag-std() | t_body_accel_jerk_mag_std | double          
 68. |  tBodyGyroMag-std() | t_body_gyro_mag_std | double              
 69. |  tBodyGyroJerkMag-std() | t_body_gyro_jerk_mag_std | double           
 70. |  fBodyAcc-std()-X | f_body_accel_std_x | double               
 71. |  fBodyAcc-std()-Y | f_body_accel_std_y | double               
 72. |  fBodyAcc-std()-Z | f_body_accel_std_z | double               
 73. |  fBodyAccJerk-std()-X | f_body_accel_jerk_std_x | double             
 74. |  fBodyAccJerk-std()-Y | f_body_accel_jerk_std_y | double            
 75. |  fBodyAccJerk-std()-Z | f_body_accel_jerk_std_z | double          
 76. |  fBodyGyro-std()-X | f_body_gyro_std_x | double            
 77. |  fBodyGyro-std()-Y | f_body_gyro_std_y | double             
 78. |  fBodyGyro-std()-Z | f_body_gyro_std_z | double             
 79. |  fBodyAccMag-std() | f_body_accel_mag_std | double                
 80. |  fBodyBodyAccJerkMag-std() | f_body_accel_jerk_mag_std | double         
 81. |  fBodyBodyGyroMag-std() | f_body_gyro_mag_std | double          
 82. |  fBodyBodyGyroJerkMag-std() | f_body_gyro_jerk_mag_std | double       


####New Variable Name Guide:


| String |Meaning |
|--------|--------|
 f\_ | frequency 
 t\_ | time 
 \_gyro | gyroscope
 \_accel | accelerometer
 \_std | standard deviation


###Variable Notes
####1. subject_id
Integer - a value ranging from 1 - 30 that identifies each participant.

####2. partition
Factor of 2 Levels - an identifier tying the subject to a group/partition:


| Value |Label |
|-------|------|
1 | TRAINING
2 | TESTING


####3. activity
Factor of 6 Levles - identifies one of six activity measurments:


| Value |Label |
|-------|------|
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING


##Original HUARS Data Set License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
