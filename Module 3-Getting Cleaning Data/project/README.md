Module-3
========

<h1>Project on Getting and Cleaning Data</h1>

<h2>Introduction</h2>
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

<h3>Datasource</h3>
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

<h3>How the script (run_analysis.R) works</h3>
The R script called run_analysis.R that does the following. 

1. Loads the necessary libraries required for manipulating data tables

2. Reads the datafiles into assigned variables

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. Merges the training and the test sets to create one data set.

6. Extracts only the measurements on the mean and standard deviation for each measurement. 

7. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

8. Write the tidy data into a 'txt' file

Acknowledgements to Erik-Jan van Baaren for portions of the source code found here <a href="https://github.com/eriky/coursera-getting-and-cleaning-data/blob/master/run_analysis.R"> Link </a href>
