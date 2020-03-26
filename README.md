# Dependencies

python>=3.7
csvkit (pip install csvkit)
docker

# Create a .env file
```
$ touch .env
```

Insert the following lines with values in the file:

export USER=XXXX

export PWD=XXXX

export DB=XXX

# Create postgres db docker container
```
$ docker run --name covidom -v `pwd`/covidom_csv:/covidom_csv -e POSTGRES_USER=$USER -e POSTGRES_PASSWORD=$PWD -e POSTGRES_DB=$DB -p 5432:5432 -d postgres
```

# Delete postgres db docker container
```
$ docker rm -f covidom
```

# Connect

## exec & fill in the password
```
$ psql -h localhost -p 5432 -U godot -d aphp -W
```

# Execute first part
```
$ mkdir covidom_cs
$ source txt2sql_covidom.bash
```
