colname_df<-read.table("features.txt")
colname<-colname_df[,2]

train_df<-read.table(".//train/X_train.txt")

train_activity_df<-read.table(".//train/y_train.txt")

train_df<-cbind(train_df,train_activity_df)

train_id_df<-read.table(".//train/subject_train.txt")

train_df<-cbind(train_df,train_id_df)

names(train_df)=c(as.character(colname),"Activity","ID")


test_df<-read.table(".//test/X_test.txt")

test_activity_df<-read.table(".//test/y_test.txt")

test_df<-cbind(test_df,test_activity_df)

test_id_df<-read.table(".//test/subject_test.txt")

test_df<-cbind(test_df,test_id_df)

names(test_df)=c(as.character(colname),"Activity","ID")

all<-rbind(train_df,test_df)

