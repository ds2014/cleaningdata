## Getting and Cleaning Data Science Project

This project transforms the original [dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCM Machine Learning repository into a form ready for the further analysis.

The main script can be invoked from the R environment (run_Analysis.R)

The main script consists of the four auxilary R scripts, which perform the analysis.

* source("readData.R")

* source("renameData.R")

* source("mergeData.R")

* source("combineTidyData.R")

To run the script you may checkout this repository, or download project archive, and run source run_Analysis.R from R console.

```
$ git clone git@github.com:ds2014/cleaningdata.git

> source("run_Analysis.R")
```

### Read Data

The readData.R simply reads labels and features, test, and train data into the dataframes.

### Rename Data

The renameData.R script provides descriptive names for the test and train datasets so the datasets are ready for the merge step.

### Merge Data

The mergeData.R script joins train and test data into a single dataset(row-wise) and extract the columns of the interests such as mean and std.

### Combine Data

The combineTidyData.R script creates a cross-tabular dataset with the average of each variable of interest for each activity and each subject. Additionally, the result of the analysis is saved as [tidymeansdataset.txt](tidymeansdataset.txt).

