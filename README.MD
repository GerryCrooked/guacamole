# Docker-Compose for guacamole in Portainer

## Docker-Compose File:
```
services:
  guacd:
    container_name: guacd
    image: guacamole/guacd:latest
    restart: unless-stopped
    networks:
      guac-net:
      
  guacdb:
    container_name: guacdb
    image: mysql:latest
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQLDBRootPass}
      MYSQL_DATABASE: 'guacamole_db'
      MYSQL_USER: ${MYSQLDBUser}
      MYSQL_PASSWORD: ${MYSQLDBUserPass}
    #ports:
     # - 3306:3306
    volumes:
      - /opt/docker/guac/db-data:/var/lib/mysql
    networks:
      guac-net:
 
  guacamole:
    container_name: guacamole
    image: guacamole/guacamole:latest
    restart: unless-stopped
    ports:
      - 8082:8080
    volumes:
    - /opt/docker/guac/drive:/drive
    environment:
      GUACD_HOSTNAME: "guacd"
      MYSQL_HOSTNAME: "guacdb"
      MYSQL_DATABASE: "guacamole_db"
      MYSQL_USER: ${MYSQLDBUser}
      MYSQL_PASSWORD: ${MYSQLDBUserPass}
      TOTP_ENABLED: "true"
    depends_on:
      - guacdb
      - guacd
    networks:
      guac-net:
volumes:
  db-data:
#  drive:
#  record:
networks:
  guac-net:
```
## add the environment variables in portainer and define them:
MYSQLDBRootPass <br>
MYSQLDBUser <br>
MYSQLDBUserPass <br>

## initialize DB
```
 docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
```
now start your stack in portainer
```
 docker cp initdb.sql guacdb:/guac_db.sql 
```
enter into your container and login to your mysql server 
```
docker exec -it guacdb bash
mysql -u root -p
```
enter your root password as per environment variable. <br> copy the statement below and change "USERNAME" to the environment variable MYSQLDBUser
```
 GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'USERNAME'@'%';
 FLUSH PRIVILEGES;
 exit;
```

## restart your stack and you should be fine
