#! /usr/bin/env bash

ROOT=$(cd $(dirname $0) && pwd)
URL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
DATASET="UCI HAR Dataset"

set -e # exit on error
cd "$ROOT"

if [ ! -d "$DATASET" ] ; then
    curl -# -o dataset.zip "$URL"
    unzip dataset.zip && rm dataset.zip
fi

cd "$DATASET"
exec R --slave --file="$ROOT/run_analysis.R"

