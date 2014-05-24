#CODE BOOK


**1. Merges the training and the test sets to create one data set.**

you sould get:

	data.frame: 	totalX: 		10299 rows - 561 cols 
	data.frame : 	totalY			10299 rows - 1 cols
	data.frame: 	totalSubjects	10299 rows - 1 cols 



**2. Extracts only the measurements on the mean and standard deviation for each measurement**

you should get:

	data.frame: 	totalX: 		10299 rows - 79 cols 
	data.frame : 	totalY			10299 rows - 1 cols
	data.frame: 	totalSubjects	10299 rows - 1 cols 
 

**3. Uses descriptive activity names to name the activities in the data set**

This cleans data and the data.frames got the apropiate tidy names

you get a data.frame called Activity with the following content:

	  id           activity
	1  1            walking
	2  2   walking_upstairs
	3  3 walking_downstairs
	4  4            sitting
	5  5           standing
	6  6             laying

**4. Appropriately labels the data set with descriptive activity names.**

* Assign the value of the activities to the data frame `totalY` 

* Gives proper names to the data.frames Activities and Subject 

* Bind all the data.frames in one called `totalData` that is cleaned and tidy
 
 we get:

	data.frame: 	Activities:		6 rows -  2 cols
	data.frame: 	totalData:		10299 rows - 81 cols

then it's saved into disk in the working directory: `./UCI HAR Dataset/clean_data.txt`


**5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

* obtain the subjects, order them and count them

we get:

	array: 		Subjects:		1:30



* Count `Activities`:


we get:

	totalActivities:	6L

* Count Columns in `totalData`:


we get:

	numColumns:		81L
	
* Initializes a data.frame with the total number of columns and the total number of rows (Subjects * Activity) and assing the tidy names

we get: 

	data.frame: 	finalData:		180 rows -  81 cols
	
	all the values are NA
	
* Start looping the subjects and activities, getting the mean of each column and filling `finalData`

we get: 

	data.frame: 	finalData:		180 rows -  81 cols

	with the means and the tidy values for subject and activity


* Then save the file in the working directory: `./UCI HAR Dataset/averages_subject_activity.txt`