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

An important note is that the script assumes the parent directory is
called UCIdata, which is different from the name produced after
decompressing the .zip file. 

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

Next, only the measurement columns that contained the string "mean" were
selected. The resulting data frame is stored in an object caled
"selected_df". 

Finally, a new data frame (actually, a tbl) was generated that
showed the averages of all the measurement variables, grouped by subject
and activity. The tbl is stored in an object called "mean_tbl". 

## Other remarks
A description of the variables in "selected_df" and
"mean_tbl" can be found in the file "codebook.md"



