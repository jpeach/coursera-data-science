library(stringr)

# The input is a dataset measurement name in one of the following forms:
#     tName-func()-X
#     tName-func()
#
# Produce a descriptive name based on information in the codebook.
# The final descriptive name contains up to 4 components.
#
#     - The signal name
#     - The (optional) axial direction
#     - The signal processing that was applied,  Euclidian Norm or Fast Fourier Transform
#     - The statistical function that was applied, Mean or StdDev (Standard Deviation).
#
# Names not matching the measurement forms are return unharmed.
#
# Examples:
#     fBodyAccJerk-std()-Z    BodyAccJerkZFourierTransformStdDev
#     fBodyAccMag-mean()      BodyAccMagFourierTransformMean

makeMeasurementName <- function(name) {
    mapSignal <- function(namePart) {
       leading <- str_sub(namePart, 1, 1)
       remainder <- str_sub(namePart, 2)

       if (leading == 't') {
           c(remainder, 'EuclidianNorm')
       } else {
           stopifnot(leading == 'f')
           c(remainder, 'FourierTransform')
       }
    }

    mapFunction <- function(funcName) {
        if (funcName == 'std()') {
            'StdDev'
        } else {
            stopifnot(funcName == 'mean()')
            'Mean'
        }
    }

    components <- unlist(str_split(name, '-'))

    if (length(components) == 3) {
        # Matches fBodyAccJerk-std()-Z.
        s <- mapSignal(components[1])
        str_c(s[1], components[3], s[2], mapFunction(components[2]))
    } else if (length(components) == 2) {
        # fBodyBodyGyroMag-std()
        s <- mapSignal(components[1])
        str_c(s[1], s[2], mapFunction(components[2]))
    } else {
        # Matches
        stopifnot(length(components) == 1)
        name
    }
}
