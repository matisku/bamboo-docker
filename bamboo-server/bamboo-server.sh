#!/usr/bin/env bash

set -e # Exit on errors

echo "-> Starting Bamboo Server ..."
echo "   - BAMBOO_VERSION: ${BAMBOO_VERSION}"
echo "   - BAMBOO_HOME:    ${BAMBOO_HOME}"

mkdir -p $BAMBOO_HOME

BAMBOO_DIR=/opt/atlassian-bamboo-${BAMBOO_VERSION}

if [ -d ${BAMBOO_DIR} ]; then
  echo "-> Bamboo ${BAMBOO_VERSION} already found at ${BAMBOO_DIR}. Skipping download."
else
  BAMBOO_TARBALL_URL=http://downloads.atlassian.com/software/bamboo/downloads/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz
  echo "-> Downloading Bamboo ${BAMBOO_VERSION} from ${BAMBOO_TARBALL_URL} ..."
  wget --progress=dot:mega ${BAMBOO_TARBALL_URL} -O /tmp/atlassian-bamboo.tar.gz
  echo "-> Extracting to ${BAMBOO_DIR} ..."
  tar xzf /tmp/atlassian-bamboo.tar.gz -C /opt
  rm -f /tmp/atlassian-bamboo.tar.gz
  echo "-> Installation completed"
fi

# Uncomment to increase Tomcat's maximum heap allocation
# export JAVA_OPTS=-Xmx512M $JAVA_OPTS

echo "-> Running Bamboo server ..."
${BAMBOO_DIR}/bin/catalina.sh run &

sleep 30

# Set proper name of Bamboo Server
if [ -n ${BAMBOO_SERVER_ID} ]
then
  HOST_TO_REPLACE=`hostname`
  sed -i 's/'${HOST_TO_REPLACE}'/'${BAMBOO_SERVER_ID}'/g' ${BAMBOO_HOME}/bamboo.cfg.xml
fi

${BAMBOO_DIR}/bin/catalina.sh stop
${BAMBOO_DIR}/bin/catalina.sh run &

# Kill Bamboo process on signals from supervisor
trap 'kill $(jobs -p)' SIGINT SIGTERM EXIT

# Wait for Bamboo process to terminate
wait $(jobs -p)
