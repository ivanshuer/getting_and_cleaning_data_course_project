# Read data 
features <- read.table("./features.txt", stringsAsFactors = FALSE)
activities <- read.table("./activity_labels.txt", stringsAsFactors = FALSE)
colnames(activities) <- c("ID", "activities")

train_data <- read.table("./train/X_train.txt")
train_subject <- read.table("./train/subject_train.txt")
train_activities <- read.table("./train/y_train.txt")

test_data <- read.table("./test/X_test.txt")
test_subject <- read.table("./test/subject_test.txt")
test_activities <- read.table("./test/y_test.txt")

# Merges the training and the test sets to create one data set
colnames(train_data) <- c(features[, 2])
colnames(test_data) <- c(features[, 2])
whole_data <- rbind(train_data, test_data)

# Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_indx <- grep(c("mean\\(\\)|std\\(\\)"), features[, 2])
mean_std_data <- whole_data[, mean_std_indx]

# Uses descriptive activity names to name the activities in the data set
whole_activities <- rbind(train_activities, test_activities)
colnames(whole_activities) <- c("ID")
whole_activities <- merge(whole_activities, activities, by = "ID", sort = FALSE)

mean_std_data <- cbind(mean_std_data, whole_activities$activities, stringsAsFactors = FALSE)

# Appropriately labels the data set with descriptive variable names
colnames(mean_std_data)[length(colnames(mean_std_data))] <- "activities"

# Creates a second, independent tidy data set with the average of each variable for 
# each activity and each subject
whole_subject <- rbind(train_subject, test_subject)
colnames(whole_subject) <- c("subject")
whole_data <- cbind(whole_data, whole_subject, whole_activities$ID, stringsAsFactors = FALSE)
colnames(whole_data)[length(colnames(whole_data))] <- "activities"

library("plyr")
mean_sub_act <- ddply(whole_data, .(subject, activities), colMeans)
write.table(mean_sub_act, "mean_sub_act.csv", sep = ",", row.names = FALSE)
