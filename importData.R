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

#Rename columns in the test data set
oldNames <- colnames(testData)
newNames <- featureColumnNames
setnames(testData,oldNames, newNames)

#Rename columns in the train data set
oldNames <- colnames(trainData)
newNames <- featureColumnNames
setnames(trainData,oldNames, newNames)

requiredColumns<-grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", featureData$V2)

# Subset testData on the required columns
test<- testData[, requiredColumns]
str(test)

# Subset train data on the required columns
trainData <- data.table(read.table(fileTrainDataUrl))
nrow(trainData)
str(trainData)
#Rename columns in the train data set
oldNames <- colnames(trainData)
newNames <- featureColumnNames
setnames(trainData,oldNames, newNames)
colnames(trainData)
trainData[,grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", featureData$V2)]

train<- trainData[,requiredColumns]
str(train)


# Rename columns in the testSubject
oldNames <- colnames(testSubjectsData)
newNames <- "Subject"
setnames(testSubjectsData,oldNames, newNames)
colnames(testSubjectsData)

#Rename columns in the test and train Acitivity data sets
oldNames <- colnames(testActivityData)
newNames <- "Activity"
setnames(testActivityData,oldNames, newNames)
colnames(testActivityData)

oldNames <- colnames(trainActivityData)
newNames <- "Activity"
setnames(trainActivityData,oldNames, newNames)

# Make test data
testData <- cbind(testSubjectsData,testData,testActivityData)
nrow(testData)

# Make train data
trainData <- cbind(trainSubjectsData,trainData,trainActivityData)
nrow(trainData)

# Validate data sets structure
str(testData)
str(trainData)

# Merge Test and Train dataset
combinedData <- rbind(testData, trainData, use.names=FALSE)
str(combinedData)
nrow(combinedData)

requiredFeatures<-grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", featureData$V2)

# Rename features subset
subsetFeatureData <- featureData[requiredFeatures, featureData$V2),]
subsetFeatureData
colnames(subsetFeatureData) <- c("feautureid","featurename")


# Subset test dataset based on the required features
subsetTestData=testData[,subsetFeatureData$feautureid]
colnames(subsetTestData)=subsetFeatureData$featurename

X_test_req_feat=testData[,(subsetFeatureData$Feature_number)]

#Add activityid for the test subjects
labeledSubsetTestData=cbind(testActivityData,subsetTestData)
colnames(labeledSubsetTestData)[1]="Activity_Id"
labeledSubsetTestData

#Adding and naming the column for Subject number of the test subjects
X_test_v1=cbind(sub_test,X_test_req_feat_labels)
colnames(X_test_v1)[1]="Subject_number"


combinedDataTemp <- combinedData

subsetFeatureData<- featureData[,requiredColumns]

#Rename columns in the combined data set
oldNames <- colnames(combinedDataTemp)
newNames <- featureColumnNames
setnames(combinedDataTemp,oldNames, newNames)

# Subset testData on the required columns
fullData<- combinedDataTemp[, requiredColumns]
str(fullData)

setkey(testData, "Subject")
setkey(trainData, "Subject")

fullDataSet<- merge(testData, trainData, all=FALSE)

## Join columns subject, data and activity
#testData <- cbind(testSubject, testData, testActivity)

#big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
#file <- tempfile()
#write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
#system.time(fread(file))