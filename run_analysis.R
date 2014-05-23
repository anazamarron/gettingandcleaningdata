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

# extract the columns we nedd (we get a data.frame as result of this operation)
totalX <- totalX[,mean_std]

# Add correct names to the columns and clean the names a little bit
colnames(totalX) <- features[mean_std, 2]
colnames(totalX) <- tolower(names(totalX))
colnames(totalX) <- gsub("\\(\\)", "", names(totalX))
names(totalX) <- gsub("-","_",names(totalX))


# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table('UCI\ HAR\ Dataset/activity_labels.txt',stringsAsFactor=FALSE)
activities[, 2] <- tolower(as.character(activities[, 2]))

# assign the value of avtivity to the totalY data.frame
totalY[,1] <- activities[totalY[,1], 2]
colnames(totalY) <- "activities"

# 4. Appropriately labels the data set with descriptive activity names.
colnames(totalSubject) <- "subject"
totalData <- cbind(totalSubject,totalY, totalX)

write.table(totalData, 'UCI\ HAR\ Dataset/clean_data.txt')


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
        for (a in 1:numActivities) {
                result[row, 1] = uniqueSubjects[s]
                result[row, 2] = activities[a, 2]
                tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
                result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
                row = row+1
        }
}
write.table(result, "data_set_with_the_averages.txt")

# res2 <- read.table("data_set_with_the_averages.txt")
# result[4,4]
# res2[4,4]
# res2[4,4]==result[4,4]
# result[6,4]
# res2[6,4]
# res2[6,4]==result[6,4]