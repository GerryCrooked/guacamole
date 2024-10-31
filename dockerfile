FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=${MYSQLDBRootPass}
ENV MYSQL_DATABASE=guacamole_db
ENV MYSQL_USER=${MYSQLDBUser}
ENV MYSQL_PASSWORD=${MYSQLDBUserPass}

COPY initdb.sql /docker-entrypoint-initdb.d/
