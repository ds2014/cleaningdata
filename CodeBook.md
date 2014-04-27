## Read Data & Create Data Frames

The following data frames created from the original text files:


* featureData - a data frame of features labels and ids.

* activitiesLabelData - a data frame of activities and ids.

* testSubjectData - a data frame of test Subjects.

* testData - a data frame with measurements recorded for the test subjects.

* testActivityData  - a data frame contains activity code for the test dataset.

* trainSubjectData - a data frame of train Subjects.

* trainData - a data frame with measurements recorded for the train subjects.

* trainActivityData - a data frame contains activity code for the train dataset.



## Data Transformation

The feature labels is extracted into the character vector *featureNames*, which is used to assign the column names to the test and train dataset.

The columns subject and activity are added to the test and train datasets.

The train and test dataset are merged vertically into the *mergedData* data frame.

The *mergedData* is used to create a *finalData* frame, which contains the columns of interest (mean and std in their name).

The *meltedData* frame is created with Subject, Activity, measurement and value.

The *tidymeansdataset* is made by creating a cross-tabular dataset by casting it as a dataframe with the average of each variable of interest for each activity and each subject.

The cleaned dataset is saved as tidymeansdataset.txt.