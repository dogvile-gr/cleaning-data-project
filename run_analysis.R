##########################################################################################################
## Coursera Getting and Cleaning Data Course Project
## dogvile
## 20/12/1014
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##########################################################################################################
# Clean up workspace
rm(list=ls())
#set working directory to the location where the UCI HAR Dataset was unzipped
# setwd('/Users/3d_teo/datasciencecoursera/datasciencecoursera/UCI/');
# Read in the data from files


install.packages("reshape2")#install required library
install.packages("plyr")#install required library
library(plyr)#install required library
library(reshape2)#install required library
features = read.table('UCI/features.txt',header=FALSE); #imports features.txt
subject_train = read.table('UCI/train/subject_train.txt',header=FALSE); #imports subject_train.txt
x_train = read.table('UCI/train/x_train.txt',header=FALSE); #imports x_train.txt
y_train = read.table('UCI/train/y_train.txt',header=FALSE); #imports y_train.txt

subject_test = read.table('UCI/test/subject_test.txt',header=FALSE); #imports subject_test.txt
x_test = read.table('UCI/test/x_test.txt',header=FALSE); #imports x_test.txt
y_test = read.table('UCI/test/y_test.txt',header=FALSE); #imports y_test.txt
<<<<<<< HEAD

=======
>>>>>>> origin/master

colnames(subject_train) = "subject"; #add column name 'subject'
colnames(y_train) = "activity"; #add column name 'áøôéùéôõ'
colnames(x_train) = features[,2]; #add column names from the second column of table 'features' (file features.txt)

<<<<<<< HEAD
=======
colnames(subject_train) = "subject"; #add column name 'subject'
colnames(y_train) = "activity"; #add column name 'Î±ÏˆÏ„Î¹Ï‰Î¹Ï„Ï…'
colnames(x_train) = features[,2]; #add column names from the second column of table 'features' (file features.txt)
>>>>>>> origin/master

colnames(subject_test) = "subject"; #add column name 'subject'
colnames(y_test) = "activity"; #add column name 'activity'
colnames(x_test) = features[,2];#add column name from the second column of table 'features' (file features.txt)

<<<<<<< HEAD
train <- cbind(subject_train,y_train,x_train)#Merging by column ids (subject,activity) and measured variables
test <- cbind(subject_test,y_test,x_test)#Merging by column ids (subject,activity) and measured variables

=======
colnames(subject_test) = "subject"; #add column name 'subject'
colnames(y_test) = "activity"; #add column name 'activity'
colnames(x_test) = features[,2];#add column name from the second column of table 'features' (file features.txt)

train <- cbind(subject_train,y_train,x_train)#Merging by column ids (subject,activity) and measured variables
test <- cbind(subject_test,y_test,x_test)#Merging by column ids (subject,activity) and measured variables

>>>>>>> origin/master
# 1. Merge the training and the test sets to create one data set.
alldata <- rbind(train,test)# Merging by row train and datatest



#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
g <- grep("-(mean|std)\\(\\)",names(train))#returns a vector of the indices of the elements of mean or std that yielded a match
extracted_data <- cbind(alldata[,1:2],alldata[ , g])#Based on the vector g, extracts only the measurements on the mean and standard deviation for each measurement. 

activity_labels = read.table('UCI/activity_labels.txt',header=FALSE); #imports features.txt



#3.Uses descriptive activity names to name the activities in the data set
#Perfoming replacement of pair matching of two columns of activity labels in a loop
for (i in 1:6){        
        extracted_data$activity <- gsub(activity_labels[i,1], activity_labels[i,2], extracted_data$activity)
        }
<<<<<<< HEAD

## Step 4 - Appropriately labels the data set with descriptive variable names.
## Column labels were added above


=======
>>>>>>> origin/master
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# melt the data in id variables and measured variables for easy casting 
tidy_data <- melt(extracted_data, id=c("subject","activity"),measure.vars=names(extracted_data[3:68]))
tidy_means <- dcast(tidy_data, subject+activity ~ variable,mean)






write.table(tidy_means, file = "tidy.txt",row.name=FALSE)
