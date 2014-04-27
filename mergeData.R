## Merge data
testData <- cbind(testSubjectData, testData, testActivityData)
trainData <- cbind(trainSubjectData, trainData, trainActivityData)

## Combine test and train datasets
mergedData <- rbind(testData, trainData)

activity <- mergedData$Activity
mergedData$Activity <- activitiesLabelData[activity,2]

## Mine variables with mean and standard deviation
finalData <- mergedData[,c(1, grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", colnames(mergedData)), 563)]
