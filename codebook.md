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

The following variables are acceleration variables. The
information provided by UCI say the units of the data in
"total_acc_x_train.txt" are given in units of 'g', but the data
in "X_train.txt" and "X_test.txt" are different by a couple order
of magnitude. The best I can tell, the units for the latter two
files are in cm / s^2 (cm = centimeters, s = second).

*Mean body acceleration in the x, y, z directions
    * "tbodyacc_mean_x" 
    * "tbodyacc_mean_y" 
    * "tbodyacc_mean_z" 

* Standard deviations of the body accelerations in the x, y, z directions
    * "tbodyacc_std_x"  
    * "tbodyacc_std_y"  
    * "tbodyacc_std_z"  

* Mean acceleration due to gravity in the x, y, z directions
    * "tgravityacc_mean_x" 
    * "tgravityacc\\_mean\\_y" 
    * "tgravityacc\\_mean\\_z" 

*Standard deviations of the gravitational acceleration in the x, y, z directions
    * "tgravityacc\\_std\\_x"  
    * "tgravityacc\\_std\\_y"  
    * "tgravityacc\\_std\\_z"  

The following variables are jerk variables derived from the acceleration data. In
this case, the jerk is the derivative of the acceleration, which would make the units cm / s^3.

* Mean jerk in the x, y, z directions
    * "tbodyaccjerk\\_mean\\_x"
    * "tbodyaccjerk\\_mean\\_y"
    * "tbodyaccjerk\\_mean\\_z"

* Standard deviations of the jerks in the x, y, z directions
    * "tbodyaccjerk\\_std\\_x"
    * "tbodyaccjerk\\_std\\_y"
    * "tbodyaccjerk\\_std\\_z"

The following variables give the angular speed of the body in the x, y, z directions.
The units are radians / second (according to information provided by UCI).

* Mean body angular speeds in the x, y, z directions
    * "tbodygyro\\_mean\\_x"
    * "tbodygyro\\_mean\\_y"
    * "tbodygyro\\_mean\\_z"

* Standard deviations of the body angular speeds in the x, y, z directions.
    * "tbodygyro\\_std\\_x"
    * "tbodygyro\\_std\\_y"
    * "tbodygyro\\_std\\_z"

Below are variables of the angular jerk in the x, y, z direction. Technically, these
should have units of radians / second^3. What about the angular acceleration? This
data seems to be missing. 

* Mean angular jerk of the body in the x, y, z directions
    * "tbodygyrojerk\\_mean\\_x"
    * "tbodygyrojerk\\_mean\\_y"
    * "tbodygyrojerk\\_mean\\_z"

* Standard deviations of the angular jerk in the x, y, z directions
    * "tbodygyrojerk\\_std\\_x"
    * "tbodygyrojerk\\_std\\_y"
    * "tbodygyrojerk\\_std\\_z"

The variables below show the magnitudes of the average acceleration, jerk, angular velocity,
and angular jerk vectors along with their corresponding standard deviations
 
* Magnitude of the mean body acceleration and its standard deviation. 
    * "tbodyaccmag\\_mean"
    * "tbodyaccmag\\_std"

* Magnitude of the mean gravitational acceleration and its standard deviation.
    * "tgravityaccmag\\_mean"
    * "tgravityaccmag\\_std"

* Magnitude of the mean jerk and its standard deviation.
    * "tbodyaccjerkmag\\_mean"
    * "tbodyaccjerkmag\\_std"

* Magnitude of the angular velocity and its standard deviation.
    * "tbodygyromag\\_mean"
    * "tbodygyromag\\_std"

* Magnitude of the angular jerk and its standard deviation.
    * "tbodygyrojerkmag\\_mean"
    * "tbodygyrojerkmag\\_std"

### Measurment variables in the frequency domain
Note: The f in front of the variable names below indicates that these
variables are in the frequency domain.

The following are means and standard deviations obtained from fourier transforms of corresponding variables in the time domain 
    * "fbodyacc\\_mean\\_x"
    * "fbodyacc\\_mean\\_y"
    * "fbodyacc\\_mean\\_z"
    * "fbodyacc\\_std\\_x"
    * "fbodyacc\\_std\\_y"
    * "fbodyacc\\_std\\_z"
    * "fbodyaccjerk\\_mean\\_x"
    * "fbodyaccjerk\\_mean\\_y"
    * "fbodyaccjerk\\_mean\\_z"
    * "fbodyaccjerk\\_std\\_x"
    * "fbodyaccjerk\\_std\\_y"
    * "fbodyaccjerk\\_std\\_z"
    * "fbodygyro\\_mean\\_x"
    * "fbodygyro\\_mean\\_y"
    * "fbodygyro\\_mean\\_z"
    * "fbodygyro\\_std\\_x"
    * "fbodygyro\\_std\\_y"
    * "fbodygyro\\_std\\_z"
    * "fbodyaccmag\\_mean"
    * "fbodyaccmag\\_std"
    * "fbodybodyaccjerkmag\\_mean"
    * "fbodybodyaccjerkmag\\_std"
    * "fbodybodygyromag\\_mean"
    * "fbodybodygyromag\\_std"
    * "fbodybodygyrojerkmag\\_mean"
    * "fbodybodygyrojerkmag\\_std"

The following are weighted averages of the frequency components from the body
acceleration, the jerk, the angular velocity, the angular jerk, in the x, y, z
directions and from the magnitudes of these quantities, respectively. Units are in Hertz (Hz).
    * "fbodyacc\\_meanfreq\\_x"
    * "fbodyacc\\_meanfreq\\_y"
    * "fbodyacc\\_meanfreq\\_z"
    * "fbodyaccjerk\\_meanfreq\\_x"
    * "fbodyaccjerk\\_meanfreq\\_y"
    * "fbodyaccjerk\\_meanfreq\\_z"
    * "fbodygyro\\_meanfreq\\_x"
    * "fbodygyro\\_meanfreq\\_y"
    * "fbodygyro\\_meanfreq\\_z"
    * "fbodyaccmag\\_meanfreq"
    * "fbodybodyaccjerkmag\\_meanfreq"
    * "fbodybodygyromag\\_meanfreq"
    * "fbodybodygyrojerkmag\\_meanfreq"

### Angle Variables 
Angle between mean body acceleration vector and (mean?) gravitational acceleration vector. 
    * "angle\\_tbodyaccmean\\_gravity\\_" 

Angle between mean body jerk vector and mean gravitational acceleration vector.
    * "angle\\_tbodyaccjerkmean\\_\\_gravitymean\\_"

Angle between mean angular velocity vector and mean graviational acceleration vector.
    * "angle\\_tbodygyromean\\_gravitymean\\_"

Angle between mean angular jerk vector and the mean gravitational acceleration vector.
    * "angle\\_tbodygyrojerkmean\\_gravitymean\\_"

Angle between the x, y, z directions and the mean gravitational acceleration vector.
    * "angle\\_x\\_gravitymean\\_"
    * "angle\\_y\\_gravitymean\\_"
    * "angle\\_z\\_gravitymean\\_"
