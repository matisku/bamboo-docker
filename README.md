# Bamboo for Docker

Set of docker images to install [Atlassian Bamboo Agent](https://www.atlassian.com/software/bamboo) based on [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).

## Info
This is a part of a [Bamboo Stack](https://github.com/matisku/bamboo-docker). You can download [docker-compose.yml](https://github.com/matisku/bamboo-docker/blob/master/docker-compose.yml) and check out how it works!

## What's in stack?
`bamboo-server` - Bamboo Server  
`bamboo-data` - Bamboo Volume Storage  
`postgres` - Database Server  
`postgres-data` - Database Volume Storage  
`bamboo-agent` - Bamboo Agent  

## Usage
Place [docker-compose.yml](https://github.com/matisku/bamboo-docker/blob/master/docker-compose.yml) in your PWD and run:
'''
docker-compose up -d .
'''

## Variables

Bamboo Server:  
* `BAMBOO_HOME` - Bamboo home directory (default `/home/bamboo`)
* `BAMBOO_VERSION` - The version to install an run (default `5.13.0.1`)
* `BAMBOO_BAMBOO_SERVER_ID` - Used for agent authentication withing docker-compose (default `bamboo-server`)

Database:  
* `PGDATA` - Database Storage Folder
* `POSTGRES_DB` - Database Name
* `POSTGRES_USER` - Database User
* `POSTGRES_PASSWORD` - Database Passwoed
 
Bamboo Agent:  
* `AGENT_VERSION` - This should match the version of Bamboo Server
* `BAMBOO_SERVER` - URL or IP of Bamboo Server where agent should be attached
* `BAMBOO_SERVER_PORT` - External port of Bamboo Server UI. In case of using docker-compose stack, this can be linked name.

## Contributors
Any forks are welcome!
