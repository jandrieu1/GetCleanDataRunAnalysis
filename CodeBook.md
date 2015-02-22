## Course Project Codebook

Note: the variables underpinning this project's dataset are described in full detail in the dataset's "features.txt" file, which can be seen once the dataset is downloaded to the working directory (see README.md).

The origianl dataset included a variety of summary statistics. The dataset prepared for this project is a subset of the original dataset; it extracted only variables calculating the Mean and Standard Deviation of the original dataset (denoted by the "Measure Features") and then calculated the average of each variable for each activity and each subject.

This dataset includes 180 observations across 68 variables. Out of the 68 variables, 66 are measures derived from the original dataset; their naming convention was simplified from the original version for the purposes of the Coursera Course Project. This simplified syntax includes (units have been normalized):

* Prefix (first letter): t=Time or f=Frequency Domain Signals
* Acceleration signals (see second and third letter(s)): B=Body; BB=BodyBody; G=Gravity
* Additional features: Acc=Accelerometer; Gyro=Gyroscope; Jerk=Jerk; Mag=Magnitude
* Estimation type: M=Mean value; S=Standard Deviation
* Suffix: .X, .Y, and .Z denote 3-axial signals in the X, Y, and Z directions

The two non-measure variables include "Subject" and "Activity Label" as seen below:
* Subject: denotes subject performing activities (30 volunteers ages 19-48)
* ActivityLabel: denotes type of activity performed by each subject  (1-6)
  - 1 WALKING
  - 2 WALKING_UPSTAIRS
  - 3 WALKING_DOWNSTAIRS
  - 4 SITTING
  - 5 STANDING
  - 6 LAYING

The 68 variables and their index can be seen below:

 [1] "Subject"        
 [2] "ActivityLabel"  
 [3] "tBAccM.X"       
 [4] "tBAccM.Y"       
 [5] "tBAccM.Z"       
 [6] "tBAccS.X"       
 [7] "tBAccS.Y"       
 [8] "tBAccS.Z"       
 [9] "tGAccM.X"       
[10] "tGAccM.Y"       
[11] "tGAccM.Z"       
[12] "tGAccS.X"       
[13] "tGAccS.Y"       
[14] "tGAccS.Z"       
[15] "tBAccJerkM.X"   
[16] "tBAccJerkM.Y"   
[17] "tBAccJerkM.Z"   
[18] "tBAccJerkS.X"   
[19] "tBAccJerkS.Y"   
[20] "tBAccJerkS.Z"   
[21] "tBGyroM.X"      
[22] "tBGyroM.Y"      
[23] "tBGyroM.Z"      
[24] "tBGyroS.X"      
[25] "tBGyroS.Y"      
[26] "tBGyroS.Z"      
[27] "tBGyroJerkM.X"  
[28] "tBGyroJerkM.Y"  
[29] "tBGyroJerkM.Z"  
[30] "tBGyroJerkS.X"  
[31] "tBGyroJerkS.Y"  
[32] "tBGyroJerkS.Z"  
[33] "tBAccMagM"      
[34] "tBAccMagS"      
[35] "tGAccMagM"      
[36] "tGAccMagS"      
[37] "tBAccJerkMagM"  
[38] "tBAccJerkMagS"  
[39] "tBGyroMagM"     
[40] "tBGyroMagS"     
[41] "tBGyroJerkMagM" 
[42] "tBGyroJerkMagS" 
[43] "fBAccM.X"       
[44] "fBAccM.Y"       
[45] "fBAccM.Z"       
[46] "fBAccS.X"       
[47] "fBAccS.Y"       
[48] "fBAccS.Z"       
[49] "fBAccJerkM.X"   
[50] "fBAccJerkM.Y"   
[51] "fBAccJerkM.Z"   
[52] "fBAccJerkS.X"   
[53] "fBAccJerkS.Y"   
[54] "fBAccJerkS.Z"   
[55] "fBGyroM.X"      
[56] "fBGyroM.Y"      
[57] "fBGyroM.Z"      
[58] "fBGyroS.X"      
[59] "fBGyroS.Y"      
[60] "fBGyroS.Z"      
[61] "fBAccMagM"      
[62] "fBAccMagS"      
[63] "fBBAccJerkMagM" 
[64] "fBBAccJerkMagS" 
[65] "fBBGyroMagM"    
[66] "fBBGyroMagS"    
[67] "fBBGyroJerkMagM"
[68] "fBBGyroJerkMagS"
