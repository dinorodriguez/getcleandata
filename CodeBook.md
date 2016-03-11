CODEBOOK
========

This file pretends to explain or reference all the files, terms and variables involved in the JHU-Coursera’ Getting and Cleaning Data Course Project.

Description of original directories and files with raw data.
============================================================

The data used for this "Coursera’ Getting and Cleaning Data Course Project" is downloaded from the website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and is used with the following reference according to the directions inside:

"Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012"

UCI HAR Dataset/ root directory.
--------------------------------

The whole raw data set consist of 10299 records of an "Activity" (from a list of 6) and a "Subject" (from 1 to 30 option values). This data files are distributed in two main groups: training and test. The "train/" directory contains 7352 records corresponding to the 71% and the "test/" directory contains 2947 records corresponding to the 29% of whole data.

train/ subdirectory
-------------------

  Inertial Signals/ subdirectory
  ------------------------------
  This is the original train data, which has been preprocessed and resumed on "X_train.txt".
  Each file within this directory contains 7352 x 128 cols. This 128 "measures" within a time window frame are totalized in 561 different "features" summarized in the external files "X_train.txt" with the rows for the corresponding activity ids (y_train.txt), subject ids (subject_train.txt) and columns for all the 561 features (features.txt).

    Gyroscope XYZ data:
    -------------------
    body_gyro_x_train.txt
    body_gyro_y_train.txt
    body_gyro_z_train.txt

    Accelerometer data:
    -------------------
    > TOTAL (Including gravity)

	total_acc_x_train.txt
    total_acc_y_train.txt
    total_acc_z_train.txt

    > Body (TOTAL substracting Gravity)

    body_acc_x_train.txt
    body_acc_y_train.txt
    body_acc_z_train.txt

- X_train.txt: 7352 "Activity x Subject" measures x 561 features
- subject_train.txt: Subject ids for each record row
- y_train.txt: Activity ids for each record row

test/ directory
---------------

  Inertial Signals/ subdirectory
  ------------------------------
  This is the original test data, which has been preprocessed and resumed on "X_test.txt".
  Each file within this directory contains 2947 x 128 cols. This 128 "measures" within a time window frame are totalized in 561 different "features" summarized in the external files "X_test.txt" with the rows for the corresponding activity ids (y_test.txt), subject ids (subject_test.txt) and columns for all the 561 features (features.txt).

    Gyroscope XYZ data:
    -------------------
    body_gyro_x_test.txt
    body_gyro_y_test.txt
    body_gyro_z_test.txt

    Accelerometer data:
    -------------------
    > TOTAL (Including gravity)

	total_acc_x_test.txt
    total_acc_y_test.txt
    total_acc_z_test.txt

    > Body (TOTAL substracting Gravity)

    body_acc_x_test.txt
    body_acc_y_test.txt
    body_acc_z_test.txt

- X_test.txt: 2947 "Activity x Subject" measures x 561 features
- subject_test.txt: Subject ids for each record row
- y_test.txt: Activity ids for each record row


Script Variables
================

Once mentioned the data files involved, the following is the explanation of the variables involved in the script program used to prepare the tidy data set:

The script is named “run_analysis.R”

-	train_data: Training set data uploaded from train/X_train.txt file
-	train_activity_ids: Training set activity ids uploaded from train/y_train.txt file
-	train_subjects: Training data subjects uploaded from train/subject_train.txt file

-	test_data: Test set data uploaded from test/X_test.txt file
-	test_activity_ids: Test set activity ids uploaded from test/y_test.txt file
-	test_subjects: Test data subjects uploaded from test/subject_test.txt file

-	data: master data array joined from train + test data
-	features: array with names of 561 features uploaded from features.txt file
-	activity_ids: array with activity_ids joined from train + test activity_ids data
-	subjects: array with subjects joined from train + test subjects data

-	mean_and_std_columns: subset with the column ids matching "mean(" and "std(" column names
-	activity_labels: array with names of 6 activities uploaded from activity_labels.txt file

-	data2: final tidy data set array obtained from "data" master array

-	tidy_data_set.txt: final filename with the tidy data set required
