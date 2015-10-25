#getting and unzipping dataset
install.packages("downloader")
library(downloader)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileURL, dest="dataset.zip", mode="wb")
unzip ("dataset.zip", exdir = "./")

#merging the training and the test sets to create one data set

ActivityTrain <- read.table("./Data/UCI HAR Dataset/train/y_train.txt", header=T, sep="\t")
ActivityTest <- read.table("./Data/UCI HAR Dataset/test/y_test.txt", header=T, sep="\t")

SubjectTrain <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt", header=T, sep="\t")
SubjectTest <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt", header=T, sep="\t")

DataTrain <- read.table("./Data/UCI HAR Dataset/train/X_train.txt", header=T, sep="\t")
DataTest <- read.table("./Data/UCI HAR Dataset/test/X_test.txt", header=T, sep="\t")


mergedActivity <- merge(ActivityTrain, ActivityTest)
mergedSubject <- merge(SubjectTrain, SubjectTest)
mergedData <- merge(DataTrain, DataTest)

dtSubject <- cbind(mergedActivity, mergedSubject)
MergedTotal <- cbind(dtSubject, mergedData)

# naming the activities in the data set with descriptive activity names  

setnames(mergedDataSubject, "V1", "subject")
setnames(mergedDataActivity, "V1", "activityNum")

write.table(MergedTotal, file = "tidyData.txt", row.name=FALSE)
