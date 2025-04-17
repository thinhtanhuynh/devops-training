# Kubernetes Training - Module 1

## Table of Contents
- [Overview](#overview)
- [Homework 1: Basic Ubuntu file and directory operations](#homework-1-basic-ubuntu-file-and-directory-operations)
- [Homework 2: Advanced Ubuntu file operations](#homework-2-advanced-ubuntu-file-operations)
- [Homework 3: Basic Docker operations](#homework-3-basic-docker-operations)
- [Homework 4: Advanced Docker operations](#homework-4-advanced-docker-operations)

## Overview
This module covers fundamental Ubuntu & Docker operations.

## Homework 1: Basic Ubuntu file and directory operations

### Requirements
- Create a directory named infra-hm in home directory.
- Inside infra-hm, create a file named note.txt and write anything in it.
- Copy note.txt to /tmp and rename it to note_tmp.txt.
- Delete the note.txt file from infra-hm.

### Solution

#### 1. Create a directory named infra-hm in home directory
```bash
mkdir -p ~/infra-hm
```

#### 2. Inside infra-hm, create a file named note.txt and write anything in it
```bash
echo "Hello, World!" > ~/infra-hm/note.txt
```

#### 3. Copy note.txt to /tmp and rename it to note_tmp.txt
```bash
cp ~/infra-hm/note.txt /tmp/note_tmp.txt
```

#### 4. Delete the note.txt file from infra-hm
```bash
rm ~/infra-hm/note.txt
```

## Homework 2: Advanced Ubuntu file operations

### Requirements
- Use grep to find all files in /etc containing the word "password".
- Extract only the IP addresses from ifconfig or ip a.
- Format the output of df -h to show only disk name, size, and usage percentage.
- Create a file contains 1000 lines with random text and replace all instances of “w” to “q” using sed.
- Create a file called secrets.txt and set the permissions so that:
- The owner can read and write.
- The group can only read.
- Others cannot access it.

### Solution

#### 1. Use grep to find all files in /etc containing the word "password"
```bash
grep -r "password" /etc
```

#### 2. Extract only the IP addresses from ifconfig or ip a
```bash
ifconfig | grep -Eo 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk '{print $2}'
```

#### 3. Format the output of df -h to show only disk name, size, and usage percentage
```bash
df -h | awk '{print $1, $2, $5}'
```

#### 4. Create a file contains 1000 lines with random text and replace all instances of “w” to “q” using sed
```bash
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 1000 | head -n 1000 > random_text.txt
sed -i 's/w/q/g' random_text.txt
```

#### 5. Create a file called secrets.txt and set the permissions so that:
 - The owner can read and write.
 - The group can only read.
 - Others cannot access it.
```bash
echo "This is a secret file." > secrets.txt
chmod 640 secrets.txt
```

## Homework 3: Basic Docker operations

### Requirements
- Pull Postgres image with version 15.3.
- Custom that image with postgis extension.
- Run a Postgres container in detached mode without password, mapping port 2345 on the host to
5432 in the container, mount volume from path /var/lib/postgresql/data to D:\postgresdb\data.
- Check logs, add data.
- Stop and remove container.

### Solution

#### 1. Create a Dockerfile with below content
```Dockerfile
FROM postgres:15.3
RUN apt-get update && apt-get install -y postgis
RUN echo "CREATE EXTENSION postgis;" >> /docker-entrypoint-initdb.d/postgis.sql
```

#### 2. Build the Docker image
```bash
docker build -t postgres-postgis .
```

#### 3. Run a Postgres container in detached mode without password, mapping port 2345 on the host to 5432 in the container, mount volume from path /var/lib/postgresql/data to D:\postgresdb\data
```bash
docker run -d -p 2345:5432 -v D:\postgresdb\data:/var/lib/postgresql/data postgres-postgis
```

#### 4. Check logs, add data
```bash
docker logs postgres-postgis
```

#### 5. Stop and remove container
```bash
docker stop postgres-postgis
docker rm postgres-postgis
```

## Homework 4: Advanced Docker operations

### Requirements
Dockerizing a React App with Multi-Stage Build and NGINX.

### Solution

#### 1. Create a Dockerfile with below content
```Dockerfile
FROM node:18-alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```