#!/bin/bash

## Installing requested packages
if [ "${PACKAGES}" != "" ]
then
  echo "Packages to install: "${PACKAGES}
  apt-get -q update &&\
  DEBIAN_FRONTEND="noninteractive" apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends &&\
  DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew" --no-install-recommends ${PACKAGES} &&\
  apt-get -q autoremove &&\
  apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin && rm -f /var/tmp/
else
  echo "Nothing to install."
fi

cd $HOME
# Function used to validate if JAR File Exists
function validate_url(){
  if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]
  then 
    echo "true"
  fi
}

# Download Bamboo Agent
if [ -n ${AGENT_VERSION} ] && [ -n ${BAMBOO_SERVER} ] && [ -n ${BAMBOO_SERVER_PORT} ]
then
  SLEEP="120"
  echo "Provided Data:"
  echo "AGENT_VERSION: "${AGENT_VERSION}
  echo "BAMBOO_SERVER: "${BAMBOO_SERVER}
  echo "BAMBOO_SERVER_PORT: "${BAMBOO_SERVER_PORT}
  AGENT_JAR="http://${BAMBOO_SERVER}:${BAMBOO_SERVER_PORT}/agentServer/agentInstaller/atlassian-bamboo-agent-installer-${AGENT_VERSION}.jar"
  CHECK_AGENT_JAR=`validate_url $AGENT_JAR`
  echo "AGENT_JAR: "${AGENT_JAR}
  echo "###############################################"
  echo ""
  echo "Downloading Bamboo Agent from Bamboo Server: ${BAMBOO_SERVER}..."
  echo "Checking if Bambo Server is setup..."
  if [ ${CHECK_AGENT_JAR}=="true" ]
  then
    echo "Found Bamboo Agent at ${AGENT_JAR}"
    wget -c ${AGENT_JAR}
    if [ $? == "0" ]
    then
      echo "Starting Bamboo Agent."
      java -jar atlassian-bamboo-agent-installer-${AGENT_VERSION}.jar http://${BAMBOO_SERVER}:${BAMBOO_SERVER_PORT}/agentServer/
    else
      echo "Problem with downloading data from ${BAMBOO_SERVER}"
      echo "Could not find ${AGENT_JAR}"
      echo "Is Bambo Server already configured?"
      echo "Sleeping for ${SLEEP}s"
      sleep ${SLEEP}
    fi
  else
    echo "Waiting for a Bamboo Server Setup..."
    echo "Sleeping for ${SLEEP}s"
    sleep ${SLEEP}
  fi
else
  echo "Not all needed data was provided."
  echo "AGENT_VERSION: "${AGENT_VERSION}
  echo "BAMBOO_SERVER: "${BAMBOO_SERVER}
  echo "BAMBOO_SERVER_PORT: "${BAMBOO_SERVER_PORT}
  echo "Exiting."
fi
