Getting and Cleaning Data - Course Project
==========================================

Introduction
------------

This folder contains the Course Project for the course Getting and Cleaning Data, given by John Hopkins University in Coursera website.

The objective of the course is learning to transform the raw data into tidy data, an usual operation in data research.

Original data
-------------

The original (raw) data are files were extracted from the UCI HAR Dataset and saved in the ./UCI HAR Dataset folder included in this repository.

You can read the raw data details in this website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was originally downloaded from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

But you should only use the data provided by this repository, because the original data may have changed.

Script
------

This package contains a script run_analysis.R, which loads the raw data from the UCI HAR Dataset folder, performs a transformation into a tidy data and saves the output in the same directory where the script is. The file is named: tidy-dataset.txt.

Requirements
------------

If you want to run the script, you will need:

- R installed in your computer. You shouldn't need to install any additional packages.

- Download this folder into your local computer.

- You need writing permissions in the cloned folder, because the script uses a cache mechanism, which was very useful in development, because the initial raw data loading is very expensive. A /tmp/ folder will be created in the same folder that this file is.

Execution
---------

- Start R and set your working directory in the same directory that this README file is in.

- In R, execute this code:

    source("run_analysis.R");

Code book
---------

The file CodeBook.md explains the transformations performed and the resulting data variables.
