## Course Project Codebook

Note: the variables underpinning this project's dataset are described in full detail in the dataset's "features.txt" file, which can be seen once the dataset is downloaded to the working directory.

This dataset includes 180 observations across 68 variables. Its naming convention was simplified from the original version for the purposes of the Coursera Course Project. This simplified syntax includes:

* Prefix (first letter): t=Time or f=Frequency Domain Signals
* Acceleration signals (see second and third letter(s)): B=Body; BB=BodyBody; G=Gravity
* Additional features: Acc=Accelerometer; Gyro=Gyroscope; Jerk=Jerk; Mag=Magnitude
* Estimation type: M=Mean value; S=Standard Deviation
* Suffix: .X, .Y, and .Z denote 3-axial signals in the X, Y, and Z directions

Non-measure variables include "Subject" and "Activity Label" as seen below:
* Subject: denotes subject performing activities (30 volunteers ages 19-48)
* ActivityLabel: denotes type of activity performed by each subject  (1-6)
  - 1 WALKING
  - 2 WALKING_UPSTAIRS
  - 3 WALKING_DOWNSTAIRS
  - 4 SITTING
  - 5 STANDING
  - 6 LAYING

The origianl dataset included a variety of summary statistics; this dataset extracted only variables calculating the Mean and Standard Deviation of the original dataset (denoted by the "Measure Features"). This dataset calculated the mean value of each of this subset dataset by Subject and Activity (denoted by Activity Label).