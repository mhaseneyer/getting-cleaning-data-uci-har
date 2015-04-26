# Getting and Cleaning Data: Code Book
**************************************

This code book describes the output of the script after tidying the
[Human Activity Recognition Using Smartphones Data Set] regarding
[Hadley Wickhams principles]:

1.	Each variable forms a column.
2.	Each observation forms a row.
3.	Each type of observational unit forms a table.

The underlying data set is about 561 features regarding 6 activities
measured by a smartphone, which were done multiple times by 30 test
persons. For a deeper understanding of the data, please refer to the
source dataset and its description contained in its `README.txt` file.

## Base variables

The base variables are in the first two columns:

1.	**Subject** (a number from 1 until 30 telling which test person was
	measured.
2.	**Activity** naming the activity measured and one of the six values
	`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`,
	`STANDING` or `LAYING`.

## Feature variables

The columns 3 until 81 describe several measurement variables regarding
their mean and standard deviation. Their names are systematically
created and tell about:

*	**Time** or **Frequency** measured
*	**Body** or **Gravity** measured
*	**Acceleration** or **Gyroscope** sensor measured
*	normal, **Magnitude** or **Jerk** data measured
*	then, a period `.`
*	**Mean**, **Mean frequency** or **Standard deviation** measured
*	then, a period `.` again
*	the axis **X**, **Y** or **Z** which is measured

These variables are normalized to [-1, 1].

Naming them all together, this list results:

1.	Subject
2.	Activity
3.	Time.BodyAcceleration.Mean.X
4.	Time.BodyAcceleration.Mean.Y
5.	Time.BodyAcceleration.Mean.Z
6.	Time.BodyAcceleration.StandardDeviation.X
7.	Time.BodyAcceleration.StandardDeviation.Y
8.	Time.BodyAcceleration.StandardDeviation.Z
9.	Time.GravityAcceleration.Mean.X
10.	Time.GravityAcceleration.Mean.Y
11.	Time.GravityAcceleration.Mean.Z
12.	Time.GravityAcceleration.StandardDeviation.X
13.	Time.GravityAcceleration.StandardDeviation.Y
14.	Time.GravityAcceleration.StandardDeviation.Z
15.	Time.BodyAccelerationJerk.Mean.X
16.	Time.BodyAccelerationJerk.Mean.Y
17.	Time.BodyAccelerationJerk.Mean.Z
18.	Time.BodyAccelerationJerk.StandardDeviation.X
19.	Time.BodyAccelerationJerk.StandardDeviation.Y
20.	Time.BodyAccelerationJerk.StandardDeviation.Z
21.	Time.BodyGyroscope.Mean.X
22.	Time.BodyGyroscope.Mean.Y
23.	Time.BodyGyroscope.Mean.Z
24.	Time.BodyGyroscope.StandardDeviation.X
25.	Time.BodyGyroscope.StandardDeviation.Y
26.	Time.BodyGyroscope.StandardDeviation.Z
27.	Time.BodyGyroscopeJerk.Mean.X
28.	Time.BodyGyroscopeJerk.Mean.Y
29.	Time.BodyGyroscopeJerk.Mean.Z
30.	Time.BodyGyroscopeJerk.StandardDeviation.X
31.	Time.BodyGyroscopeJerk.StandardDeviation.Y
32.	Time.BodyGyroscopeJerk.StandardDeviation.Z
33.	Time.BodyAccelerationMagnitude.Mean
34.	Time.BodyAccelerationMagnitude.StandardDeviation
35.	Time.GravityAccelerationMagnitude.Mean
36.	Time.GravityAccelerationMagnitude.StandardDeviation
37.	Time.BodyAccelerationJerkMagnitude.Mean
38.	Time.BodyAccelerationJerkMagnitude.StandardDeviation
39.	Time.BodyGyroscopeMagnitude.Mean
40.	Time.BodyGyroscopeMagnitude.StandardDeviation
41.	Time.BodyGyroscopeJerkMagnitude.Mean
42.	Time.BodyGyroscopeJerkMagnitude.StandardDeviation
43.	Frequency.BodyAcceleration.Mean.X
44.	Frequency.BodyAcceleration.Mean.Y
45.	Frequency.BodyAcceleration.Mean.Z
46.	Frequency.BodyAcceleration.StandardDeviation.X
47.	Frequency.BodyAcceleration.StandardDeviation.Y
48.	Frequency.BodyAcceleration.StandardDeviation.Z
49.	Frequency.BodyAcceleration.MeanFrequency.X
50.	Frequency.BodyAcceleration.MeanFrequency.Y
51.	Frequency.BodyAcceleration.MeanFrequency.Z
52.	Frequency.BodyAccelerationJerk.Mean.X
53.	Frequency.BodyAccelerationJerk.Mean.Y
54.	Frequency.BodyAccelerationJerk.Mean.Z
55.	Frequency.BodyAccelerationJerk.StandardDeviation.X
56.	Frequency.BodyAccelerationJerk.StandardDeviation.Y
57.	Frequency.BodyAccelerationJerk.StandardDeviation.Z
58.	Frequency.BodyAccelerationJerk.MeanFrequency.X
59.	Frequency.BodyAccelerationJerk.MeanFrequency.Y
60.	Frequency.BodyAccelerationJerk.MeanFrequency.Z
61.	Frequency.BodyGyroscope.Mean.X
62.	Frequency.BodyGyroscope.Mean.Y
63.	Frequency.BodyGyroscope.Mean.Z
64.	Frequency.BodyGyroscope.StandardDeviation.X
65.	Frequency.BodyGyroscope.StandardDeviation.Y
66.	Frequency.BodyGyroscope.StandardDeviation.Z
67.	Frequency.BodyGyroscope.MeanFrequency.X
68.	Frequency.BodyGyroscope.MeanFrequency.Y
69.	Frequency.BodyGyroscope.MeanFrequency.Z
70.	Frequency.BodyAccelerationMagnitude.Mean
71.	Frequency.BodyAccelerationMagnitude.StandardDeviation
72.	Frequency.BodyAccelerationMagnitude.MeanFrequency
73.	Frequency.BodyBodyAccelerationJerkMagnitude.Mean
74.	Frequency.BodyBodyAccelerationJerkMagnitude.StandardDeviation
75.	Frequency.BodyBodyAccelerationJerkMagnitude.MeanFrequency
76.	Frequency.BodyBodyGyroscopeMagnitude.Mean
77.	Frequency.BodyBodyGyroscopeMagnitude.StandardDeviation
78.	Frequency.BodyBodyGyroscopeMagnitude.MeanFrequency
79.	Frequency.BodyBodyGyroscopeJerkMagnitude.Mean
80.	Frequency.BodyBodyGyroscopeJerkMagnitude.StandardDeviation
81.	Frequency.BodyBodyGyroscopeJerkMagnitude.MeanFrequency

[Human Activity Recognition Using Smartphones Data Set]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[Hadley Wickhams principles]: http://vita.had.co.nz/papers/tidy-data.pdf
