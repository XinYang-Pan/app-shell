#!/bin/bash
# source env.sh first
#  APP_NAME
#  ENV
#  APP_ROOT
#  APP_HOME
#  PATH - JAVA_HOME, M2_HOME
#  JAVA_SOURCE_PATH
#  SERVICE_NAME

mkdir -p ${APP_HOME}

####################################################
# stop app
####################################################
sudo service ${SERVICE_NAME} stop

####################################################
# source compile
####################################################
cd ${JAVA_SOURCE_PATH}
mvn clean package

####################################################
# copy jar
####################################################
cp ./target/${APP_NAME}*.jar ${APP_HOME}/${APP_NAME}.jar
cp ./${APP_NAME}.conf.${ENV} ${APP_HOME}/
chmod -R 777 ${APP_HOME}
chown -R ${USER_NAME}:${USER_NAME} ${APP_HOME}

####################################################
# start app
####################################################
sudo service ${SERVICE_NAME} start
