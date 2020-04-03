#!/usr/bin/env bash

# This is script to generate files and sql scripts to create tables, constraints in a sql database (only Postgres tested but should work with other db)
if [[ -z $1 ]] ; then
    echo "You need to give the zip file name as 1st argument, aborting."
    return
fi

no_inference=$2
echo "no inference $no_inference"

# You have to file the name of the zip file (no path & no extension) as first argument
zip_filename=$1
zip_folder=zip_files
input_folder=tmp_input
csv_folder=covidom_csv
csv_comp=csv_comp
# insert_script=covidom_db_insert_tbls.sql
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
echo "created $nb_files files"

# Ouput a script with create table with no constraints
# Time consuming operation, use "--no-inference" to test quickly
if [ "$no_inference" = true ] ; then
  noinf_opt="--no-inference"
  echo "no inference"
else
  noinf_opt=""
  echo "type inference..."
fi
csvsql $noinf_opt -d "," -i postgresql $csv_folder/*.csv > $csv_folder/$create_script


echo "create_script created"


echo "alter_script copied"
cp $sql_scripts/$alter_script $csv_folder/$alter_script

# Execute sql files to create tables, create constraint & insert data
# create tables
echo "execution of scripts in Docker"
docker exec -it covidom psql -h localhost -p 5432 -U $DB_USER -d $DB -w -f $csv_folder/$create_script
# create constraints
# TODO
docker exec -it covidom psql -h localhost -p 5432 -U $DB_USER -d $DB -w -f $csv_folder/$alter_script

# save sql scripts
cp $csv_folder/$create_script $sql_scripts/$create_script

# Clean
rm -rf $input_folder
rm -rf $csv_folder
