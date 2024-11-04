# Docker-Compose for guacamole 
## 1. clone the repo:
switch into the folder of your choice, e.g. /opt/docker and run
```
git clone https://github.com/GerryCrooked/guacamole
```

## 2. change the environment variables in the .env
- MYSQLDBRootPass: the Root Password you want to use for your DB <br>
- MYSQLDBUser: the Useraccount to access the DB <br>
- MYSQLDBUserPass: the password of the Useraccount accessing the DB <br>
- HOSTPORT: the Port you want to access guacamole <br>

## 3. start the container
```
 docker compose up -d
```
## 4. wait a minute, navigate to your instance and login <3
default login credentials are: <br>
username: guacadmin <br>
password: guacadmin
