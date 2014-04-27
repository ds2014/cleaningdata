### Rename dataset
featureNames <- as.character(featureData[,2])
colnames(testData) <- colnames(trainData) <- featureNames
colnames(testSubjectData) <- colnames(trainSubjectData) <- "Subject"
colnames(testActivityData) <- colnames(trainActivityData) <- "Activity"
