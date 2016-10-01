# Getting and Cleaning Data Course Project

This repository contains scripts for the Getting and Cleaning Data
Course Project that obtain the  UCI HAR data set and run an analysis
on it.

The variables in the final dataset are described in the
[codebook](CODEBOOK.md).

The following files are included:

| File | Purpose |
|------|---------|
| [CODEBOOK.md](CODEBOOK.md) | This final dataset codebook including various rationales |
| [README.md](README.md) | This explanatory text. |
| [run.sh](run.sh) | Bash script to download the UCI dataset and run the analysis. |
| [run_analysis.R](run_analysis.R) | R script that actually performs the analysis. |

## Running the analysis wih run.sh

Executing script [run.sh](run.sh) in the cloned repository will
automatically download the [dataset
archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and invoke the analysis script. The analysis will write its results
to the file ``averages.txt`` in the dataset directory.

    CourseraDataCleaningAssignment jpeach$ ./run.sh
    ...
    [1] "reading dataset metadata"
    [1] "reading 'test' dataset"
    [1] "reading 'train' dataset"
    [1] "rewriting activities with activity names"
    [1] "labelling with descriptive variable names"
    [1] "creating grouped averages"
    [1] "writing results to averages.txt"
    CourseraDataCleaningAssignment jpeach$ ls -l UCI\ HAR\ Dataset/averages.txt
    -rw-r--r--  1 jpeach  staff  812400 Oct  1 12:31 UCI HAR Dataset/averages.txt

## Running the analysis by hand

To run the [run_analysis.R](run_analysis.R) script by hand, change
to the directory with the extracted dataset and invoke ``R`` to run
the analysis. For example:

    $ cd UCI\ HAR\ Dataset
    $ R --slave --file=../run_analysis.R
    ...
    $ ls -l averages.txt
    -rw-r--r--  1 jpeach  staff  807360 Oct  1 09:45 averages.txt

## Rationale

A number of choices we made in the processing of the dataset that
the assignment brief does not give specific guidance on. The
[codebook](CODEBOOK.md) explains the
[selection of mean measurements](CODEBOOK.md#interpreting-mean-measurements),
[whether the UCI dataset itself should be tidied](CODEBOOK.md#tidying-uci-measurements)
and how UCI measurements were
[renamed](CODEBOOK.md#measurement-nomencalature).
