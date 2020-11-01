Code Book
==========



## 1. Read data and Merge
The raw data:
* subject_test : subject identification for test
* subject_train  : subject identification for train
* X_test : 561 column  of variables in test
* X_train : 561 column  of variables in train
* y_test : activity perform by subject written in number for test
* y_train : activity perform by subject written in number for train
* activity_labels : the name of activity written for y_test and y_train
* features : the name of 561 variables used in X_test and X_train

combine X_test and X_train using rbind to get a merged data as requested by the question


## 2. Extract only mean() and std()
Using function grep find the word "mean()" or "std()" in the features data.
Then, using the result from the grep function to only select variable with mean and standard deviation

## 3. Changing the activity to descriptive name
use factor function on the activity column of the data set and store it to holding variable
then use level funtion with the holding variable and substitute the activity_labels data to the function
finally substitute back the holding variable to the activity column of the data


## 4. Labeling the Data Column
sort out the only varible use from the result of function grep in question 2 from the features data
with this result use gsub funtion to remove parenthesis from the features name
finally using the function names(data) to subtitute the above result to the data to get label for its column

## 5. create new dataset
use "reshape library to melt the data with id of subject and activity
recast a new table using function dcast with a function mean in the argument
print out the data using write table function

