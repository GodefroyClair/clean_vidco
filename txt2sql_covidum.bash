#!/usr/bin/env bash

# This is script to generate files and sql scripts to create tables, constraints & insert data in a sql database (only Postgres tested but should work with other db)

# You have to file the name of the zip file (no path & no extension) as first argument
zip_filename=$1
echo '$1:' $1
zip_folder=zip_files
input_folder=tmp_input
csv_folder=covidom_csv
insert_script=covidom_db_insert_tbls.sql
create_script=covidom_db_create_tbls.sql
alter_scrupt=covidom_db_alter_tbls.sql

if [[ ! -f $zip_folder/$zip_filename.zip ]] ; then
    echo "No file $zip_filename.zip in $zip_folder, aborting."
    return
fi


# unzip
mkdir -p $input_folder/$zip_filename
unzip $zip_folder/$zip_filename.zip -d $input_folder/${zip_filename%.zip}/

nb_files_zip=$(ls -1q $input_folder/* | wc -l)
echo "unzipped $nb_files files"

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
# Time consuming operation, use "--no-inference" to test quickly
csvsql -d "," -i postgresql $csv_folder/*.csv > $csv_folder/$create_script

# create insert data sql script
touch $csv_folder/$insert_script
echo "-- this a script to populate data in db\n" > $csv_folder/$insert_script
for csv in ./$csv_folder/*.csv; do
  csv_filename="$(basename -- $csv)"
  table=${csv_filename%.csv}
  echo "COPY $table FROM '/covidom_csv/$table.csv' DELIMITER ',' CSV HEADER;\n" >> $csv_folder/$insert_script
done

# Execute sql files to create tables, create constraint & insert data
# create tables
docker exec -it covidom psql -h localhost -p 5432 -U $DB_USER -d $DB -w -f $csv_folder/$create_script
# create constraints
# docker exec -it covidom psql -h localhost -p 5432 -U $DB_USER -d $DB -w -f covidom_db_alter_tbls.sql
# insert data from csv
docker exec -it covidom psql -h localhost -p 5432 -U $DB_USER -d $DB -w -f $csv_folder/covidom_db_insert_tbls.sql

# Clean
rm -rf $input_folder
rm -rf $csv_folder/*
