This project was done as part of the Coursera course Getting and Cleaning Data. The objective of the project is to arrive
at a tidy data set starting from data collected from accelerometers from the Samsung Galaxy S smartphone.

The details of the experiment are available on this page: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
In brief, this was the experimental menthodology to get the raw data: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

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

Step 2: 
- We extracted  only the measurements on the mean and standard deviation for each measurement.
- We used the 'grep' functionality in R to detect patterns for mean and std measurements.

Step 3: 
  - Next, we replaced the numeric code associated with the activities (Activities field) with descriptive names
  - We converted the Activity field to a factor.
  - We then used the names provided in 'activity\_labels.txt' file to assign levels to the Activity column.
  
Step 4: 
  - All the column names were replaced with appropriate descriptive variable names
  - We used the 'sapply' operator along with 'gsub' in a series of steps to achieve this.

Step 5: 
- Finally, in order to create an independent tidy data set with the average of each variable for each activity and each subject, we followed the following process.
- We 'melted' the data frame from step 4 that had all the relevant variables using the melt function
- We then used the 'dcast' function from the reshape2 library to compute the mean of each of the variable grouped by a Subject ID (Subject) and Activity Label (Activity)
- The result of this is a new data frame that held the mean (average) of all relevant variables for each subject, activity combination.
- Finally, we wrote this data frame to a file called 'tidy_data.txt' using write.table. This file holds the tidy data set that we might require for further analysis.

Details of Variables
====================

- Subject: The identifier of a subject or a volunteer.
- Activity 
- Estimated.Acceleration.of.Body.Mean().X 
- Estimated.Acceleration.of.Body.Mean().Y 
- Estimated.Acceleration.of.Body.Mean().Z 
- Estimated.Acceleration.of.Body.Standard.Deviation().X 
- Estimated.Acceleration.of.Body.Standard.Deviation().Y 
- Estimated.Acceleration.of.Body.Standard.Deviation().Z 
- Gravitational.Acceleration.Mean().X 
- Gravitational.Acceleration.Mean().Y 
- Gravitational.Acceleration.Mean().Z 
- Gravitational.Acceleration.Standard.Deviation().X 
- Gravitational.Acceleration.Standard.Deviation().Y 
- Gravitational.Acceleration.Standard.Deviation().Z 
- Jerk.from.Body.Linear.Acceleration.Mean().X 
- Jerk.from.Body.Linear.Acceleration.Mean().Y 
- Jerk.from.Body.Linear.Acceleration.Mean().Z J
- Jerk.from.Body.Linear.Acceleration.Standard.Deviation().X 
- Jerk.from.Body.Linear.Acceleration.Standard.Deviation().Y 
- Jerk.from.Body.Linear.Acceleration.Standard.Deviation().Z 
- Angular.Velocity.of.Body.from.Gyroscope.Mean().X 
- Angular.Velocity.of.Body.from.Gyroscope.Mean().Y 
- Angular.Velocity.of.Body.from.Gyroscope.Mean().Z 
- Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation().X
- Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation().Y
- Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation().Z 
- Jerk.from.Body.Angular.Velocity.Mean().X 
- Jerk.from.Body.Angular.Velocity.Mean().Y 
- Jerk.from.Body.Angular.Velocity.Mean().Z 
- Jerk.from.Body.Angular.Velocity.Standard.Deviation().X 
- Jerk.from.Body.Angular.Velocity.Standard.Deviation().Y 
- Jerk.from.Body.Angular.Velocity.Standard.Deviation().Z 
- Magnitude.of.Acceleration.of.Body.Mean() 
- Magnitude.of.Acceleration.of.Body.Standard.Deviation() 
- Magnitude.of.Gravitational.Acceleration.Mean() 
- Magnitude.of.Gravitational.Acceleration.Standard.Deviation() 
- Jerk.from.Body.Linear.AccelerationMag.Mean() 
- Jerk.from.Body.Linear.AccelerationMag.Standard.Deviation() 
- Magnitude.of.Angular.Velocity.of.Body.from.Gyroscope.Mean()
- Magnitude.of.Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation() 
- Jerk.from.Body.Angular.VelocityMag.Mean() 
- Jerk.from.Body.Angular.VelocityMag.Standard.Deviation() 
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.Mean().X 
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.Mean().Y 
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.Mean().Z
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.Standard.Deviation().X
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.Standard.Deviation().Y
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.Standard.Deviation().Z
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.MeanFreq().X
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.MeanFreq().Y 
- Fast.Fourier.Transform.of.Body.Linear.Acceleration.MeanFreq().Z
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.Mean().X
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.Mean().Y
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.Mean().Z
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.Standard.Deviation().X
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.Standard.Deviation().Y
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.Standard.Deviation().Z
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.MeanFreq().X
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.MeanFreq().Y
- Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration.MeanFreq().Z
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.Mean().X
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.Mean().Y
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.Mean().Z
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation().X
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation().Y
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.Standard.Deviation().Z
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.MeanFreq().X
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.MeanFreq().Y
- Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope.MeanFreq().Z
- Fast.Fourier.Transform.of.Magnitude.of.Acceleration.of.Body.Mean()
- Fast.Fourier.Transform.of.Magnitude.of.Acceleration.of.Body.Standard.Deviation()
- Fast.Fourier.Transform.of.Magnitude.of.Acceleration.of.Body.MeanFreq()
- Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Linear.Acceleration.Mean()
- Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Linear.Acceleration.Standard.Deviation()
- Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Linear.Acceleration.MeanFreq()
- Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Angular.Velocity.Mean()
- Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Angular.Velocity.Standard.Deviation()
- Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Angular.Velocity.MeanFreq() 
- fBodyBodyGyroJerkMag.Mean() 
- fBodyBodyGyroJerkMag.Standard.Deviation() 
- fBodyBodyGyroJerkMag.MeanFreq()
