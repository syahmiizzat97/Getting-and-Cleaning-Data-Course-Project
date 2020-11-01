# Author: Syahmi Izzat Salleh
# R Class Project

# Upload Data to R

setwd("/Users/Syahmi/Documents/R Class/UCI HAR Dataset")
activity_label<-read.table("activity_labels.txt")
features<-read.table("features.txt")

setwd("/Users/Syahmi/Documents/R Class/UCI HAR Dataset/test")
X_test<-read.table("X_test.txt")
subject_test<-read.table("subject_test.txt")
ytest<-read.table("y_test.txt")

setwd("/Users/Syahmi/Documents/R Class/UCI HAR Dataset/train")
X_train<-read.table("X_train.txt")
subject_train<-read.table("subject_train.txt")
ytrain<-read.table("y_train.txt")

# Merge all observations and variables
data<-rbind(X_test,X_train)
subject<-rbind(subject_test,subject_train)
variables<-rbind(ytest,ytrain)

#Labeling subject and variable on data
data<-cbind(subject,variables,data)
label<-c(c("Subject","Activity"),features$V2)
names(data)<-label

# Merged Data Set
View(data)

# Extract mean() and std() for each measurement
library("dplyr")
pos<-grep("mean()|std()",label)
data<-select(data,c(1,2),pos)

# Changing activity to descriptive name
activity_factor<-factor(data$Activity)
levels(activity_factor)<-activity_label$V2
data$Activity<-activity_factor

# Appropriately labels the data set with descriptive variable names
label<-gsub("[()]","",label)
names(data)<-label[c(1,2,pos)]

# creates a second, independent tidy data set with the average of each variable for each activity and each subject
library("reshape2")
melt<-melt(data,id.vars=c(1,2),measure.vars=3:81)
newdata<-dcast(melt,Subject + Activity~variable,mean)
View(newdata)

# print out data to txt
write.table(newdata, "tidy_data.txt", sep = ",")
