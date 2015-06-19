# Getting-and-Cleaning-Data-project

# Read the descriptive variable names that describe the test and train data columns into a vector. 
# Will use that vector to name the resulting data frame with appropriately labels that are the needed descriptive variable names required in step 4 of the assignment

# no need to read the Inertial data since it doesnt contains data on mean or str that is needed per step 2

# read the train data into a data frame
# read the activities(1..6) data into a data frame
# append the activities data to the train data frame using cbind
# read the ID's(1..30) data into a data frame
# append the ID's data to the train data frame using cbind
# set the names of the variables of the data frame (step 4) 

# Build the test data. Same logic as for building the train data

# set the name of the Activity ID column to "ActivityID", this column will be use for the merge function later in order to do step 3

# merge the train and test data using rbind.(step 1)


# At this point we did step 1 and 4 of the assignment.

# read the Activity legend data. Name the columns "ActivityID" and "ActivityName
# set the name of the Activity ID column to "ActivityID", this column will be use for the merge function later in order to do step 3


# Merge the Activity name to the data frame (step 3). 
# Merge will be based on ActivityID column that exits in the two data frames, and wll bring the ActivityName 

# Select columns that have mean or standard deviation (step 2).
# Will use the matches Select option that selects all variables whose name matches the regular expression.
# The regular expression passed will return columns that have "-std()" or "-mean()" or "ActivityName" or "SubjectID" in the column name
# Also will select the ActivityID and SubjectID that will be needed in step 5


# Calculate the mean after group by ActivityName and SubjectID
# Using the summarise_each function that applies the passed function to all the variables in the group by object passed to it

# Convert to long form of Tify data set bu usiong the gather funstion 

#Write the tidy data set to a file.