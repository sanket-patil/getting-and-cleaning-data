Creating a Tidy Data Set out of the 'Human Activity Recognition Using Smartphones Dataset'
=========================

The objective of this project is to create a tidy data set from the  UCI Human Activity Recognition Dataset.

Contents of this submission
===========================
This submission includes the following:

- README.md
- An R script named 'run_analysis.R' that performs a series of transformations on the raw data and produces tidy data in the last step
- A text file called tidy_data.txt which is an independent tidy data set we created as part of this exercise.
- A code book that provides details about the analysis we did and the variables.

Running the script
=================

To reproduce the tidy data set (tidy\_data.txt), simply source the file run\_analysis.R on RStudio: source("run_analysis.R")

Analysis Steps
==============

- Step 1: Merge the training and the test sets to create one data set.
 We start by binding the columns in subject\_train.txt, which has the IDs of the subjects performing activities, and y\_train.txt, which has the activity IDs for each observation, with X\_train.txt, which has the feature vectors for each observation.
- Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 
- Step 3: Uses descriptive activity names to name the activities in the data set
- Step 4: Appropriately labels the data set with descriptive variable names. 
- Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
