==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

# Experimental design

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# Data

## For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

# Data processing

The data was processed to obtain values of features expressing mean or standard deviation, averaged over all possible subject/activity pairs, in pooled training and test data. The results were recorded in the 'tidy_data.txt' file.

Data was read from the 'train/X_train.txt' file to obtain a 7352x561 table. Columns were labeled with features from 'features.txt'. Data from 'train/subject_train.txt' and 'train/y_train.txt' were added as the 1st and 2nd column and labeled as 'subject' and 'activity', respectively, to obtain a 7352x563 table (not including the headers).

The analogous procedure was performed for the test files, to obtain a 2947x563 table. The train and test tables were bound by rows with the train one being the upper one. This lead to a 10299x563 table (not including the headers).

The table was subset by choosing the columns representing features with mean() or std() in the name, to produce a 10299x68 table (not including the headers). The order of the columns was preserved. Numbers indicating activities in the 2nd column were substituted with activity names using the key obtained from 'activity_labels.txt'.

The rows were grouped by all possible subject/activity pairs and mean value of each feature for each group was calculated. This produced a 180x68 table, which was stored in 'tidy_data.txt'.

## Variable description

The variables stored in 'tidy_data.txt' are as follows:

subject - the id of the person tested

activity - the name of the activity performed by the person

All the following variables are dimensionless, since features were normalised:

tBodyAcc-mean()-X - mean value of the body acceleration on the x axis of the phone, averaged over subject/activity pairs

tBodyAcc-mean()-Y - mean value of the body acceleration on the y axis of the phone, averaged over subject/activity pairs

tBodyAcc-mean()-Z - mean value of the body acceleration on the z axis of the phone, averaged over subject/activity pairs

tBodyAcc-std()-X - standard deviation of the body acceleration on the x axis of the phone, averaged over subject/activity pairs

tBodyAcc-std()-Y - standard deviation of the body acceleration on the y axis of the phone, averaged over subject/activity pairs

tBodyAcc-std()-Z - standard deviation of the body acceleration on the z axis of the phone, averaged over subject/activity pairs

tGravityAcc-mean()-X - mean value of the gravity acceleration on the x axis of the phone, averaged over subject/activity pairs

tGravityAcc-mean()-Y - mean value of the gravity acceleration on the y axis of the phone, averaged over subject/activity pairs

tGravityAcc-mean()-Z - mean value of the gravity acceleration on the z axis of the phone, averaged over subject/activity pairs

tGravityAcc-std()-X - standard deviation of the gravity acceleration on the x axis of the phone, averaged over subject/activity pairs

tGravityAcc-std()-Y - standard deviation of the gravity acceleration on the y axis of the phone, averaged over subject/activity pairs

tGravityAcc-std()-Z - standard deviation of the gravity acceleration on the z axis of the phone, averaged over subject/activity pairs

tBodyAccJerk-mean()-X - mean value of the body jerk on the x axis of the phone, averaged over subject/activity pairs

tBodyAccJerk-mean()-Y - mean value of the body jerk on the y axis of the phone, averaged over subject/activity pairs

tBodyAccJerk-mean()-Z - mean value of the body jerk on the z axis of the phone, averaged over subject/activity pairs

tBodyAccJerk-std()-X - standard deviation of the body jerk on the x axis of the phone, averaged over subject/activity pairs

tBodyAccJerk-std()-Y - standard deviation of the body jerk on the y axis of the phone, averaged over subject/activity pairs

tBodyAccJerk-std()-Z - standard deviation of the body jerk on the z axis of the phone, averaged over subject/activity pairs

tBodyGyro-mean()-X - mean value of the body angular velocityon the x axis of the phone, averaged over subject/activity pairs

tBodyGyro-mean()-Y - mean value of the body angular velocity on the y axis of the phone, averaged over subject/activity pairs

tBodyGyro-mean()-Z - mean value of the body angular velocity on the z axis of the phone, averaged over subject/activity pairs

tBodyGyro-std()-X - standard deviation of the body angular velocity on the x axis of the phone, averaged over subject/activity pairs

tBodyGyro-std()-Y - standard deviation of the body angular velocity on the y axis of the phone, averaged over subject/activity pairs

tBodyGyro-std()-Z - standard deviation of the body angular velocity on the z axis of the phone, averaged over subject/activity pairs

tBodyGyroJerk-mean()-X - mean value of the body angular jerk on the x axis of the phone, averaged over subject/activity pairs

tBodyGyroJerk-mean()-Y - mean value of the body angular jerk on the y axis of the phone, averaged over subject/activity pairs

tBodyGyroJerk-mean()-Z - mean value of the body angular jerk on the z axis of the phone, averaged over subject/activity pairs

tBodyGyroJerk-std()-X - standard deviation of the body angular jerk on the x axis of the phone, averaged over subject/activity pairs

tBodyGyroJerk-std()-Y - standard deviation of the body angular jerk on the y axis of the phone, averaged over subject/activity pairs

tBodyGyroJerk-std()-Z - standard deviation of the body angular jerk on the z axis of the phone, averaged over subject/activity pairs

tBodyAccMag-mean() - mean value of the body acceleration magnitude, averaged over subject/activity pairs

tBodyAccMag-std() - standard deviation of the body acceleration magnitude, averaged over subject/activity pairs

tGravityAccMag-mean() - mean value of the gravity acceleration magnitude, averaged over subject/activity pairs

tGravityAccMag-std() - standard deviation of the gravity acceleration magnitude, averaged over subject/activity pairs

tBodyAccJerkMag-mean() - mean value of the body jerk magnitude, averaged over subject/activity pairs

tBodyAccJerkMag-std() - standard deviation of the body jerk magnitude, averaged over subject/activity pairs

tBodyGyroMag-mean() - mean value of the body angular velocity magnitude, averaged over subject/activity pairs

tBodyGyroMag-std() - standard deviation of the body angular velocity magnitude, averaged over subject/activity pairs

tBodyGyroJerkMag-mean() - mean value of the body angular jerk magnitude, averaged over subject/activity pairs

tBodyGyroJerkMag-std() - standard deviation of the body angular jerk magnitude, averaged over subject/activity pairs

fBodyAcc-mean()-X - mean value of the frequency domain signals of the body acceleration on the x axis of the phone, averaged over subject/activity pairs

fBodyAcc-mean()-Y - mean value of the frequency domain signals of the body acceleration on the y axis of the phone, averaged over subject/activity pairs

fBodyAcc-mean()-Z - mean value of the frequency domain signals of the body acceleration on the z axis of the phone, averaged over subject/activity pairs

fBodyAcc-std()-X - standard deviation of the frequency domain signals of the body acceleration on the x axis of the phone, averaged over subject/activity pairs

fBodyAcc-std()-Y - standard deviation of the frequency domain signals of the body acceleration on the y axis of the phone, averaged over subject/activity pairs

fBodyAcc-std()-Z - standard deviation of the frequency domain signals of the body acceleration on the z axis of the phone, averaged over subject/activity pairs

fBodyAccJerk-mean()-X - mean value of the frequency domain signals of the body jerk on the x axis of the phone, averaged over subject/activity pairs

fBodyAccJerk-mean()-Y - mean value of the frequency domain signals of the body jerk on the y axis of the phone, averaged over subject/activity pairs

fBodyAccJerk-mean()-Z - mean value of the frequency domain signals of the body jerk on the z axis of the phone, averaged over subject/activity pairs

fBodyAccJerk-std()-X - standard deviation of the frequency domain signals of the body jerk on the x axis of the phone, averaged over subject/activity pairs

fBodyAccJerk-std()-Y - standard deviation of the frequency domain signals of the body jerk on the y axis of the phone, averaged over subject/activity pairs

fBodyAccJerk-std()-Z - standard deviation of the frequency domain signals of the body jerk on the z axis of the phone, averaged over subject/activity pairs

fBodyGyro-mean()-X - mean value of the frequency domain signals of the body angular velocity on the x axis of the phone, averaged over subject/activity pairs

fBodyGyro-mean()-Y - mean value of the frequency domain signals of the body angular velocity on the y axis of the phone, averaged over subject/activity pairs

fBodyGyro-mean()-Z - mean value of the frequency domain signals of the body angular velocity on the z axis of the phone, averaged over subject/activity pairs

fBodyGyro-std()-X - standard deviation of the frequency domain signals of the body angular velocity on the x axis of the phone, averaged over subject/activity pairs

fBodyGyro-std()-Y - standard deviation of the frequency domain signals of the body angular velocity on the y axis of the phone, averaged over subject/activity pairs

fBodyGyro-std()-Z - standard deviation of the frequency domain signals of the body angular velocity on the z axis of the phone, averaged over subject/activity pairs

fBodyAccMag-mean() - mean value of the frequency domain signals of the body acceleration magnitude, averaged over subject/activity pairs

fBodyAccMag-std() - standard deviation of the frequency domain signals of the body acceleration magnitude, averaged over subject/activity pairs

fBodyBodyAccJerkMag-mean() - mean value of the frequency domain signals of the body jerk magnitude, averaged over subject/activity pairs

fBodyBodyAccJerkMag-std() - standard deviation of the frequency domain signals of the body jerk magnitude, averaged over subject/activity pairs

fBodyBodyGyroMag-mean() - mean value of the frequency domain signals of the body angular velocity magnitude, averaged over subject/activity pairs

fBodyBodyGyroMag-std() - standard deviation of the frequency domain signals of the body angular velocity magnitude, averaged over subject/activity pairs

fBodyBodyGyroJerkMag-mean() - mean value of the frequency domain signals of the body angular jerk magnitude, averaged over subject/activity pairs

fBodyBodyGyroJerkMag-std() - standard deviation of the frequency domain signals of the body angular jerk magnitude, averaged over subject/activity pairs

# License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
