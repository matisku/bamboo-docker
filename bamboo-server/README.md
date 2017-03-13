# Bamboo Server

[matisq/bamboo-server](https://hub.docker.com/r/matisq/bamboo-agent/) is a docker image to install [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) based on [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker) and [hwuethrich/docker-images](https://github.com/hwuethrich/docker-images/tree/master/bamboo-server)

## Documentation
[Here](https://github.com/matisku/bamboo-docker/blob/master/doc/README.md) you can find info how to setup [Bamboo on Rancher](https://github.com/matisku/bamboo-docker/blob/master/doc/README.md).

## Info
This is a part of a [Bamboo Stack](https://github.com/matisku/bamboo-docker). You can download [docker-compose.yml](https://github.com/matisku/bamboo-docker/blob/master/docker-compose.yml) and check out how it works!

**Bamboo Stack** is also available in my custom [rancher-stack](https://github.com/matisku/rancher-catalog), so with just a few clicks you can use, scale and upgrade it!

## Usage

It's as simple as:

```bash
$ docker run -d matisq/bamboo-server
```

### Customize exposed ports

By default, the ports `8085` (admin interface) and `54663` (agent server) are mapped to random ports on the docker host. To customize, run:

```bash
$ docker run -p 8085:8085 -p 54663:54663 matisq/bamboo-server
```

I created a dedicated agent to be used with that server: [matisq/bamboo-agent](https://hub.docker.com/r/matisq/bamboo-agent/)

### Running a different Bamboo version

By default, the container downloads and installs Bamboo v5.15.3 on the first boot. To specify which version to install, set the environment variable `BAMBOO_VERSION`:

```bash 
$ docker run -e BAMBOO_VERSION=5.15.3 -d matisq/bamboo-server
```

### Combined options

The following example shows the options I use for our CI environment:

```bash 
docker run --name=bamboo-server \
   JAVA_OPTS=-Xmx1024m -e BAMBOO_VERSION=5.14.1 \
   -e BAMBOO_BAMBOO_SERVER_ID=myhost.local \
  -v /opt/bamboo-server:/home/bamboo -p 8085:8085 -p 54663:54663 \
  -d matisq/bamboo-server
```

## Directories

* `/opt/atlassian-bamboo-$BAMBOO_VERSION` - Bamboo installation directory
* `/home/bamboo` - Bamboo home directory (`BAMBOO_HOME`)

## Variables

* `BAMBOO_HOME` - Bamboo home directory (default `/home/bamboo`)
* `BAMBOO_VERSION` - The version to install an run (default `5.15.3`)
* `BAMBOO_BAMBOO_SERVER_ID` - Used for agent authentication withing docker-compose (default `bamboo-server`)

## Exposed ports

* `8085` - Bamboo admin interface
* `54663` - Bamboo agent server

## Metadata
[![](https://images.microbadger.com/badges/image/matisq/bamboo-server.svg)](http://microbadger.com/images/matisq/bamboo-server "Get your own image badge on microbadger.com")

## Contributors
Any forks are welcome!
