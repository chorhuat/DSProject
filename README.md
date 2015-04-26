# DSProject
# 	**Getting and Cleaning Data Project**
	Author: Tan Chor Huat

#	**Purpose**
To demonstrate the ability to collect, work with, and clean a data set with
the goal of preparing tidy data that can be used for later analysis.

#	**Dataset**
The data for the project is located at the following URL address:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset consists of train and test sets. The train set consists of subject_train, 
X_train, y train, and inertia signals; and the test set consists of subject_test, X_test, 
y_test, and inertia signals together with activity_labels, features, and features_info
as shown in the following file structure:

	UCI_HAR_Dataset
		- test
			- Inertial Signals
				body_acc_x_test
				body_acc_y_test
				body_acc_z_test
				body_gyro_x_test			
				body_gyro_y_test
				body_gyro_z_test
				total_acc_x_test
				total_acc_y_test
				total_acc_z_test
			subject_test
			X_test
			y_test
		- train
			- Inertial Signals
				body_acc_x_test
				body_acc_y_test
				body_acc_z_test
				body_gyro_x_test			
				body_gyro_y_test
				body_gyro_z_test
				total_acc_x_test
				total_acc_y_test
				total_acc_z_test
			subject_test
			X_train
			y_train	
	activity_labels
	features
	features_info
	README

# 	**Setting up Working Directory**
Create a working directory folder, DSProject, for Data Science Project to host the 
dataset, the run_analysis script, and the tidy data set. Download the dataset and 
unzip it into a sub-folder of the DSProject and name it UCI_HAR_Dataset as follows:

	DSProject
		- UCI_HAR_Dataset
		run_analysis
		
#	**Procedure for Cleaning Dataset**
The run_analysis R script is written to perform the following tasks:
1. 	Merge the training and the test sets to create one data set.
2. 	Extract only the measurements on the mean and standard deviation for each 
	measurement.
3. 	Use descriptive activity names to name the activities in the data set. 
	The activity names in the combined dataset is change to walking, walking upstairs,
	walking downstairs, sitting, standing, and laying
4. 	Appropriately label the data set with descriptive variable names. The following
	labels are change to descriptive variable names:
	a. t is replaced with time
	b. f is replaced with frequency
	c. Gyro is replaced with Gyroscope
	d. Mag is replaced with Magnitude
	e. Acc is replaced with Accelerometer
	f. BodyBody is replaced with Body
5. 	From the data set in step 4, create a second, independent tidy data set with the 
	average of each variable for each activity and each subject.

#	**Cleaning the Dataset**
The dataset to be cleaned is located in the folder, UCI_HAR_Dataset and the run_analysis
script is located at the same folder level as the UCI_HAR_Dataset. The R script is 
developed using RStudio Version 0.98.1103. To run the script, double click on the file.
This will start RStudio which will then open the run_analysis script. Select Code from 
the top menu and Source from the dropdown menu to run run_analysis script in the console.
The output from the run_analysis script is the tidydataset text file. 
