# Getting-and-Cleaning-Data-Course-Project
Steps:
  1. The code starts with downloading usingn the URL provided and unzipping. 
  2. Then we read the following downloaded files: x_train, y_train, subject_train, x_text, y_text, subject_test, features, activity_labels. 
  3. We know that x_train and x_text contains the observations, y_text and y_train the activities, subject_train and subject_test the subjects, and features (the column names). Now we need to merge all and label the observations.
  4. We continue by making a subset of columns where we want the activity, the subject and those columns which start with mean and std. 
  5. We merge the activity description. 
  6. Lastly, we need to group by subject and activity and find the mean of those columns. 
