#!/usr/bin/env bash

# This is script to generate files and sql scripts to create tables, constraints & insert data in a sql database (only Postgres tested but should work with other db)
if [[ -z $1 ]] ; then
    echo "You need to give the zip file name as 1st argument, aborting."
    return
fi

# You have to file the name of the zip file (no path & no extension) as first argument
zip_filename=$1
zip_folder=zip_files
input_folder=tmp_input
csv_folder=covidom_csv
insert_script=covidom_db_insert_tbls.sql
create_script=covidom_db_create_tbls.sql
alter_script=covidom_db_alter_tbls.sql
sql_scripts=sql_script

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

# create insert data sql script
touch $csv_folder/$insert_script
echo "-- this a script to populate data in db\n" > $csv_folder/$insert_script
for csv in ./$csv_folder/*.csv; do
  csv_filename="$(basename -- $csv)"
  table=${csv_filename%.csv}
  echo "DELETE $table;\n" >> $csv_folder/$insert_script
  echo "COPY $table FROM '/covidom_csv/$table.csv' DELIMITER ',' CSV HEADER;\n" >> $csv_folder/$insert_script
done

echo "insert_script created"

# Execute sql files to create tables, create constraint & insert data
# create tables
echo "execution of insert scripts in Docker"
# create constraints
# insert data from csv
docker exec -it covidom psql -h localhost -p 5432 -U $DB_USER -d $DB -w -f $csv_folder/$insert_script

# save sql scripts
cp $csv_folder/$insert_script $sql_scripts/$insert_script

# Clean
rm -rf $input_folder
rm -rf $csv_folder
