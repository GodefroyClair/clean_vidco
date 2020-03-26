# Dependencies

install docker
https://docs.docker.com/install/

create env if necessary & install libraries
```
# install python>=3.3
$ conda create -n covidom python=3.7
# install csvkit
$ pip install csvkit
```

# Create a .env file

Insert the following lines with values in a .env file:
```
export DB_USER=XXXX
export DB_PWD=XXXX
export DB=XXX
export PG_PASSWORD=DB_PWD
```

Execute the .env
```
$ source .env
```

# Execute bash script to generate csv files & table create cmd from txt file
```
$ mkdir covidom_cs
$ source txt2sql_covidom.bash
```

# Create postgres db docker container with a connexion to covidom_csv folder to allow postgres access to the data
```
$ docker run --name covidom -v `pwd`/covidom_csv:/covidom_csv -e POSTGRES_USER=$DB_USER -e POSTGRES_PASSWORD=$DB_PWD -e POSTGRES_DB=$DB -p 5432:5432 -d postgres
# FYI, if necessary /!\, to delete postgres the container: $ docker rm -f covidom
```

# Execute sql files to create tables, create constraint & insert data
```
# create tables
$ psql -h localhost -p 5432 -U godot -d aphp -w -f covidom_db_create_tbls.sql
# create constraints
$ psql -h localhost -p 5432 -U godot -d aphp -w -f covidom_db_alter_tbls.sql
# insert data from csv
$ psql -h localhost -p 5432 -U godot -d aphp -w -f covidom_db_insert_tbls.sql
```

# TODO
generate a graph of the db
