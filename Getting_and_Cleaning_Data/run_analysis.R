
#1. Merges the training and the test sets to create one data set.
#load data
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
subtrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
subtest<-read.table("UCI HAR Dataset/test/subject_test.txt")

feature<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

dim(xtrain)
dim(ytrain)
dim(subtrain)
dim(xtest)
dim(ytest)
dim(subtest)
dim(feature)
dim(activity)

#merge data
xData<-rbind(xtrain, xtest)
ylabel<-rbind(ytrain, ytest)
subject<-rbind(subtrain, subtest)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.  
meanStdIndices <- grep("[Mm]ean|[Ss]td", feature[, 2])
msData <- xData[, meanStdIndices]

#3. Uses descriptive activity names to name the activities in the data set
ylabel[,1]<-activity[ylabel[, 1], 2]
names(ylabel)<- "activity"

#4. Appropriately labels the data set with descriptive activity names. 
names(msData)<-feature[meanStdIndices, 2]
names(subject)<-"subject"
joinData<- cbind(subject, ylabel, msData)

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidy<- aggregate(joinData, by=list(activity = joinData$activity, subject=joinData$subject), mean)
tidy[,4]=NULL
tidy[,3]=NULL

write.table(tidy, "tidy.txt", row.name=FALSE)


