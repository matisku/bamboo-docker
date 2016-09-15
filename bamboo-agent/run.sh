#!/bin/bash

cd $HOME

if [ -n ${AGENT_VERSION} ] && [ -n ${BAMBOO_SERVER} ] && [ -n ${BAMBOO_SERVER_PORT} ]
then
  echo "Provided Data:"
  echo "AGENT_VERSION: "${AGENT_VERSION}
  echo "BAMBOO_SERVER: "${BAMBOO_SERVER}
  echo "BAMBOO_SERVER_PORT: "${BAMBOO_SERVER_PORT}
  echo "Downloading Bamboo Agent from Bamboo Server."
  wget http://${BAMBOO_SERVER}:${BAMBOO_SERVER_PORT}/agentServer/agentInstaller/atlassian-bamboo-agent-installer-${AGENT_VERSION}.jar
  if [ $? == "0" ]
  then
    echo "Starting Bamboo Agent."
    java -jar atlassian-bamboo-agent-installer-${AGENT_VERSION}.jar http://${BAMBOO_SERVER}:${BAMBOO_SERVER_PORT}/agentServer/
  else
    echo "Problem with downloading data from ${BAMBOO_SERVER}"
    exit 2
  fi
else
  echo "Not all needed data was provided."
  echo "AGENT_VERSION: "${AGENT_VERSION}
  echo "BAMBOO_SERVER: "${BAMBOO_SERVER}
  echo "BAMBOO_SERVER_PORT: "${BAMBOO_SERVER_PORT}
  echo "Exiting."
fi
