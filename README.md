
# Create a .env file
```
$ touch .env
```

Insert the following lines with values in the file:
export USER=XXXX
export PWD=XXXX
export DB=XXX

# Create postgres db in a docker
```
$ docker run --name covidum -v `pwd`:`pwd` -e POSTGRES_USER=$USER -e POSTGRES_PASSWORD=$PWD -e POSTGRES_DB=$DB -p 5432:5432 -d postgres
```

# Connect

## exec & fill in the password
```
$ psql -h localhost -p 5432 -U godot -d aphp -W
```
