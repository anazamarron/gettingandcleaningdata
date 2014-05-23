#### Getting And Cleaning Data Project Statement:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project: 

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

You should create one R script called `run_analysis.R` that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Good luck!

#### Code Book:

	Note: Operating System OS X Version 10.9.2


* __Create a directory in your local machine:__

	`/Users/Shared/R/gettingandcleaningdata`

* __Set the working directory in rStudio__

	`setwd("/Users/Shared/R/gettingandcleaningdata")`


* __Download__ <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> into your working directory `/Users/Shared/R/gettingandcleaningdata` and uncompress it there.

You get the folder: `UCI HAR Dataset` with the following content:

	* activity_labels.txt
	* features_info.txt
	* features.txt
	* README.txt
	* test
		* Inertial Signals
			* body_acc_x_test.txt
			* body_acc_y_test.txt
			* body_acc_z_test.txt
			* body_gyro_x_test.txt
			* body_gyro_y_test.txt
			* body_gyro_z_test.txt
			* total_acc_x_test.txt
			* total_acc_y_test.txt
			* total_acc_z_test.txt
		* subject_test.txt
		* X_test.txt
		* Y_test.txt
	*train
		* Inertial Signals
			* body_acc_x_train.txt
			* body_acc_y_train.txt
			* body_acc_z_train.txt
			* body_gyro_x_train.txt
			* body_gyro_y_train.txt
			* body_gyro_z_train.txt
			* total_acc_x_train.txt
			* total_acc_y_train.txt
			* total_acc_z_train.txt 
		* subject_train.txt
		* X_train.txt
		* Y_train.txt

* Put `run_analysis.R` in `/Users/Shared/R/gettingandcleaningdata`

* 


		



