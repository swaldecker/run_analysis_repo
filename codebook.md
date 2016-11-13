# Codebook for run_analysis.R
Author: Seth Waldecker
Last Updated: 11/13/2016

## Variables for data frame "selected_df" (1st data frame)

### Categorical variables
* "subject" : a number identifying the subject participating in the experiments
* "set" : a factor indicating whether the subject was in the training group or the testing group
* "activity" : a factor indicating the type of activity performed by the subject.

### Measurment variables in the time domain
Note: The t in front of the variable names below indicates that these
variables are in the time domain.

#### Acceleration Variables
The following variables are acceleration variables. The
information provided by UCI say the units of the data in
"total_acc_x_train.txt" are given in units of 'g', but the data
in "X_train.txt" and "X_test.txt" are different by a couple order
of magnitude. The best I can tell, the units for the latter two
files are in cm / s^2 (cm = centimeters, s = second).

* Mean body acceleration in the x, y, z directions
    * "tbodyacc_mean_x" 
    * "tbodyacc_mean_y" 
    * "tbodyacc_mean_z" 

* Standard deviations of the body accelerations in the x, y, z directions
    * "tbodyacc_std_x"  
    * "tbodyacc_std_y"  
    * "tbodyacc_std_z"  

* Mean acceleration due to gravity in the x, y, z directions
    * "tgravityacc_mean_x" 
    * "tgravityacc_mean_y" 
    * "tgravityacc_mean_z" 

* Standard deviations of the gravitational acceleration in the x, y, z directions
    * "tgravityacc_std_x"  
    * "tgravityacc_std_y"  
    * "tgravityacc_std_z"  

#### Jerk Variables
The following variables are jerk variables derived from the acceleration data. In
this case, the jerk is the derivative of the acceleration, which would make the units cm / s^3.

* Mean jerk in the x, y, z directions
    * "tbodyaccjerk_mean_x"
    * "tbodyaccjerk_mean_y"
    * "tbodyaccjerk_mean_z"

* Standard deviations of the jerks in the x, y, z directions
    * "tbodyaccjerk_std_x"
    * "tbodyaccjerk_std_y"
    * "tbodyaccjerk_std_z"

#### Angular Speed Variables
The following variables give the angular speed of the body in the x, y, z directions.
The units are radians / second (according to information provided by UCI).

* Mean body angular speeds in the x, y, z directions
    * "tbodygyro_mean_x"
    * "tbodygyro_mean_y"
    * "tbodygyro_mean_z"

* Standard deviations of the body angular speeds in the x, y, z directions.
    * "tbodygyro_std_x"
    * "tbodygyro_std_y"
    * "tbodygyro_std_z"

#### Angular Jerk Variables
Below are variables of the angular jerk in the x, y, z direction. Technically, these
should have units of radians / second^3. What about the angular acceleration? This
data seems to be missing. 

* Mean angular jerk of the body in the x, y, z directions
    * "tbodygyrojerk_mean_x"
    * "tbodygyrojerk_mean_y"
    * "tbodygyrojerk_mean_z"

* Standard deviations of the angular jerk in the x, y, z directions
    * "tbodygyrojerk_std_x"
    * "tbodygyrojerk_std_y"
    * "tbodygyrojerk_std_z"

#### Magnitude Variables
The variables below show the magnitudes of the average acceleration, jerk, angular velocity,
and angular jerk vectors along with their corresponding standard deviations
 
* Magnitude of the mean body acceleration and its standard deviation. 
    * "tbodyaccmag_mean"
    * "tbodyaccmag_std"

* Magnitude of the mean gravitational acceleration and its standard deviation.
    * "tgravityaccmag_mean"
    * "tgravityaccmag_std"

* Magnitude of the mean jerk and its standard deviation.
    * "tbodyaccjerkmag_mean"
    * "tbodyaccjerkmag_std"

* Magnitude of the angular velocity and its standard deviation.
    * "tbodygyromag_mean"
    * "tbodygyromag_std"

* Magnitude of the angular jerk and its standard deviation.
    * "tbodygyrojerkmag_mean"
    * "tbodygyrojerkmag_std"

### Measurment variables in the frequency domain
Note: The f in front of the variable names below indicates that these
variables are in the frequency domain.

#### Analogues with time domain variables
The following are means and standard deviations obtained from fourier transforms
of corresponding variables in the time domain 
* "fbodyacc_mean_x"
* "fbodyacc_mean_y"
* "fbodyacc_mean_z"
* "fbodyacc_std_x"
* "fbodyacc_std_y"
* "fbodyacc_std_z"
* "fbodyaccjerk_mean_x"
* "fbodyaccjerk_mean_y"
* "fbodyaccjerk_mean_z"
* "fbodyaccjerk_std_x"
* "fbodyaccjerk_std_y"
* "fbodyaccjerk_std_z"
* "fbodygyro_mean_x"
* "fbodygyro_mean_y"
* "fbodygyro_mean_z"
* "fbodygyro_std_x"
* "fbodygyro_std_y"
* "fbodygyro_std_z"
* "fbodyaccmag_mean"
* "fbodyaccmag_std"
* "fbodybodyaccjerkmag_mean"
* "fbodybodyaccjerkmag_std"
* "fbodybodygyromag_mean"
* "fbodybodygyromag_std"
* "fbodybodygyrojerkmag_mean"
* "fbodybodygyrojerkmag_std"

#### Weighted averages
The following are weighted averages of the frequency components from the body
acceleration, the jerk, the angular velocity, the angular jerk, in the x, y, z
directions and from the magnitudes of these quantities, respectively. Units are in Hertz (Hz).
* "fbodyacc_meanfreq_x"
* "fbodyacc_meanfreq_y"
* "fbodyacc_meanfreq_z"
* "fbodyaccjerk_meanfreq_x"
* "fbodyaccjerk_meanfreq_y"
* "fbodyaccjerk_meanfreq_z"
* "fbodygyro_meanfreq_x"
* "fbodygyro_meanfreq_y"
* "fbodygyro_meanfreq_z"
* "fbodyaccmag_meanfreq"
* "fbodybodyaccjerkmag_meanfreq"
* "fbodybodygyromag_meanfreq"
* "fbodybodygyrojerkmag_meanfreq"

### Angle Variables 

Angle between mean body acceleration vector and (mean?) gravitational acceleration vector. 
* "angle_tbodyaccmean_gravity\_" 

Angle between mean body jerk vector and mean gravitational acceleration vector.
* "angle_tbodyaccjerkmean__gravitymean\_"

Angle between mean angular velocity vector and mean graviational acceleration vector.
* "angle_tbodygyromean_gravitymean\_"

Angle between mean angular jerk vector and the mean gravitational acceleration vector.
* "angle_tbodygyrojerkmean_gravitymean\_"

Angle between the x, y, z directions and the mean gravitational acceleration vector.
* "angle_x_gravitymean\_"
* "angle_y_gravitymean\_"
* "angle_z_gravitymean\_"

## Variables for tbl "mean_tbl" (2nd data frame)
The variables describing this data are essentially the same as previously described except the
string "mean_" is attached to beginning of the column names for the measurement variables. The 
"set" column is also removed. 
