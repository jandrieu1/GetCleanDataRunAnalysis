
# home directory

fulldir <- getwd() # finds your working directory

# load packages

library(plyr)
library(gmodels)
library(doBy)

### download zip file to folder

zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl, "dataset.zip", method="auto")
unzip("dataset.zip", exdir="dataset")


### Merges the training and the test sets to create one data set ###

# read and merge training files

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

# read test files

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
featx <- feat[with(feat, X2 == "mean()" | X2 == "std()"), ]

# create index

colind <- row.names(featx)
colind <- as.numeric(colind)

# extract columns from master based on mean/std index

mc <- master[, c(colind, 562:564)]
str(mc)

### Uses descriptive activity names to name the activities in the data set

adir <- "dataset/UCI HAR Dataset" # directory folder
a_dir <- paste(fulldir, adir, "activity_labels.txt", sep="/")
act = read.table(a_dir)

# merge activity labels into master file

mc <- merge(mc, act, by.x="Label", by.y="V1", all=TRUE)
names(mc)[70]<- "ActivityLabel"

### Appropriately labels the data set with descriptive variable names. 

featnames <- as.vector(featx[, 2])
featnames <- c("Label", featnames, "Subject", "dataset", "ActivityLabel")

names(mc) <- c(featnames)

names(mc)

### From the data set in step 4, creates a second, independent tidy data set with the 
#   average of each variable for each activity and each subject

mcby <- do.call(data.frame, aggregate(. ~ Subject + ActivityLabel, 
                                      mc[, c(2:67, 70, 68)], function(x) c(mean = mean(x))))

mcby <- orderBy(~Subject+ActivityLabel, mcby)

### write to .txt file for submission

write.table(mcby, file="RunAnalysisTidy.txt", sep = " ", row.names = FALSE)

















