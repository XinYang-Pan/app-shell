#!/bin/bash
# source env.sh first
#  APP_NAME
#  ENV
#  APP_ROOT
#  APP_HOME
#  PATH - JAVA_HOME, M2_HOME
#  JAVA_SOURCE_PATH

mkdir -p ${APP_HOME}

####################################################
# stop app
####################################################
sh ${APP_ROOT}/bin/stop.sh ${APP_NAME} ${ENV}

####################################################
# source compile
####################################################
cd ${JAVA_SOURCE_PATH}
mvn clean package

####################################################
# copy jar
####################################################
cp ./target/${APP_NAME}*.jar ${APP_HOME}/${APP_NAME}.jar

####################################################
# start app
####################################################
sh ${APP_ROOT}/bin/start.sh ${APP_NAME} ${ENV}
