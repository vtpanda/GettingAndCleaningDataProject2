library(dplyr)

activity_labels <- read.table("activity_labels.txt", header=FALSE, sep=" ", col.names=c("activity.id", "Activity.Label"))
features <- read.table("features.txt", header=FALSE, sep=" ", col.names=c("feature.id", "feature.name"))
features$feature.better<- make.names(features$feature.name, unique=TRUE)

subject_test <- read.table("test/subject_test.txt", header=FALSE, sep=" ", col.names=c("subject.id"))
x_test <- read.table("test/x_test.txt", header=FALSE, col.names=features$feature.better)
y_test <- read.table("test/y_test.txt", header=FALSE, sep=" ", col.names=c("activity.id"))

x_test$Subject.Id <- subject_test$subject.id
x_test$activity.id = y_test$activity.id
x_test$DataSetType <- "Test Data Set"
x_test <- merge(x_test, activity_labels, by="activity.id")

x_test_updated <- select(x_test, matches("\\.mean\\.\\.|\\.std\\.\\."), DataSetType, Activity.Label, Subject.Id)



subject_train <- read.table("train/subject_train.txt", header=FALSE, sep=" ", col.names=c("subject.id"))
x_train <- read.table("train/x_train.txt", header=FALSE, col.names=features$feature.better)
y_train <- read.table("train/y_train.txt", header=FALSE, sep=" ", col.names=c("activity.id"))

x_train$Subject.Id <- subject_train$subject.id
x_train$activity.id = y_train$activity.id
x_train$DataSetType <- "Training Data Set"
x_train <- merge(x_train, activity_labels, by="activity.id")

x_train_updated <- select(x_train, matches("\\.mean\\.\\.|\\.std\\.\\."), DataSetType, Activity.Label, Subject.Id)

x_all_data<- union(x_test_updated, x_train_updated)

new_names <- gsub("mean\\.\\.", "mean", names(x_all_data))
new_names <- gsub("std\\.\\.", "std", new_names)

new_names <- gsub("tBodyAcc\\.", "BodyAccelerometer.", new_names)
new_names <- gsub("tGravityAcc\\.", "GravityAccelerometer.", new_names)
new_names <- gsub("tBodyAccJerk\\.", "BodyAccelerometerJerk.", new_names)
new_names <- gsub("tBodyGyro\\.", "BodyGyroscope.", new_names)
new_names <- gsub("tBodyGyroJerk\\.", "BodyGyroscopeJerk.", new_names)
new_names <- gsub("tBodyAccMag\\.", "BodyAccelerometerMagnitude.", new_names)
new_names <- gsub("tGravityAccMag\\.", "GravityAccelerometerMagnitude.", new_names)
new_names <- gsub("tBodyAccJerkMag\\.", "BodyAccelerometerJerkMagnitude.", new_names)
new_names <- gsub("tBodyGyroMag\\.", "BodyGyroscopeMagnitude.", new_names)
new_names <- gsub("tBodyGyroJerkMag\\.", "BodyGyroscopeJerkMagnitude.", new_names)


new_names <- gsub("fBodyAcc\\.", "BodyAccelerometerFFT.", new_names)
new_names <- gsub("fGravityAcc\\.", "GravityAccelerometerFFT.", new_names)
new_names <- gsub("fBodyAccJerk\\.", "BodyAccelerometerJerkFFT.", new_names)
new_names <- gsub("fBodyGyro\\.", "BodyGyroscopeFFT.", new_names)
new_names <- gsub("fBodyGyroJerk\\.", "BodyGyroscopeJerkFFT.", new_names)
new_names <- gsub("fBodyAccMag\\.", "BodyAccelerometerMagnitudeFFT.", new_names)
new_names <- gsub("fGravityAccMag\\.", "GravityAccelerometerMagnitudeFFT.", new_names)
new_names <- gsub("fBodyBodyAccJerkMag\\.", "BodyAccelerometerJerkMagnitudeFFT.", new_names)
new_names <- gsub("fBodyBodyGyroMag\\.", "BodyGyroscopeMagnitudeFFT.", new_names)
new_names <- gsub("fBodyBodyGyroJerkMag\\.", "BodyGyroscopeJerkMagnitudeFFT.", new_names)
names(x_all_data) <- new_names

x_summarize_data <- x_all_data %>% select(-DataSetType) %>% group_by(Subject.Id, Activity.Label) %>% summarise_each(funs(mean))


write.table(x_summarize_data, "SummarizedData.txt", row.names = FALSE)


  