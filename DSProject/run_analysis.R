#----------------------------------------------------------------------
# Read X_train.txt, y_train.txt, subject_train.txt, file from UCI HAR Dataset

trainData <- read.table("./UCI_HAR_Dataset/train/X_train.txt", sep="", fill=FALSE, head=FALSE)
activityTrainData <- read.table("./UCI_HAR_Dataset/train/y_train.txt", sep="", fill=FALSE, head=FALSE)
subjectTrainData <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", sep="", fill=FALSE, head=FALSE) 

# Read X_test.txt, y_test.txt, subject_test.txt, file from UCI HAR Dataset

testData <- read.table("./UCI_HAR_Dataset/test/X_test.txt", sep="", fill=FALSE, head=FALSE)
activityTestData <- read.table("./UCI_HAR_Dataset/test/y_test.txt", sep="", fill=FALSE, head=FALSE)
subjectTestData <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", sep="", fill=FALSE, head=FALSE) 

# Read features file from UCI HAR Dataset
featureNameData <- read.table("./UCI_HAR_Dataset/features.txt", sep="", fill=FALSE, head=FALSE)

#----------------------------------------------------------------------
# 1. Merge the train data with the test data

subjectData <- rbind(subjectTrainData, subjectTestData)
activityData <- rbind(activityTrainData, activityTestData)
featureData <- rbind(trainData, testData)

names(subjectData) <- c("subject")
names(activityData) <- c("activity")
names(featureData) <- featureNameData$V2

mergeSubjectActivity <- cbind(subjectData, activityData)
mergeFeatureData <- cbind(mergeSubjectActivity, featureData)

#----------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement

meanStdName <- featureNameData$V2[grep("mean\\(\\)|std\\(\\)", featureNameData$V2)]
extractFeatureName <- c("subject", "activity", as.character(meanStdName))
extractFeatureData <- subset(mergeFeatureData, select=extractFeatureName)

#----------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data 
#    set

activityLabel <- read.table("./UCI_HAR_Dataset/activity_labels.txt", sep="", fill=FALSE, head=FALSE)
extractFeatureData[,2] = activityLabel[extractFeatureData[,2],2]

#----------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names

names(extractFeatureData) <- gsub("^t", "time", names(extractFeatureData))
names(extractFeatureData) <- gsub("^f", "frequency", names(extractFeatureData))
names(extractFeatureData) <- gsub("Gyro", "Gyroscope", names(extractFeatureData))
names(extractFeatureData) <- gsub("Mag", "Magnitude", names(extractFeatureData))
names(extractFeatureData) <- gsub("Acc", "Accelerometer", names(extractFeatureData))
names(extractFeatureData) <- gsub("BodyBody", "Body", names(extractFeatureData))

#----------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.

avgFeatureData <- aggregate(extractFeatureData[,3:66], by=list(extractFeatureData$subject, 
                            extractFeatureData$activity), FUN=mean)
names(avgFeatureData)[1] <- "subject"
names(avgFeatureData)[2] <- "activity"
write.table(avgFeatureData, file="tidydataset.txt", row.name=FALSE)
