Files Included:

1. CodeBook.md - a code book that describes the variables, the data, and any transformations or work that has been performed to clean up the data.
2. README.md - The structures of the repo, all of the scripts work and how they are connected.
3. run_analysis.R -  The script performing the analysis.
4. mean_sub_act.csv - The tidy data set with the average of each variable for each activity and each subject.

Procedures Performed:

1. Read in all data from data files and save them into data frames.
2. Assign column names for all train data and test data with their corresponding features.
3. Merge train and test data together by rbind.
4. Subset only the measurements on the mean and standard deviation for each measurement.
5. Merge train and test activities data together by rbind.
6. Assign column name ID for the whole_activities data.
7. Merge the whole_activities data with activities data to give each activity their descriptive activity names.
8. Append the descriptive activity data to the extracted mean_std_data.
9. Assign "activities" column name to the activities column for mean_std_data.
10. Merge train and test subjects data together by rbind.
11. Assign column name "subject" for the whole_subject data.
12. Append subject and activities columns to the whole_data with proper column names.
13. Use ddply to apply colMeans function to calculate the average for all features measurement for each activity and each subject.