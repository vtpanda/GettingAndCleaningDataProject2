# Code Book

The following steps were taken in the R script to produce the output file:

1. The activity labels were read from the activity_labels.txt file.
1. The column headers for the test and training data were read from the features.txt file.
1. The make.names function (with unique=TRUE) was used to make good column headers from the column headers previously read in.
1. The test subject id's were read from the test/subject_test.txt file.
1. The test data was read from the test/subject_test.txt file using the column headers previously read in.
1. The test activity id's were read from the test/y_test.txt file.
1. The test subject id's were added to the test data.
1. The test activity id's were added to the test data.
1. A DataSetType field was added to the test data with the value of "Test Data Set".
1. The test data was merged with the activity label data based on the activity id's.
1. A new data set was created from the test data with just the mean and standard deviation fields, along with the DataSetType, Activity Labels, and Subject Id's.
1. The training subject id's were read from the train/subject_train.txt file.
1. The training data was read from the training/subject_training.txt file using the column headers previously read in.
1. The training activity id's were read from the training/y_training.txt file.
1. The training subject id's were added to the training data.
1. The training activity id's were added to the training data.
1. A DataSetType field was added to the training data with the value of "Training Data Set".
1. The training data was merged with the activity label data based on the activity id's.
1. A new data set was created from the training data with just the mean and standard deviation fields, along with the DataSetType, Activity Labels, and Subject Id's.
1. A consolidated data set was created combining the test and training data.
1. The column names were improved to make them more readable.
1. A new file was created by summarizing all of the number data, using the sum function, grouped on Subject Id and Activity Label.

The following fields are available:
- Subject.Id - no transformation
- Activity.Label - no transformation
- BodyAccelerometer.mean.[XYZ] and BodyAccelerometer.std.[XYZ] - summed values of tBodyAcc-XYZ
- GravityAccelerometer.mean.[XYZ] and GravityAccelerometer.std.[XYZ] - summed values of tGravityAcc-XYZ
- BodyAccelerometerJerk.mean.[XYZ] and BodyAccelerometerJerk.std.[XYZ] - summed values of tBodyAccJerk-XYZ
- BodyGyroscope.mean.[XYZ] and BodyGyroscope.std.[XYZ] - summed values of tBodyGyro-XYZ
- BodyGyroscopeJerk.mean.[XYZ] and BodyGyroscopeJerk.std.[XYZ] - summed values of tBodyGyroJerk-XYZ
- BodyAccelerometerMagnitude.mean and BodyAccelerometerMagnitude.std - summed values of tBodyAccMag
- GravityAccelerometerMagnitude.mean and GravityAccelerometerMagnitude.std - summed values of tGravityAccMag
- BodyAccelerometerJerkMagnitude.mean and BodyAccelerometerJerkMagnitude.std - summed values of tBodyAccJerkMag
- BodyGyroscopeMagnitude.mean and BodyGyroscopeMagnitude.std - summed values of tBodyGyroMag
- BodyGyroscopeJerkMagnitude.mean and BodyGyroscopeJerkMagnitude.std - summed values of tBodyGyroJerkMag
- BodyAccelerometerFFT.mean.[XYZ] and BodyAccelerometerFFT.std.[XYZ] - summed values of fBodyAcc-XYZ
- GravityAccelerometerFFT.mean.[XYZ] and GravityAccelerometerFFT.std.[XYZ] - summed values of fGravityAcc-XYZ
- BodyAccelerometerJerkFFT.mean.[XYZ] and BodyAccelerometerJerkFFT.std.[XYZ] - summed values of fBodyAccJerk-XYZ
- BodyGyroscopeFFT.mean.[XYZ] and BodyGyroscopeFFT.std.[XYZ] - summed values of fBodyGyro-XYZ
- BodyGyroscopeJerkFFT.mean.[XYZ] and BodyGyroscopeJerkFFT.std.[XYZ] - summed values of fBodyGyroJerk-XYZ
- BodyAccelerometerMagnitudeFFT.mean and BodyAccelerometerMagnitudeFFT.std - summed values of fBodyAccMag
- BodyAccelerometerJerkMagnitudeFFT.mean and BodyAccelerometerJerkMagnitudeFFT.std - summed values of fBodyAccJerkMag
- BodyGyroscopeMagnitudeFFT.mean and BodyGyroscopeMagnitudeFFT.std - summed values of fBodyGyroMag
- BodyGyroscopeJerkMagnitudeFFT.mean and BodyGyroscopeJerkMagnitudeFFT.std - summed values of fBodyGyroJerkMag

