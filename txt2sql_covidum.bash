#!/usr/bin/env bash

# convert pipe delimited csv files to comma delimited
for filepath in ./input/*.txt; do
    filename="$(basename -- $filepath)"
    if [[ ! $filename == *"metadata.txt" ]]
    then
      echo $filename
      csvformat -d "|" "$filepath" > "./covidom_csv/${filename%.txt}.csv"
    fi
done

# create table with no constraints
csvsql -d "," -i postgresql covidom_csv/*.csv > covidom_db_create_tbls.sql
