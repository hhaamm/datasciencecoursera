## X_train.txt [561 cols] | y_train.txt [1 col] | subject_train.txt [1 col] -> 7352 rows
## X_test.txt  [561 cols] | y_test.txt  [1 col] | subject_test.txt  [1 col] -> 2947 rows  
## Total; 10299 rows x 563 cols 

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# x files: data
# y files: activities

# Creating tmp directory for storing temporary data files
if (!file.exists("./tmp")) {
  dir.create("./tmp")
}

# This if is used to cache expensive raw data processing and merging
if (!file.exists("./tmp/step1.csv")) {
  message("Loading raw data")
  csv1 <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
  csv2 <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
  csv3 <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  csv4 <- cbind(csv1, csv2, csv3)
  
  csv1 <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
  csv2 <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
  csv3 <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  csv5 <- cbind(csv1, csv2, csv3)
  
  csv6 <- rbind(csv4, csv5)
  
  message(paste("Dimensions of whole dataset: ", dim(csv6)[1],"x",dim(csv6)[2]))
  
  message("Loading names")
  names <- read.table("UCI HAR Dataset/features.txt",colClasses="character")[,2]
  names <- c(names, c("Activity", "Subject"))
  
  message("Assigning names to the dataset")
  names(csv6) <- names
  
  message("Getting only desired columns")
  desired_columns <- grepl("^(Activity|Subject|.+(mean|std)\\(\\))",names)
  
  message("Deleting colums that we won't work with")
  csv7 <- csv6[,desired_columns]
  message(paste("Dimensions of new dataset: ", dim(csv7)[1],"x",dim(csv7)[2]))  
  
  write.csv(csv7, "./tmp/step1.csv",row.names = FALSE)
} else {
  message("Loading cached data")
  csv7 <- read.csv("./tmp/step1.csv")
  message(paste("Dimensions of cached dataset: ", dim(csv7)[1],"x",dim(csv7)[2]))
}

message("Running aggregate functions")
agg <- aggregate(csv7,list(Subject=csv7$Subject, Activity=csv7$Activity),mean)

message("Loading activity labels")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE,colClasses="character")

rows <- dim(agg)[1]

message("Replacing activity labels")
activity_col <- ncol(agg)-1
for (i in 1:rows) {
  agg[i,activity_col] <- activity_labels[agg[i,activity_col],2]
}

# Deleting duplicated columns product of aggregate function
agg <- agg[,3:ncol(agg)]

message("Saving tidy dataset on main folder")
write.table(agg, "tidy-dataset.txt")