### Rename dataset
varNames <- as.character(featureData[,2])
colnames(testData) <- colnames(trainData) <- varNames
colnames(testSubjectData) <- colnames(trainSubjectData) <- "Subject"
colnames(testActivityData) <- colnames(trainActivityData) <- "Activity"
