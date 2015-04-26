prepare_library <- function(package, install = TRUE, verbose = TRUE) {

	if (require(package, character.only = TRUE)) {
		if (verbose) print(paste0("Package '", package, "' installed properly."))
		return(TRUE)
	} else {
		if (install) {
			if (verbose) print(paste0("Package '", package, "' not found Trying to install..."))
			install.packages(package)
			if (require(package, character.only = TRUE)) {
				if (verbose) print(paste0("Package '", package, "' installed properly."))
				return(TRUE)
			} else {
				if (verbose) print(paste0("Could not install '", package, "' package."))
				return(FALSE)
			}
		} else {
			if (verbose) print(paste0("Package '", package, "' not found."))
			return(FALSE)
		}
	}
}

# Prepare library with required packages
prepare_analysis <- function() {

	# prepare the required libraries
	prepare_library("data.table")

}

run_analysis <- function(project.dir = "./project-data", outfile = "summarised.txt", verbose = FALSE) {
	
	require("data.table")
	## Initialisation
	# create directory and file structure if needed
	source.file <- "uci-har-dataset.zip"
	source.file <- file.path(project.dir, source.file)
	source.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

	# set up project folder, if not existing
	if(!file.exists(project.dir)) dir.create(project.dir)
	# set up source folder and file, if not existing
	if(!file.exists(source.file)) download.file(source.url, file.path(project.dir, source.file))

	## Read data from zip file
	# read header data
	data_activitylabels <- read.table(unz(source.file, "UCI HAR Dataset/activity_labels.txt"))
	data_features <- read.table(unz(source.file, "UCI HAR Dataset/features.txt"))
	# read training data
	data_train.subject <- read.table(unz(source.file, "UCI HAR Dataset/train/subject_train.txt"))
	data_train.x <- read.table(unz(source.file, "UCI HAR Dataset/train/X_train.txt"))
	data_train.y <- read.table(unz(source.file, "UCI HAR Dataset/train/y_train.txt"))
	# read test data
	data_test.subject <- read.table(unz(source.file, "UCI HAR Dataset/test/subject_test.txt"))
	data_test.x <- read.table(unz(source.file, "UCI HAR Dataset/test/X_test.txt"))
	data_test.y <- read.table(unz(source.file, "UCI HAR Dataset/test/y_test.txt"))

	## Combining data
	# (--> relates to step 1 in the course project)
	# combine training data and test data to datasets
	data_train <- cbind(data_train.subject, data_train.y, data_train.x)
	data_test <- cbind(data_test.subject, data_test.y, data_test.x)
	# combine training and test data to one dataset
	data_combined <- rbind(data_train, data_test)

	## Column Handling and Naming
	names_original <- as.character(data_features[, 2])
	# Which columns to keep? Those which contain mean or standard deviation
	# (--> relates to step 2 in the course project)
	columns_to_keep <- grepl("mean|std", names_original)
	names_original <- names_original[columns_to_keep]
	# we need two more columns for "Subject" and "Activity" here
	columns_to_keep <- c(TRUE, TRUE, columns_to_keep)
	data_combined <- data_combined[, columns_to_keep]
	# set human-readable activity names
	# (--> relates to step 3 in the course project)
	data_combined[, 2] <- factor(data_combined[, 2], labels=data_activitylabels[, 2])
	# now do the naming for the remaining columns
	# (--> relates to step 4 in the course project)
	names_result <- gsub("^t", "Time.", names_original)
	names_result <- gsub("^f", "Frequency.", names_result)
	names_result <- gsub("Acc", "Acceleration", names_result)
	names_result <- gsub("Mag", "Magnitude", names_result)
	names_result <- gsub("Gyro", "Gyroscope", names_result)
	names_result <- gsub("-meanFreq", ".MeanFrequency", names_result)
	names_result <- gsub("-mean", ".Mean", names_result)
	names_result <- gsub("-std", ".StandardDeviation", names_result)
	names_result <- gsub("-X$", ".X", names_result)
	names_result <- gsub("-Y$", ".Y", names_result)
	names_result <- gsub("-Z$", ".Z", names_result)
	names_result <- gsub("\\(\\)", "", names_result)
	names_result <- c("Subject", "Activity", names_result)
	# assign new names
	names(data_combined) <- names_result

	## Create data set with average of each variable by subject and activity
	# (--> relates to step 5 in the course project)
	# this is a little hack because the "aggregate" function needs numeric
	data_sum <- data_combined
	data_sum$Activity <- as.numeric(data_sum$Activity)
	data_sum <- aggregate(data_sum, by=list(s1 = data_sum$Subject, s2=data_sum$Activity), mean)
	data_sum <- data_sum[, !names(data_sum) %in% c("s1", "s2")]
	data_sum[, 2] <- factor(data_sum[, 2], labels=data_activitylabels[, 2])
	write.table(data_sum, file.path(project.dir, outfile), row.names = FALSE)

	## Finish
	# output to global environment if desired
	if (verbose) {
		data_combined <<- data_combined
		data_sum <<- data_sum
	}

}
