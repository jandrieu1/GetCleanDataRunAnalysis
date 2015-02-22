
# identify home directory (to be used throughout script)

fulldir <- getwd() # finds your working directory

# load packages

library(plyr)
library(gmodels)
library(doBy)

### download zip file to working directory

zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl, "dataset.zip", method="auto")
unzip("dataset.zip", exdir="dataset")

### Merges the training and the test sets to create one data set ###

# read and merge the three training files

tdir <- "dataset/UCI HAR Dataset/train" # directory folder

tX_dir <- paste(fulldir, tdir, "X_train.txt", sep="/")
tx = read.table(tX_dir)

ty_dir <- paste(fulldir, tdir, "y_train.txt", sep="/")
ty = read.table(ty_dir)
names(ty)[1] <- "Label"

ts_dir <- paste(fulldir, tdir, "subject_train.txt", sep="/")
ts = read.table(ts_dir)
names(ts)[1] <- "Subject"

# merge training files

train <- cbind(tx, ty)
train <- cbind(train, ts)

# add train dataset label

x <- c("dataset")
train[, x] <- "Train"

# read and merge the three test files

sdir <- "dataset/UCI HAR Dataset/test" # directory folder

sx_dir <- paste(fulldir, sdir, "X_test.txt", sep="/")
sx = read.table(sx_dir)

sy_dir <- paste(fulldir, sdir, "y_test.txt", sep="/")
sy = read.table(sy_dir)
names(sy)[1] <- "Label"

ss_dir <- paste(fulldir, sdir, "subject_test.txt", sep="/")
ss = read.table(ss_dir)
names(ss)[1] <- "Subject"

# merge test files

test <- cbind(sx, sy)
test <- cbind(test, ss)

# add teset dataset label

test[, x] <- "Test"

# append train and test files into one master file

master <- rbind(train, test)
CrossTable(master$dataset)
master[1:5, c(1:4, 561:564)]

### Extracts only the measurements on the mean and standard deviation for each measurement. 

# read features dataset

fdir <- "dataset/UCI HAR Dataset" # directory folder
f_dir <- paste(fulldir, fdir, "features.txt", sep="/")
feat = read.table(f_dir)
feat2 <- data.frame(do.call('rbind', strsplit(as.character(feat$V2), '-', fixed=TRUE)))
feat <- cbind(feat, feat2)

# keeps wanted variables only (i.e. mean() and std())

featx <- feat[with(feat, X2 == "mean()" | X2 == "std()"), ]

# cleans variable names before merging into master file

featx$varname <- gsub("\\-mean\\()", "M", featx$V2)
featx$varname <- gsub("\\-std\\()", "S", featx$varname)
featx$varname <- gsub("Body", "B", featx$varname)
featx$varname <- gsub("Gravity", "G", featx$varname)

# create index that drops unwanted variables from master file (generates mc=master clean)

colind <- row.names(featx)
colind <- as.numeric(colind)

# extract columns from master based on mean/std index

mc <- master[, c(colind, 562:564)]

### Uses descriptive activity names to name the activities in the data set

adir <- "dataset/UCI HAR Dataset" # activities directory folder
a_dir <- paste(fulldir, adir, "activity_labels.txt", sep="/")
act = read.table(a_dir)

# merge activity labels into master clean file (mc)

mc <- merge(mc, act, by.x="Label", by.y="V1", all=TRUE)
names(mc)[70]<- "ActivityLabel"

### Appropriately labels the data set with descriptive variable names. 

featnames <- as.vector(featx[, 6]) # uses clean variables names (varname)
featnames <- c("Label", featnames, "Subject", "dataset", "ActivityLabel")

names(mc) <- c(featnames)

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# master file becomes mcby (master clean by Subject & Activity)

mcby <- do.call(data.frame, aggregate(. ~ Subject + ActivityLabel, 
                                      mc[, c(2:67, 70, 68)], function(x) c(mean = mean(x))))

# order mcby

mcby <- orderBy(~Subject+ActivityLabel, mcby)

### write to .txt file for submission

write.table(mcby, file="RunAnalysisTidy.txt", sep = " ", row.names = FALSE)

