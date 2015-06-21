# Getting-and-Cleaning-Data-project


No need to read the Inertial data since it doesnt contains data on mean or std that is needed per step 2 of the assignment


First will read the descriptive variable names that describe the test and train data columns into a vector, 
Will use that vector to name the resulting data frame with appropriately labels that are the needed descriptive variable names required in step 4 of the assignment.


Main logic is:

For building the train data (and the same for the test data)
 1. read the train data into a data frame
 2. read the train  activities(1..6) data into a data frame
 3. append the activities data to the train data frame using cbind
 4. read the train ID's(1..30) data into a data frame
 5. append the ID's data to the train data frame using cbind
 6. Set the names of the variables of the data frame with the vector mentioed above (step 4 of the assignment) 
 7. Set the name of the Activity ID column to "ActivityID", this column will be use for the merge function later in order to do step 3 of the assignment

 8. Build the test data. Same logic as for building the train data above(point 1..7 above)

 9. merge the train and test data using rbind.(step 1 of the assignment)

At this point we did step 1 and 4 of the assignment.

 10. Now we will read the Activity legend data. we will name the columns "ActivityID" and "ActivityName.
We will set Activity ID column to "ActivityID" , same as the train+test column, beacuse this column will be use for the merge function later in order to do step 3 of the assignment

 11.  Merge the Activity name to the data frame (step 3 of the assignment), Merge will be based on ActivityID column that exits in the two data frames, and wll bring the ActivityName 

 12.  Select columns that have mean or standard deviation (step 2 of the assignment),Will use the matches Select option that selects all variables whose name matches a regular expression, The regular expression will return columns that have "-std()" or "-mean()" or "ActivityName" or "SubjectID" in the column name. We will select the ActivityID and SubjectID beacuse thay will be needed in step 5 of the assignment.
I have selected clounms that has '-mean()' and not ones that had 'mean' in order not to select the Angel measremnts that to me looks like are not required.

 13.  Calculate the mean after group by function on ActivityName and SubjectID,
Will use the summarise_each function that applies the passed function to all the variables in the group by object passed to it

 14.  Convert to long format of Tify data set by using the gather function.

 15.  Write the tidy data set to a file.
