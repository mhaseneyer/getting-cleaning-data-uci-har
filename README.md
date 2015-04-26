# Getting and Cleaning Data: Course Project
*******************************************

This repository contains the script, Code Book and sample data of the
"Getting and Cleaning Data" course.

The files are:

*	`README.md` is the documentation file you are reading right now.
*	`run_analysis.R` is the file with the script for use with R.
*	`CodeBook.md` is the code book describing the variables in the
	sample output file.
*	`summarised.txt` is a CSV (comma separated values) file containing
	the summarized data, which is the output for step 5 of the
	course project.

The script was created using R 3.2.0 and R Studio 0.98.1103 running on
Windows 7.

## Data source

The source data is obtained from the [Human Activity Recognition Using
Smartphones Data Set] project, it contains 561 features from 30 test
subjects, each for 6 activities done multiple times. You can obtain the
data as [source data ZIP file] or have the script downloading it for you
(tested on Windows 7 only).

## R script

The R script `run_analysis.R` does five steps to tidy the data:
1.	Merge the training and test data set into one dataset.
2.	Extracts the measurements of mean and standard deviations, and skips
	all the rest.
3.	Sets descriptive names to the fields (rows) of the "`Activity`"
	column.
4.	Sets descriptive names to the variables (columns).
5.	Create a second data set with means for each variable regarding
	subject and activity, and stores it.

The script tidies the data regarding [Hadley Wickhams principles]:

1.	Each variable forms a column.
2.	Each observation forms a row.
3.	Each type of observational unit forms a table.

It is able to download the source data from the web, or use a local copy
stored in a ZIP file.

## Getting started

Being fast, source the script and run the prepare and analysis function:

	source("run_analysis.R")
	prepare_analysis()
	run_analysis()

And you are done quickly. You want more details? Here we go.

The script requires the `data.table` package. You can use the
`prepare_analysis` function, it will check if the package is installed
and install it if needed:

	prepare_analysis()

Then, simply run the script:

	run_analysis()

It will download the ZIP archive with the source data, do the five steps
mentioned above and then create an output file for the data set of the
fifth step.

## File storage

The script expects a `project-data` folder in your working directory. It
will create this folder when it does not exist.

The script also expects the source data file as ZIP file in that
`project-data` folder with the file name `uci-har-dataset.zip`. If it is
not there, the script will try to download it from the web and store it
there.

The output file will be created in the `project-data` folder into a file
called `summarised.txt`.

## Parameters

You can call the analysis function just with `run_analysis()`, then it
will use default values and go straight away. The function has three
parameters that will influence its behaviour:

*	`project.dir`: in case you want a different directory for the files
	to be stored, you can enter the path here.
*	`outfile`: in case you want a different name for the output file,
	you can choose here. The output file will be created in whatever
	directory is set in the `project.dir` parameter.
*	`verbose` (`TRUE` or `FALSE`): the script can store the tidy dataset
	and the summarised dataset into your global environment by setting
	this to `TRUE` (default is `FALSE`). This comes handy if you want to
	play with the data directly after the tidying process is over.

[Human Activity Recognition Using Smartphones Data Set]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[source data ZIP file]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[Hadley Wickhams principles]: http://vita.had.co.nz/papers/tidy-data.pdf
