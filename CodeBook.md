library(dplyr)
fileurl - URL to download the zip

*All of the following are variables to store the downloaded files that exactly match the file name.
x_train
y_train 
subject_train 
x_test
y_test 
subject_test 
features
activity_Labels 


training - use for binding training data
test - use for binding test data
all - use for merging test and training data

column_names - use for storing the column names

column_names_subset - use for selecting the column names we are interested

all_subset - use for subsetting

merge_activity - use for merging activity description

tidy_data_set - use for converting merge_activity into a table and grouping
tidy_data_set_summary - summarizes tidy_data_set


