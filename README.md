# Coursera Getting and Cleaning Data
### Course Project: Run Analysis

The script described below is the final outcome of Courera's "Getting and Cleaning Data" Course Project.

The underlying dataset used for this project is based on data collected from the accelerometers from the Samsung Galaxy S smartphone. For a full description, please visit the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The underlying dataset used for this project can be found at the link below:

**(NOTE: the run_analysis.R script includes code that will download and unzip the file)**

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

There were seven major steps associated with this project as spelled out below:

1. Prep-work
  * Identify working directory (to be used throughout script)
  * Load relevant packages
  * Download zip file to working directory
2. Merge the training and the test sets to create one data set
  * Read and merge the three training files
  * Read and merge the three test files
  * Append train and test files into one master file
3. Extract only the measurements on the mean and standard deviation for each measurement.
  * Read features dataset
  * Keep wanted variables only (i.e. mean() and std())
  * Clean variable names before merging into master file
  * Create index that drops unwanted variables from master file (generates mc=master clean)
  * Extract columns from master based on mean/std index
4. Use descriptive activity names to name the activities in the data set
  * Merge activity labels into master clean file (mc)
5. Appropriately label the data set with descriptive variable names
6. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
  * Master file becomes mcby (master clean by Subject & Activity)
  * Order data by Subject and Activity
7. Write RunAnalysisTidy.txt file for submission

### Read RunAnalysisTidy.txt as submitted in Course Project dashboard

address <- "https://s3.amazonaws.com/coursera-uploads/user-d60262a1aa100af01ca6de7d/973498/asst-3/77a56890ba2611e488e81bc955611cb3.txt"

address <- sub("^https", "http", address)

data <- read.table(url(address), header = TRUE)

View(data)

