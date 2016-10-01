# Getting and Cleaning Data Course Project

This repository contains scripts for the Getting and Cleaning Data
Course Project that obtain the  UCI HAR data set and run an analysis
on it.

The variables in the final dataset are described in the
[codebook](CODEBOOK.md).

## Running the Analysis

Executing script [run.sh](run.sh) in the cloned repository will
automatically download the [dataset
archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and invoke the analysis script. The analysis will write its results
to the file ``averages.txt`` in the dataset directory.

To run the [run_analysis.R](run_analysis.R) script by hand, change
to the directory with the extracted dataset and unvoke ``R`` to run
the analysis. For example:

    $ cd UCI\ HAR\ Dataset
    $ R --slave --file=../run_analysis.R
    ...
    $ ls -l averages.txt
    -rw-r--r--  1 jpeach  staff  807360 Oct  1 09:45 averages.txt

## Rationale

### Interpreting mean measurements

The original dataset contains measurements whose names include the
``meanFreq()`` tag and the ``mean()`` tag. ``meanFreq()`` means the
weighted average of the frequency components to obtain a mean
frequency, whereas ``mean()`` is simply the mean value of the final
processed measurement.

The assignment brief asks for the mean and standard deviation of
each measurement. Since mean and weighted average are different
calculations, it would be misleading to collect them into a single
variable.
