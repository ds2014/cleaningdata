### Packages reshape2
library(reshape2)
### Load needed datasets
featureData <- read.table("./data/features.txt")
activitiesLabelData <- read.table("./data/activity_labels.txt")
testSubjectData <- read.table("./data/test/subject_test.txt")
testData <- read.table("./data/test/X_test.txt")
testActivityData <- read.table("./data/test/y_test.txt")
trainSubjectData <- read.table("./data/train/subject_train.txt")
trainData <- read.table("./data/train/X_train.txt")
trainActivityData <- read.table("./data/train/y_train.txt")

### Name the columns with variable names
varNames <- as.character(featureData[,2])
colnames(testData) <- colnames(trainData) <- varNames
colnames(testSubjectData) <- colnames(trainSubjectData) <- "Subject"
colnames(testActivityData) <- colnames(trainActivityData) <- "Activity"

## Join columns subject, data and activity
testData <- cbind(testSubjectData, testData, testActivityData)
trainData <- cbind(trainSubjectData, trainData, trainActivityData)

## Join rows from test and train datasets
mergedData <- rbind(testData, trainData)

## Renaming activity to more descriptive names
activity <- data$Activity
mergedData$Activity <- activitiesLabelData[activity,2]

## Extracting variables with mean and standard deviation only
##finalData <- mergedData[,c(1, grep("mean", colnames(mergedData)),
##                   grep("std", colnames(mergedData)), 563)]

finalData <- mergedData[,c(1, grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", colnames(mergedData)), 563)]
                           
#grep("[Mm]ean\\(\\)|[Ss]td\\(\\)"
## Rearrange data frame and make a new one with the means of the variables by
## activity and subject
meltedData <- melt(finalData, id.vars=c("Subject", "Activity"))
tidymeansdataset <- dcast(meltedData, Activity + Subject ~ variable, mean)

## Save table in tidydatameans.txt
write.csv(tidymeansdataset, "tidymeansdataset.txt", row.names=F)