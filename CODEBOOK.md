# Modified UCI HAR Code Book

This code book describes the variables in the final dataset produced
from the UCI HAR dataset.

## SubjectId

The ``SubjectId`` variable is an integer that uniquely identifies a study participant.

## Activity

The ``Activity`` variable is the name of the participant activity
that was measured. The names of the measured activities are:

- "WALKING"
- "WALKING_UPSTAIRS"
- "WALKING_DOWNSTAIRS"
- "SITTING"
- "STANDING"
- "LAYING"

## Measurements

The remaining variables are measurements of the subject performing a specific
activity. Each variable name contains either 3 or 4 components.

1. Measured signal name, components of which are described below
2. Signal measurement domain, either ``Time`` or ``Frequency``
3. Statistical summarization applied, ``Mean`` or ``StdDev``

The features selected for this database come from the accelerometer
and gyroscope 3-axial raw signals ``Acceleration`` and ``Gyro``.
The ``X``, ``Y`` and ``X`` name components indicate the axis of the
measurement.

Measurements whose domain is ``Time`` were captured at a constant
rate of 50 Hz. Then they were filtered using a median filter and a
3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise.

Another low pass Butterworth filter with a corner frequency of 0.3
Hz.  was used to separate the acceleration signal (denoted by the
``Acceleration`` name component) into body and gravity acceleration
signals (respectively denoted by the ``Body`` and ``Gravity``
components).

Subsequently, the body linear acceleration and angular velocity
were derived in time to obtain so-called jerk signals, and are
denoted by the ``LinearAcceleration`` and ``AngularVelocity`` name
components. The magnitude of these three-dimensional signals were
calculated using the Euclidean norm, denoted by the ``Magnitude``
name component.

A Fast Fourier Transform (FFT) was applied to some measurements,
denoted by the ``Frequency`` name component to indicate they are
frequency domain signals.

The mean and standard deviation of the measurements was calculated
and is denoted by the ``Mean`` and ``StdDev`` name components.

The following table lists the measurement variable names found in
the final dataset

| Variable name | Description |
|---------------|-------------|
| BodyAccelerationMagnitudeFrequencyMean | Mean of the FFT of the body acceleration signal. |
| BodyAccelerationMagnitudeFrequencyStdDev | Standard deviation of the FFT of the body acceleration signal. |
| BodyAccelerationMagnitudeTimeMean | Mean of the magnitude of the  body acceleration signal. |
| BodyAccelerationMagnitudeTimeStdDev | Standard deviation of the magnitude of the  body acceleration signal. |
| BodyAccelerationXFrequencyMean | Mean of the FFT of the body acceleration on the X axis. |
| BodyAccelerationXFrequencyStdDev | Standard deviation of the FFT of the body acceleration on the X axis. | 
| BodyAccelerationXTimeMean | Mean of the body acceleration on the X axis. |
| BodyAccelerationXTimeStdDev | Standard deviation of the body acceleration on the X axis. |
| BodyAccelerationYFrequencyMean | Mean of the FFT of the body acceleration on the Y axis. |
| BodyAccelerationYFrequencyStdDev | Standard deviation of the FFT of the body acceleration on the Y axis. | 
| BodyAccelerationYTimeMean | Mean of the body acceleration on the Y axis. |
| BodyAccelerationYTimeStdDev | Standard deviation of the body acceleration on the Y axis. | 
| BodyAccelerationZFrequencyMean | Mean of the FFT of the body acceleration on the Z axis. |
| BodyAccelerationZFrequencyStdDev | Standard deviation of the FFT of the body acceleration on the Z axis. |
| BodyAccelerationZTimeMean | Mean of the body acceleration on the Z axis. |
| BodyAccelerationZTimeStdDev | Standard deviation of the body acceleration on the Z axis. |
| BodyAngularVelocityMagnitudeTimeMean |  Mean of the magnitude angular velocity of the body. |
| BodyAngularVelocityMagnitudeTimeStdDev | Standard deviation of the magnitude angular velocity of the body. |
| BodyAngularVelocityXTimeMean | Mean of the angular velocity of the body on the X axis. |
| BodyAngularVelocityXTimeStdDev | Standard deviation of the angular velocity of the body on the X axis. |
| BodyAngularVelocityYTimeMean | Mean of the angular velocity of the body on the Y axis. |
| BodyAngularVelocityYTimeStdDev | Standard deviation of the angular velocity of the body on the Y axis. |
| BodyAngularVelocityZTimeMean | Mean of the angular velocity of the body on the Z axis. |
| BodyAngularVelocityZTimeStdDev | Standard deviation of the angular velocity of the body on the Z axis. |
| BodyBodyAngularVelocityMagnitudeFrequencyMean | Mean of the FFT of the magnitude of the angular velocity of the body. |
| BodyBodyAngularVelocityMagnitudeFrequencyStdDev | Standard deviation of the FFT of the magnitude of the angular velocity of the body. |
| BodyBodyGyroMagnitudeFrequencyMean | Mean of the FFT of magnitude of the gyro signal. |
| BodyBodyGyroMagnitudeFrequencyStdDev | Standard deviation of the FFT of magnitude of the gyro signal. |
| BodyBodyLinearAccelerationMagnitudeFrequencyMean | Mean of the FFT of the magnitude of the linear acceleration of the body. |
| BodyBodyLinearAccelerationMagnitudeFrequencyStdDev | Standard deviation of the FFT of the magnitude of the linear acceleration of the body. |
| BodyGyroMagnitudeTimeMean | Mean of the magnitude of the gyro signal. |
| BodyGyroMagnitudeTimeStdDev | Standard deviation of the magnitude of the gyro signal. |
| BodyGyroXFrequencyMean | Mean of the FFT of the gyro signal on the X axis. |
| BodyGyroXFrequencyStdDev | Standard deviation of the FFT of the gyro signal on the X axis. |
| BodyGyroXTimeMean | Mean of the gyro signal on the X axis. |
| BodyGyroXTimeStdDev | Standard deviation of the gyro signal on the X axis. |
| BodyGyroYFrequencyMean | Mean of the FFT of the gyro signal on the Y axis. |
| BodyGyroYFrequencyStdDev | Standard deviation of the FFT of the gyro signal on the Y axis. |
| BodyGyroYTimeMean | Mean of the gyro signal on the Y axis. |
| BodyGyroYTimeStdDev | Standard deviation of the gyro signal on the Y axis. |
| BodyGyroZFrequencyMean | Mean of the FFT of the gyro signal on the Z axis. |
| BodyGyroZFrequencyStdDev | Standard deviation of the FFT of the gyro signal on the Z axis. |
| BodyGyroZTimeMean | Mean of the gyro signal on the Z axis. |
| BodyGyroZTimeStdDev | Standard deviation of the gyro signal on the Z axis. |
| BodyLinearAccelerationMagnitudeTimeMean | Mean of the magnitude of the linear acceleration of the body. |
| BodyLinearAccelerationMagnitudeTimeStdDev | Standard deviation of the magnitude of the linear acceleration of the body. |
| BodyLinearAccelerationXFrequencyMean | Mean of the FFT of the linear acceleration of the body on the X axis. |
| BodyLinearAccelerationXFrequencyStdDev | Standard deviation of the FFT of the linear acceleration of the body on the X axis. |
| BodyLinearAccelerationXTimeMean | Mean of the linear acceleration of the body on the X axis. |
| BodyLinearAccelerationXTimeStdDev | Standard deviation of the linear acceleration of the body on the X axis. |
| BodyLinearAccelerationYFrequencyMean | Mean of the FFT of the linear acceleration of the body on the Y axis. |
| BodyLinearAccelerationYFrequencyStdDev | Standard deviation of the FFT of the linear acceleration of the body on the Y axis. |
| BodyLinearAccelerationYTimeMean | Mean of the linear acceleration of the body on the Y axis. |
| BodyLinearAccelerationYTimeStdDev | Standard deviation of the linear acceleration of the body on the Y axis. |
| BodyLinearAccelerationZFrequencyMean |  Mean of the FFT of the linear acceleration of the body on the Z axis. |
| BodyLinearAccelerationZFrequencyStdDev |  Standard deviation of the FFT of the linear acceleration of the body on the Z axis. |
| BodyLinearAccelerationZTimeMean | Mean of the linear acceleration of the body on the Z axis. |
| BodyLinearAccelerationZTimeStdDev | Standard deviation of the linear acceleration of the body on the Z axis. |
| GravityAccelerationMagnitudeTimeMean | Mean of the magnitude of the gravity acceleration. |
| GravityAccelerationMagnitudeTimeStdDev | Standard deviation of the magnitude of the gravity acceleration. |
| GravityAccelerationXTimeMean | Mean of the gravity acceleration on the X axis. |
| GravityAccelerationXTimeStdDev | Standard deviation of the gravity acceleration on the X axis. |
| GravityAccelerationYTimeMean | Mean of the gravity acceleration on the Y axis. |
| GravityAccelerationYTimeStdDev | Standard deviation of the gravity acceleration on the Y axis. |
| GravityAccelerationZTimeMean | Mean of the gravity acceleration on the Z axis. |
| GravityAccelerationZTimeStdDev | Standard deviation of the gravity acceleration on the Z axis. |

