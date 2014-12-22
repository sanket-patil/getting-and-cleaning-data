This project was done as part of the Coursera course Getting and Cleaning Data. The objective of the project is to arrive
at a tidy data set starting from data collected from accelerometers from the Samsung Galaxy S smartphone.

The details of the experiment are available on this page: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
In brief, this was the experimental menthodology to get the raw data: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

As part of the project, our task was the following analysis. 

Create an R script called run_analysis.R that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

Analysis Steps Followed to arrive at Tidy Data
=============================================

Step 1:  
- We start by binding the columns in subject\_train.txt, which has the IDs of the subjects performing 
activities, and y\_train.txt, which has the activity IDs for each observation, with X\_train.txt, which has the 
feature vectors for each observation. 
- We use the cbind operator to merge the components of each of training data
and test data separately. 
- Finally, we merged them together using the rbind operator.
- Next, we assigned column names to all the columns in the unified data set. We used the file 'features.txt' to get
the names of the variables, and assigned them as column names. Every row was also assigned a Subject and a Activity.
- Step 2: We extracted  only the measurements on the mean and standard deviation for each measurement. 
- Step 3: Uses descriptive activity names to name the activities in the data set
- Step 4: Appropriately labels the data set with descriptive variable names. 
- Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject