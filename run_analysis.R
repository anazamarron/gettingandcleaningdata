# This code is to solve the Getting and Cleaning Data Project 
#
# 1. Merges the training and the test sets to create one data set
#

xTrain <- read.table('UCI\ HAR\ Dataset/train/X_train.txt',stringsAsFactors=FALSE)
xTest <- read.table('UCI\ HAR\ Dataset/test/X_test.txt',stringsAsFactors=FALSE)
totalX <- rbind(xTrain, xTest)

yTrain <- read.table('UCI\ HAR\ Dataset/train/y_train.txt',stringsAsFactors=FALSE)
yTest <- read.table('UCI\ HAR\ Dataset/test/y_test.txt',stringsAsFactors=FALSE)
totalY <- rbind(yTrain, yTest)

subjectTrain <- read.table('UCI\ HAR\ Dataset/train/subject_train.txt',stringsAsFactors=FALSE)
subjectTest <- read.table('UCI\ HAR\ Dataset/test/subject_test.txt',stringsAsFactors=FALSE)
totalSubject <- rbind(subjectTrain, subjectTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table('UCI\ HAR\ Dataset/features.txt',stringsAsFactors=FALSE)

# gets a vector with the position of the columns with mean and standard deviation
mean_std <- grep("-mean()|-std()", features[, 2])

# extract the columns we need (we get a data.frame as result of this operation)
totalX <- totalX[,mean_std]




# 3. Uses descriptive activity names to name the activities in the data set

# Add correct names to the columns and clean the names a little bit
colnames(totalX) <- features[mean_std, 2]
colnames(totalX) <- tolower(names(totalX))
colnames(totalX) <- gsub("\\(\\)", "", names(totalX))
colnames(totalX) <- gsub("-","_",names(totalX))

Activities <- read.table('UCI\ HAR\ Dataset/activity_labels.txt',stringsAsFactor=FALSE)
Activities[, 2] <- tolower(as.character(Activities[, 2]))
colnames(Activities)<-c("id","activity")

# assign the value of avtivity to the totalY data.frame
totalY[,1] <- Activities[totalY[,1], 2]


# 4. Appropriately labels the data set with descriptive activity names.
colnames(totalY) <- "activities"
colnames(totalSubject) <- "subject"
totalData <- cbind(totalSubject,totalY, totalX)

# Order the data.frame by subject and activities
totalData <- totalData[with(totalData,order(subject,activities)),]

# Write data.frame into a file called cleaned_data.txt
write.table(totalData, 'UCI\ HAR\ Dataset/clean_data.txt')


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

# obtain the subjects, order them and count them:
Subjects <- unique(totalSubject)[,1]
a <- Subjects[order(Subjects)]
numSubjects <- length(a)

# We allready have the activities in the activities darta.frame, order them and count them:
numActivities <- length(Activities[,1])

# Count the number of colums of cleaned data
numColumns <- dim(totalData)[2]

# Initializes a data.frame with the total number of columns 
# and the total number of rows (Subjects * Activity)
# And assing the tudy names

finalData<-data.frame(matrix(ncol = numColumns, nrow = numSubjects*numActivities))
colnames(finalData) <- colnames(totalData)

# Start looping the subjects and activities, getting the mean of each column for them
row = 1
for (s in 1:numSubjects) {
        for (a in 1:numActivities) {
                #subject
                finalData[row,1] <- Subjects[s]
                #activity name
                finalData[row,2] <- Activities[a,2]
                # subset of this subject and this activity
                temporal <- subset(totalData, subject==s)
                temporal <- subset(temporal, activities == Activities[a,1])
                #mean of the values
                finalData[row,3:numColumns] <- colMeans(temporal[, 3:numColumns],na.rm=TRUE)
                row <-row+1
                
        }
}

# And write the result to disc
write.table(finalData, 'UCI\ HAR\ Dataset/averages_subject_activity.txt')
