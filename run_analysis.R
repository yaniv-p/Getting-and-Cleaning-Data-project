library(dplyr)
library(tidyr)

# Read the descriptive variable names that describe the test and train data columns into a vector. 
# Will use that vector to name the resulting data frame with appropriately labels that are the needed descriptive variable names required in step 4 of the assignment
colname_df<-read.table("features.txt")  #read the columns  names into a data frame
colname<-colname_df[,2]                 # copy the columns names data into a vector.


#
# Build the train data
# no need to read the Inertial data since it doesnt contains data on mean or str that is needed per step 2
#

# read the train data into a data frame
train_df<-read.table(".//train/X_train.txt")

# read the activities(1..6) data into a data frame
train_activity_df<-read.table(".//train/y_train.txt")

# append the activities data to the train data frame
train_df<-cbind(train_df,train_activity_df)

# read the ID's(1..30) data into a data frame
train_id_df<-read.table(".//train/subject_train.txt")

# append the ID's data to the train data frame
train_df<-cbind(train_df,train_id_df)

# set the names of the variables of the data frame (step 4)
names(train_df)=c(as.character(colname),"ActivityID","SubjectID")

#
# Build the test data. Same logic as for building the train data
# no need to tead the Inertial data since it doesnt contains data mean or str that is needed per step 2
#

# read the test data into a data frame
test_df<-read.table(".//test/X_test.txt")

# read the activities data into a data frame
test_activity_df<-read.table(".//test/y_test.txt")

# append the activities data to the test data frame
test_df<-cbind(test_df,test_activity_df)

# read the ID's data into a data frame
test_id_df<-read.table(".//test/subject_test.txt")

# append the ID's data to the test data frame
test_df<-cbind(test_df,test_id_df)

# set the names of the variables of the data frame (step 4)
# set the name of the Activity ID column to "ActivityID", this column will be use for the merge function later in order to do step 3
names(test_df)=c(as.character(colname),"ActivityID","SubjectID")


#merge the train and test data.(step 1)
all_data<-rbind(train_df,test_df)

#
# At this point we did step 1 and 4 of the assignment.
#

# read the Activity legend data. Name the columns "ActivityID" and "ActivityName
# set the name of the Activity ID column to "ActivityID", this column will be use for the merge function later in order to do step 3
activity_label_df<-read.table("activity_labels.txt",col.names = c("ActivityID","ActivityName"))

# Merge the Activity name to the data frame (step 3)
# Merge will be based on ActivityID column that exits in the two data frames, and wll bring the ActivityName 
all_data<-merge(all_data[1:563],activity_label_df)

# Select columns that have mean or standard deviation (step 2).
# Will use the matches Select option that selects all variables whose name matches the regular expression.
# The regular expression passed will return columns that have "-std()" or "-mean()" or "ActivityName" or "SubjectID" in the column name
# Also will select the ActivityID and SubjectID that will be needed in step 5
ans_df<-select(all_data,matches("-std()|-mean()|ActivityName|SubjectID"))

# Calculate the mean after group by ActivityName and SubjectID
# Using the summarise_each function that applies the passed function to all the variables in the group by object passed to it
ans_grouped<-group_by(ans_df,ActivityName,SubjectID) %>% summarise_each(funs(mean))

# Convert to long form of Tify data set.
tidy <-gather(ans_grouped,MeasreName,avg,-one_of("ActivityName","SubjectID"))

#Write the tidy data set to a file.
write.table(tidy,file = "tidy.txt",row.name=FALSE)
