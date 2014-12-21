library(reshape2)

# Bind the columns in 'subject_train.txt', which has the IDs of the subjects
# performing activities, and 'y_train.txt', which has the activity IDs for each
# observation, with 'X_train.txt', which has the feature vectors for each observation.
complete_dataset_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")
complete_dataset_train = cbind(y_train, complete_dataset_train)
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
complete_dataset_train = cbind(subject_train, complete_dataset_train)

# Do the same for test data
complete_dataset_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")
complete_dataset_test = cbind(y_test, complete_dataset_test)
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
complete_dataset_test = cbind(subject_test, complete_dataset_test)

# Finally, merge the complete training and test data through row binding
complete_train_and_test = rbind(complete_dataset_train, complete_dataset_test)

# Assign column names to columns
features <- read.table("UCI HAR Dataset/features.txt", colClasses = "character")
features <- features$V2
column_names <- append(c("Subject", "Activity"), features)
colnames(complete_train_and_test) <- column_names

# Extract only the columns that have measurements on the mean and standard
# deviation for each measurement
mean_and_std = complete_train_and_test[, grep("mean()|std()", 
                                             colnames(complete_train_and_test))]
mean_and_std = cbind(complete_train_and_test[, 1:2], mean_and_std)

# Assign descriptive activity names to name the activities in the data set
mean_and_std$Activity = as.factor(mean_and_std$Activity)
levels(mean_and_std$Activity) <- read.table("UCI HAR Dataset/activity_labels.txt")$V2

# Appropriately labels the data set with descriptive variable names
cols <- colnames(mean_and_std)
cols <- sapply(cols, function(x) gsub("()", "", x))
cols <- sapply(cols, function(x) gsub("fBodyBodyGyroMag", 
                              "Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Angular.Velocity", x))
cols <- sapply(cols, function(x) gsub("fBodyBodyAccJerkMag",
                              "Fast.Fourier.Transform.of.Magnitude.of.Jerk.from.Body.Linear.Acceleration", x))
cols <- sapply(cols, function(x) gsub("fBodyAccMag",
                              "Fast.Fourier.Transform.of.Magnitude.of.Acceleration.of.Body", x))
cols <- sapply(cols, function(x) gsub("fBodyGyro",
                              "Fast.Fourier.Transform.of.Angular.Velocity.of.Body.from.Gyroscope", x))
cols <- sapply(cols, function(x) gsub("fBodyAccJerk",
                              "Fast.Fourier.Transform.of.Jerk.from.Body.Linear.Acceleration", x))
cols <- sapply(cols, function(x) gsub("fBodyAcc",
                              "Fast.Fourier.Transform.of.Body.Linear.Acceleration", x))
cols <- sapply(cols, function(x) gsub("tBodyGyroMag",
                              "Magnitude.of.Angular.Velocity.of.Body.from.Gyroscope", x))
cols <- sapply(cols, function(x) gsub("tGravityAccMag",
                              "Magnitude.of.Gravitational.Acceleration", x))
cols <- sapply(cols, function(x) gsub("tBodyAccMag",
                              "Magnitude.of.Acceleration.of.Body", x))
cols <- sapply(cols, function(x) gsub("tBodyGyroJerk",
                              "Jerk.from.Body.Angular.Velocity", x))
cols <- sapply(cols, function(x) gsub("tBodyGyro",
                              "Angular.Velocity.of.Body.from.Gyroscope", x))
cols <- sapply(cols, function(x) gsub("tBodyAccJerk",
                              "Jerk.from.Body.Linear.Acceleration", x))
cols <- sapply(cols, function(x) gsub("tGravityAcc",
                              "Gravitational.Acceleration", x))
cols <- sapply(cols, function(x) gsub("tBodyAcc",
                              "Estimated.Acceleration.of.Body", x))
cols <- sapply(cols, function(x) gsub("-mean()",
                              ".Mean", x))
cols <- sapply(cols, function(x) gsub("-std()",
                              ".Standard.Deviation", x))
cols <- sapply(cols, function(x) gsub("-",
                              ".", x))
colnames(mean_and_std) <- cols

# From the above data create an independent tidy data set 
# with the average of each variable for each activity and each subject.

mean_and_std_melt <- melt(mean_and_std, id = c("Subject", "Activity"), 
                         measure.vars = colnames(mean_and_std)[-1:-2])
mean_of_variables <- dcast(mean_and_std_melt, Subject + Activity ~ variable, mean)
write.table(mean_of_variables, "tidy_data.txt", row.name=FALSE)





