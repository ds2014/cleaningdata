# Read datasets

featureData <- read.table("./data/features.txt")
activitiesLabelData <- read.table("./data/activity_labels.txt")
testSubjectData <- read.table("./data/test/subject_test.txt")
testData <- read.table("./data/test/X_test.txt")
testActivityData <- read.table("./data/test/y_test.txt")
trainSubjectData <- read.table("./data/train/subject_train.txt")
trainData <- read.table("./data/train/X_train.txt")
trainActivityData <- read.table("./data/train/y_train.txt")