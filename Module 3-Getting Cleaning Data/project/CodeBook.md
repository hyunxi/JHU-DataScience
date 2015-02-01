
A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

<h1>Human Activity Recognition Using Smartphones Dataset</h1>

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


<H2>Variables</H2>
    activityLabels: data.frame[6,2] List activity name in accorance to the keys index in trainActivty & testActivity.
    features: data.table[561,2]: Lists all the features, used as column names for data in mergedData & meanSDData

    trainX: data.table[7352,561] Training Set data of 561 variables
    trainActivity: data.table[7352,1] Training Activity data label
    trainSubject: data.table[7352,1] List the subject index no. in accordance to the training dataset

    testX: data.table[2947,561] Test Set data of 561 variables
    testActivity: data.table[2947,1] Test Activity data label
    testSubject: data.table[2947,1] List the subject index no. in accordance to the test dataset

    mergedData: data.table[10299,563] Bind training and test sets together (total - 10299 observations) in order of "Subject, Activity, Data[1:561]"
    
    meanSDData: data.table[10299,81] A subsetted mergedData that retain only 81 columns that have 'mean' and 'std'

    tidy: data.table[180,81] Lists the average of each variable for 6 activities and 30 subjects (6*30=180 observations).

