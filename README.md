## Data Cleaning of the Human Activity Recognition Using Smartphones Dataset

This script creates a tidy data set from the Human Activity Recognition Using Smartphones [Dataset] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Please refer to the **Data processing** section in `codebook.md` attached in this repo for data specification and description of cleaning process.

To run the script in R, simply type:

```
source("run_analysis.R")
```

(provided that `run_analysis.R` is in your working directory). The unzipped folder `UCI HAR Dataset` with the original data should be in your current working directory to allow the script work properly.

The result of the script is a space separated value file named `tidy_data.txt`. To view it in R, you can use:

```
data = read.table("tidy_data.txt")
View(data)
```
