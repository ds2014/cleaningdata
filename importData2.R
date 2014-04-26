## Auxilary Script: Reads data for subsequent reuse by the analysis script
library(data.table)
# Create file urls

# Features
fileFeatureUrl <- "./data/features.txt"
fileActivityLabelsUrl <- "./data/activity_labels.txt"

# Test data
fileTestSubjectsUrl <- "./data/test/subject_test.txt"
fileTestDataUrl <- "./data/test/X_test.txt"
fileTestActivityUrl <- "./data/test/y_test.txt"

# Train data
fileTrainSubjectsUrl <- "./data/train/subject_train.txt"
fileTrainDataUrl <- "./data/train/X_train.txt"
fileTrainActivityUrl <- "./data/train/y_train.txt"

fileFeatureUrl
fileActivityLabelsUrl
fileTestSubjectsUrl
fileTestDataUrl
fileTestActivityUrl
fileTrainSubjectsUrl
fileTrainDataUrl
fileTrainActivityUrl

#Read data
featureData <- read.table(fileFeatureUrl)
nrow(featureData)
head(featureData)

activitiesLabelData <- read.table(fileActivityLabelsUrl)
nrow(activitiesLabelData)
head(activitiesLabelData)

testSubjectsData <- read.table(fileTestSubjectsUrl)
nrow(testSubjectsData)
head(testSubjectsData)

testData <- read.table(fileTestDataUrl)
nrow(testData)
head(testData)

testActivityData <- read.table(fileTestActivityUrl)
nrow(testActivityData)
head(testActivityData)

trainSubjectsData <- read.table(fileTrainSubjectsUrl)
nrow(trainSubjectsData)
head(trainSubjectsData)

trainData <- read.table(fileTrainDataUrl)
nrow(trainData)
head(trainData)

trainActivityData <- read.table(fileTrainActivityUrl)
nrow(trainActivityData)
head(trainActivityData)

# Format data sets with appropriate labels

### Name the columns with variable names
featureColumnNames <- as.character(featureData[,V2])

requiredColumns<-grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", featureData$V2)

# Rename features subset
subsetFeatureData <- featureData[requiredFeatures, featureData$V2),]
subsetFeatureData
colnames(subsetFeatureData) <- c("feautureid","featurename")

# Make test data
# Subset test dataset based on the required features
subsetTestData=testData[,(subsetFeatureData$feautureid)]
colnames(subsetTestData)=subsetFeatureData$featurename
str(subsetTestData)


# Add activity id
subsetTestDataFinal=cbind(testActivityData,subsetTestData)
colnames(subsetTestDataFinal)[1]="activityid"
str(subsetTestDataFinal)


#Add Subject Id
subsetTestDataFinal1=cbind(testSubjectsData,subsetTestDataFinal)
colnames(subsetTestDataFinal1)[1]="subjectid"


#Merging the activity labels dataframe to give the descriptive activities of test subjects
colnames(activitiesLabelData)=c("activityid","activitylabel")

subsetTestDataFinal2=merge(subsetTestDataFinal1,activitiesLabelData,by="activityid",all.x=TRUE)

#X_test_v3=X_test_v2[,c(2,1,69,3:68)] #Reordering columns


