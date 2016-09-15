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

```
mkdir bamboo-stack
```

```
cd bamboo-stack
```

```
wget https://raw.githubusercontent.com/matisku/bamboo-docker/master/docker-compose.yml
```

```
docker-compose up -d .
```
This will create a new docker stack called `bamboo-stack`

## Bamboo Server
Once stack will start, provide a license. If you are using `docker-compose.yml` from my repository, as a database hostname use `postgres` and for database user and password use `bamboo`.

## Bamboo Agent
Once stack will start, go to Bamboo Server Administration->Agents and disable remote agent authentication. This will add any new agent automatically to the Bamboo Server. If there is a need to have remote agent authentication enabled, enable each agent manually.

## Variables

Bamboo Server:  
* `BAMBOO_HOME` - Bamboo home directory (default `/home/bamboo`)
* `BAMBOO_VERSION` - The version to install an run (default `5.13.0.1`)
* `BAMBOO_BAMBOO_SERVER_ID` - Used for agent authentication withing docker-compose (default `bamboo-server`)

Database:  
* `PGDATA` - Database Storage Folder
* `POSTGRES_DB` - Database Name
* `POSTGRES_USER` - Database User
* `POSTGRES_PASSWORD` - Database Password  
 
Bamboo Agent:  
* `AGENT_VERSION` - This should match the version of Bamboo Server
* `BAMBOO_SERVER` - URL or IP of Bamboo Server where agent should be attached
* `BAMBOO_SERVER_PORT` - External port of Bamboo Server UI. In case of using docker-compose stack, this can be linked name.
* `PACKAGES` - space separated list of additional packages which should be installed on Bamboo Agent  

## Metadata
* [matisq/bamboo-server](https://hub.docker.com/r/matisq/bamboo-server/) [![](https://images.microbadger.com/badges/image/matisq/bamboo-server.svg)](http://microbadger.com/images/matisq/bamboo-server "Get your own image badge on microbadger.com")  

* [matisq/bamboo-agent](https://hub.docker.com/r/matisq/bamboo-agent/) [![](https://images.microbadger.com/badges/image/matisq/bamboo-agent.svg)](http://microbadger.com/images/matisq/bamboo-agent "Get your own image badge on microbadger.com")

## Contributors
Any forks are welcome!
