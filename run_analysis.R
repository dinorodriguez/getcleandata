# The following script creates a tidy data set from some wearable computing data
# collected with the accelerometer and gyroscope sensors of a Samsung Galaxy II
# smartphone.

# This is an assignment to complete the course “Getting and Cleaning Data” offered by
# John Hopkins University through Coursera.

# Variables are described in file: CodeBook.md

# CLEANING PROCESS - TABLE OF CONTENTS:
# =====================================
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

# Process Details:
# ================

# 1. Merges the training and the test sets to create one data set.
# ----------------------------------------------------------------

# Load "train" data

# Data
train_data <- read.table("train/X_train.txt")

# activity ids for train data
train_activity_ids <- read.table("train/y_train.txt")

# subjects for train data
train_subjects <- read.table("train/subject_train.txt")


# Load "test" data

# Data
test_data <- read.table("test/X_test.txt")

# activity ids for test data
test_activity_ids <- read.table("test/y_test.txt")

# subjects for test data
test_subjects <- read.table("test/subject_test.txt")


# Merge data into one data set

# Join master data arrays
data <- rbind(train_data, test_data)

# Assign 561 feature column names from file
features <- read.table("features.txt")
names(data) <- features[,2]

# Join arrays of activity ids
activity_ids <- rbind(train_activity_ids, test_activity_ids)

# Joins arrays of subjects 
subjects <- rbind(train_subjects, test_subjects)

# Join array of subjects to master data array
data <- cbind(subjects, data)
names(data)[1] <- "subject"

# Join activity_ids array to master data array
data <- cbind(activity_ids, data)
names(data)[1] <- "activity id"


# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.

# get the mean and std features columns subvector
mean_and_std_columns <- grep("mean\\(|std\\(", names(data))

# leave only desired columns on master data array: column 1 (activity ids), column 2
# (subjects), remaining: mean and std features columns
data <- data[, c(1:2,mean_and_std_columns)]


# 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")
data[,1] <- activity_labels[data[,1],2]
names(data)[1] <- "activity"


# 4. Appropriately labels the data set with descriptive variable names.

# According to features_info.txt...

# t -> time

names(data) <- gsub("^t", "time", names(data))

# f -> frequency

names(data) <- gsub("^f", "frequency", names(data))

# Mag -> Magnitude

names(data) <- gsub("Mag", "Magnitude", names(data))

# Acc -> Accelerometer

names(data) <- gsub("Acc", "Accelerometer", names(data))

# Gyro -> Gyroscope

names(data) <- gsub("Gyro", "Gyroscope", names(data))

# std -> Standard_Deviation

names(data) <- gsub("std", "Standard_Deviation", names(data))

# mean -> Mean

names(data) <- gsub("mean", "Mean", names(data))

# BodyBody -> Body

names(data) <- gsub("BodyBody", "Body", names(data))

# () -> 

names(data) <- gsub("\\(\\)", "", names(data))

# - (hyphen) -> _ (underscore)

names(data) <- gsub("\\-", "_", names(data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

data2 <- aggregate(. ~activity + subject, data, mean)

write.table(data2, file = "tidy_data_set.txt", row.names=FALSE)
