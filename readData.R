# Read datasets

dataVariableNames <- read.table("./data/features.txt")
dataActivityNames <- read.table("./data/activity_labels.txt")
testSubject <- read.table("./data/test/subject_test.txt")
testData <- read.table("./data/test/X_test.txt")
testActivity <- read.table("./data/test/y_test.txt")
trainSubject <- read.table("./data/train/subject_train.txt")
trainData <- read.table("./data/train/X_train.txt")
trainActivity <- read.table("./data/train/y_train.txt")