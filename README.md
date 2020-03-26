# Dependencies

Install docker
https://docs.docker.com/install/

Create env if necessary & install libraries
```
# install python>=3.3
$ conda create -n covidom python=3.7
$ conda activate covidom
# install csvkit
$ pip install csvkit
```

# Create a .env file

Insert the following lines with chosen values in a .env file:
```
export DB_USER=XXXX
export PG_PASSWORD=YYYYY
export DB=ZZZZ
```

Execute the .env & prepare
```
$ source .env
$ mkdir zip_files
$ mkdir covidom_csv
```

# Put zip file in zip_files folder

*manual task*

# Create postgres db docker container with a connexion to covidom_csv folder to allow postgres access to the data
```
$ docker run --name covidom -v `pwd`/covidom_csv:/covidom_csv -e POSTGRES_USER=$DB_USER -e POSTGRES_PASSWORD=$DB_PWD -e POSTGRES_DB=$DB -p 5432:5432 -d postgres
```
FYI, if necessary /!\, to delete postgres the container: $ docker rm -f covidom

# Execute bash script to generate csv files & table create cmd from txt file
```
# put the name of the zip file as an argument without the path & the extension
$ source txt2sql_covidom.bash NAME_OF_THE_FILE
```

# TODO
generate a dump of the table
generate a graph of the db
