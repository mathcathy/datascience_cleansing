datascience_cleansing
=====================
How the code works:

Lines 1 - 3: inititialise required libraries
Line 4: read titles for variables from features text file
Line 5: read main training data set from text file
Line 6: assign variable titles to main training data set
Line 7: create vector to mark each row in training data set as "Training"
Line 8: give this vector the title "Group"
Line 9: read the subject numbers from the training group subject text file
Line 10: give this subject data frame the title "Subject"
Line 11: read the activity numbers from the training group activity text file
Line 12: name this activity data frame "Exercise"
Line 13: bind the four separate data frames together in order - Group, Subject, Exercise, Main
Lines 14 - 18: repeat the above for the test text files, assigning the "Group" vector to "Test" and not needing to assign titles
Line 19: now give the test data set the same names for its columns as the training data set
Line 20: bind the training and test sets together
Line 21: remove all the pieces, keeping just the final amalgamated data set
Line 22-23: filter the data set so that all that remains are the categorical variables and those which represent mean and st dev
Line 24: take the activity column into a separate data frame
Line 25: read the activity names into a new data frame
Line 26: replace the "Exercise" column in the filtered data set with the activity names instead of numbers
Line 27: read in updated titles of means and stdevs with text file in working directory (also attached to this repo)
Line 28: update titles to filtered data frame
Line 29: use the "melt" method of reshape library to tell R which variables in the filtered data set are categorical
Line 30: now "cast" the melted data with the categorical variables "Subject" and "Exercise" to get the mean for each variable and each aubject / exercise combination
Line 31: remove all unnecessary data
Line 32: write the tidied data to a file

