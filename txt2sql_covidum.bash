#!/usr/bin/env bash

# This is script to generate files and sql scripts to create tables, constraints & insert data in a sql database (only Postgres tested but should work with other db)

# You have to file the name of the zip file (no path & no extension) as first argument
zip_filename=$1
zip_folder=zip_files
input_folder=input
csv_folder=covidom_csv

if [[ ! -f $zip_folder/$zip_filename.zip ]] ; then
    echo "File $zip_filename.zip is not there, aborting."
    return
fi


# unzip zip_files/*
mkdir -R $input_folder/$zip_filename
unzip $zip_folder/$zip_filename.zip -d $input_folder/${zip_filename%.zip}/

nb_files_zip=$(ls -1q $input_folder/* | wc -l)
echo "unzipped $nb_files files"

mkdir $csv_folder

# convert "|" delimited csv files to comma delimited
for filepath in ./$input_folder/$zip_filename/*.txt; do
    filename="$(basename -- $filepath)"
    if [[ ! $filename == *"metadata.txt" ]]
    then
      csvformat -d "|" "$filepath" > "$csv_folder/${filename%.txt}.csv"
      echo creating ${filename%.txt}.csv
    fi
done

nb_files=$(ls -1q $csv_folder | wc -l)
echo "created $nb_files files"

# Ouput a script with create table with no constraints
# csvsql -d "," -i postgresql $csv_folder/*.csv > covidom_db_create_tbls.sql

# rm -rf $input_folder
# rm -rf $csv_folder
