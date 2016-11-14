# R script for tidying data set from UCI
#
# Load packages
library(tidyr)
library(dplyr)

# Specify directories where data is located 
# NOTE: I renamed the folder resulting from decompressing the .zip file to
# UCIdata

train_tag <- "train"
test_tag <- "test"

# Returns a data frame of the training data set or the testing data set 
# depending on the value of "tag" ("train" or "test")
tidy_set <- function( tag ) {
    
    ## Make sure that tag is an acceptable value
    if( !(tag %in% c("train", "test"))) {
        
        print("tag not an acceptable value!")
        print( paste( "tag = ", tag))
        stop()
    } #endif 
    
    ## Folder containing the training and testing datasets
    data_dir <- "./data/UCIdata/" 
    
    ## Generate paths to files to be read in
    features_file <- paste( data_dir, "features.txt", sep = "" )
    subject_file <- paste( data_dir, tag, "/", "subject_", tag, ".txt", sep = "" )
    measurement_file <- paste( data_dir, tag, "/", "X_", tag, ".txt", sep = "" )
    activity_file <- paste( data_dir, tag, "/", "y_", tag, ".txt", sep = "" )
    
    ## read in features.txt first, as these will be used to give the intial 
    ## column names to the data frame created from X_train.txt or X_test.txt
    
    features_df <- read.table( features_file )
    features <- as.character( features_df[[2]] )
    
    ## clean up the column names a bit
    features <- gsub( "-", "_", features ) # replace dashes with underscores
    features <- gsub( "\\(\\)", "", features ) # remove the double parentheses
    features <- gsub( "\\(|\\)", "_", features ) # other parentheses to underscores
    features <- gsub( ",", "_", features ) # replace commas with underscores
    features <- sapply( features, tolower, USE.NAMES = FALSE ) # change to lowercase
    
    ## Generate data frame for each of these files using read.table
    subject_df <- read.table( subject_file, col.names = "subject" )
    measurement_df <- read.table( measurement_file, col.names = features )
    activity_df <- read.table( activity_file, col.names = "activity" )
    
    ## For this case, the data frames should have the same number of rows
    ## Check to make sure this is so.
    if(!(nrow( subject_df ) == nrow( measurement_df ) ) | 
       !(nrow( subject_df ) == nrow( activity_df ) ) ) {
        
        print("nrow( subject_df ) = ", nrow( subject_df ) )
        print("nrow( measurement_df ) = ", nrow( measurement_df ) )
        print("nrow( activity_df ) = ", nrow( activity_df ) )
        stop("Error: data frames not of equal length")
        
    } # endif 
    
    ## create a new column specifying whether the data are from 
    ## the training set or the testing set. 
    subject_df <- mutate( subject_df, set = paste(tag, "ing", sep = "" ) )
    
    ## change the column values in activity_df from integer to factor,
    ## then rename the levels
    activity_df[[1]] <- as.factor( activity_df[[1]] )
    levels( activity_df[[1]] ) <- 
        c("Walking", "Walking Upstairs", "Walking Downstairs",
          "Sitting", "Standing", "Laying")
    
    ## join the columns of these data frames together with bind_cols from dplyr
    bind_cols( subject_df, activity_df, measurement_df )
    
} # end tidy_set function

## now, generate data frames from the training and testing data sets.
train_df <- tidy_set( train_tag )
test_df <- tidy_set( test_tag )

## now, combine them using bind_rows from dplyr
combined_df <- bind_rows( train_df, test_df ) 

## next, select only the measurment columns with "mean" and "std" 
## in the variable name.
keep <- "subject|set|activity|mean|std"
selected_cols <- grep( keep, names(combined_df), value = TRUE )

## data set from step 4 ##
selected_df <- combined_df[ , selected_cols ] 

## now work on data set from step 5. First, group by subject and 
## activity
mean_tbl <- tbl_df(selected_df) %>% group_by( subject, activity )

## Second, use the summarise_each function from the dplyr package
## to apply the function mean() to each column except the "set" column.
mean_tbl <- summarise_each( mean_tbl, funs(mean), - set )

## modify the names of the measurement variables
## first, select the column variables to change, then add "mean_" 
## to the beginning of these. 
new_names <- grep( "mean|std", names(mean_tbl), value = TRUE ) %>%
    sapply( function( x ) paste( "mean_", x, sep = "" ), USE.NAMES = FALSE ) 

new_names <- c("subject", "activity", new_names )
names(mean_tbl) <- new_names




