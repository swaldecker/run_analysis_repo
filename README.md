# run_analysis_repo
materials for final project of "Getting and Cleaning Data"

Author: Seth Waldecker
Last Updated: 11/13/2016

## Overview
The purpose of this script is to create a tidy dataset containing the testing 
and training datasets from the Human Activity Recognition Using Smartphones Data Set,
which can be obtained from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Decompressing the .zip file generates a directory containing subdirectories called
"train" and "test". The script run_analysis.R generates the training and testing
datasets from files contained in these two directories. 

The script assumes that the name of the directory with the train and test subdirectories
is called UCI HAR Dataset, which is the name of directory that resulting when I 
decompressed the .zip file.

## Gathering data into a data frame
The testing and training datasets had to be formed from separate files before these
two datasets could be joined. For each dataset, data from three files needed to be
combined. For clarity, an example of how the training dataset was put together is
described below. 

The identifiers of the subjects involved in the training experiments are given in the
file "subject_train.txt". Each subject is identified by a number in the range
1-30. The activities performed by each subject is in the file "y_train.txt". The
measurments for each run of the experiment are given in the file "X_train.txt". 

Each of these files contained 7352 lines. Each of these files was read in using
read.table, and the columns were given descriptive names.  The column names for the
measurment variables were read in from "features.txt", but the names were modified
before assigning them to the data frame containing the measurment variables. 

An additional column called "set" was added to the subjects data frame. The values
in this column were set to "training" to indicate that the data were from the
training set. Then, the three data frames were joined by columns. 

The same procedure was applied to the test dataset. The relevant files for this
dataset are "subject_test.txt", "y_test.txt", and "X_test.txt". A
single function, tidy_set(), was used to form the both datasets, as the
steps are identical, just with different files. 

## Merging and Reducing the two datasets
After these two data sets were generated, they were combined using the
bind_rows function from the dplyr package. This step is valid since there is
no overlap between the subjects in the training and testing datasets. 

Next, only the measurement columns that contained the strings "mean" and "std" were selected.
The resulting data frame is stored in an object caled "selected_df".

Finally, a second data frame (actually, a tbl) was generated from the first that
showed the averages of all the measurement variables, grouped by subject
and activity. The tbl is stored in an object called "mean_tbl". 

## Note on deciding on variables to include / exclude / add
I thought a lot about whether to separate some of the columns into additional variables,
such as having a column for acceleration and another for type of acceleration (body, or gravity),
but as a physicist the columns seemed to me to already be fine the way they are. For example,
acceleration in the x direction is a variable in its own right. It just doesn't make sense to 
me to have a column for acceleration and another for direction. Maybe data science treats 
variables differently, but I decided not to add columns (except the "set" column).

If, for example, I were to have one variable for acceleration and another for direction,
then when I group the data by subject and activity, the accelerations in the x, y, and z
diretions would be averaged together. Physically, that makes no sense. I would also have
to group by x, y, and z, which was not requested by the assignment. 


## Reading in files into R
I wrote the first data frame into a file called "first_data_frame.txt", and the second data frame
into a file called "second_data_frame.txt". 

I was able to read these into RStudio without any problem using the following commands:

df1 <- read.table("./first_data_frame.txt")
df2 <- read.table("./second_data_frame.txt")

I followed the suggestion of David Hood for writing out the data and reading it back into R in his article on this assignment. This article can be found at the following URL: 

https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

## Other remarks
A description of the variables in "selected_df" and
"mean_tbl" can be found in the file "codebook.md"



