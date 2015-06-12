library(dplyr)
library(tidyr)

## read the colunms names into a vector
colname_df<-read.table("features.txt")  ##read the colunms names into a data framce
colname<-colname_df[,2]                 ## copy the colunms names into a vector.

## read the train data into a data frame
train_df<-read.table(".//train/X_train.txt")

## buid the train data

## read the activities data into a data frame
train_activity_df<-read.table(".//train/y_train.txt")

## appeand the activities data to the train data framce
train_df<-cbind(train_df,train_activity_df)

## read the ID's data into a data frame
train_id_df<-read.table(".//train/subject_train.txt")

## appeand the ID's data to the train data framce
train_df<-cbind(train_df,train_id_df)

## set the names of the varibailes of the data frame
names(train_df)=c(as.character(colname),"ActivityID","SubjectID")

## buid the test data. Same logic as for building the train data

## read the test data into a data frame
test_df<-read.table(".//test/X_test.txt")

## read the activities data into a data frame
test_activity_df<-read.table(".//test/y_test.txt")

## appeand the activities data to the test data framce
test_df<-cbind(test_df,test_activity_df)

## read the ID's data into a data frame
test_id_df<-read.table(".//test/subject_test.txt")

## appeand the ID's data to the test data framce
test_df<-cbind(test_df,test_id_df)

## set the names of the varibailes of the data frame
names(test_df)=c(as.character(colname),"ActivityID","SubjectID")


##merge the train and test data.
all_data<-rbind(train_df,test_df)
## at this point we did step 1 and 4 of the assignment.


## read the Acvtivity legand data
activity_label_df<-read.table("activity_labels.txt",col.names = c("ActivityID","ActivityName"))

#merge the Acvtivity name to the data frame (step 3)
#meage will be based on ActivityID that exits in the two data frames
all_data<-merge(all_data[1:563],activity_label_df)

## select colunms that have mean or standard deviation  (step2). 
## Also will select the ActivityID and SubjectID that will be needed in step 5
ans_df<-select(all_data,matches("-std()|-mean()|ActivityName|SubjectID"))

## calcualte the mean after group by ActivityName and SubjectID
ans_grouped<-group_by(ans_df,ActivityName,SubjectID) %>% summarise_each(funs(mean))

## convert to long form

tidy <-gather(ans_grouped,MeasreName,avg,-one_of("ActivityName","SubjectID"))

write.table(tidy,file = "tidy.txt",row.name=FALSE)
