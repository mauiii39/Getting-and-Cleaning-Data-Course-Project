library(dplyr)

#Download
setwd("C:/Users/Mau/Google Drive/Programming/Coursera/Getting and Cleaning Data/Week 4")
if(!file.exists("./data")){dir.create("./data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/data.zip")

# Unzip
unzip(zipfile = "./data/data.zip", exdir = "./data")

# 1. Merging the training and the test sets to create one data set.

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
activity_Labels = read.table("./data/UCI HAR Dataset/activity_labels.txt")


colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]

colnames(y_train) <- "activity"
colnames(y_test) <- "activity"

colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"

colnames(activity_Labels) <- c("activity", "description")

training <- cbind(y_train, subject_train, x_train)
test <- cbind(y_test, subject_test, x_test)
all <- rbind(training, test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

column_names <- colnames(all)

column_names_subset <- (grepl("activity", column_names) |
                   grepl("subject", column_names) |
                   grepl("mean..", column_names) |
                   grepl("std...", column_names))

all_subset <- all[ , column_names_subset]

# 3. Uses descriptive activity names to name the activities in the data set
merge_activity <- merge(all_subset, activity_Labels,
                              by = "activity",
                              all.x = TRUE)

# 4. Appropriately label the data set with descriptive variable names. 
# There were all ready labeled in steps before. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data_set <- tbl_df(merge_activity)
tidy_data_set <- group_by(tidy_data_set,subject,activity)
tidy_data_set_summary <- summarise_all(tidy_data_set,.funs = c(mean="mean"))
write.table(tidy_data_set_summary, "tidy_data_set.txt")

