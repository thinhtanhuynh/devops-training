#!/bin/bash

/*
# Homework 3
- Pull Postgres image with version 15.3.
- Custom that image with postgis extension.
- Run a Postgres container in detached mode without password, mapping port 2345 on the host to
5432 in the container, mount volume from path /var/lib/postgresql/data to D:\postgresdb\data.
- Check logs, add data.
- Stop and remove container.
*/

# Dockerfile
FROM postgres:15.3
RUN apt-get update && apt-get install -y postgis
RUN echo "CREATE EXTENSION postgis;" >> /docker-entrypoint-initdb.d/postgis.sql

# Build the image
docker build -t postgres-postgis .

# Run a Postgres container in detached mode without password, mapping port 2345 on the host to
# 5432 in the container, mount volume from path /var/lib/postgresql/data to D:\postgresdb\data.
docker run -d -p 2345:5432 -v D:\postgresdb\data:/var/lib/postgresql/data postgres-postgis

# Check logs, add data.
docker logs postgres-postgis

# Stop and remove container.
docker stop postgres-postgis
docker rm postgres-postgis

