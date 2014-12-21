README: run_analysis
===========
**Course Project for Getting and  Cleaning Data**
dogvile
20/12/201

----

***The purpose of this readme file is to explain how the run_analysis.R script in this repo works.***  

The R script `run_analysis.R`  uses the working directory which should contain the source data collected from the Samsung 
Galaxy S smartphone.  A full description of this data is available on the original download site.  

There are some functions ( dcast(),melt() ) which are used for the appropriate analysis, so the following packages are required: 

```
install.packages(plyr)
install.packages(reshape2)

```

*Note:If the above packages are already installed we just call the libraries*

```
library(reshape)
library(plyr)
```
----

###Source Data  
If the dataset has not already been downloaded and unzipped, code has been provided (currently commented out in the 
R script) that will download and unzip the files to the current working directory.

Giving the requireent that the working directory is setup and the files are in it, the below code
can be executed.

###Data Import

According to the readme file, there are two sets of data. The first one is the training data set which
includes subject_training.txt, x_training.txt, y_training.txt.The second one is the test data set
which includes subject_test.txt, x_test.txt, y_test.txt.

1. Train Data  
  `subject_train.txt` - subject that performed the activity  
  `x_train.txt` - contains the test results for the training dataset   
  `y_train.txt` - activity that was performed
  
2. Test Data   
  `subject_test.txt` -  subject that performed the activity   
  `x_test.txt` - contains the test results for the test dataset  
  `y_test.txt` - activity that was performed   


Descriptive Data (labels)  
  `features.txt` - reference table for the name of the measurement in result dataset   
  `activity_labels.txt` - reference table for the name of the activity performed 
  

  
###PreProcessing Data
The recorded (raw) data are already preprocessed with low pass filters (butterworth) in order to remove the noise. 
Also, they have been used some mathematical formulas (Fourier / Euclidean norm) in order to produced 
another variables based on the first variables.

###Processing Data

After the import, the run_analysis.R script processes the full dataset and executes the following transformations: 

1. Extracts only the measurements on the mean and standard deviation for each measurement. 

2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive variable names. 

A second independent tidy dataset is then generated that contains the average of each variable for each activity 
and each subject:
  
Finally, this transformed data is written to a file in the current working directory called:  

1. `tidydata.txt` 
2. `tidydata_means.txt`

----
