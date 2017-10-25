#!/bin/bash
# source env.sh first
#  APP_NAME
#  ENV
#  APP_HOME

mkdir -p ${APP_HOME}/log

java -jar -Dspring.profiles.active=${ENV} -DAPP_NAME=${APP_NAME} ${APP_HOME}/${APP_NAME}.jar >> ${APP_HOME}/log/console.log 2>&1 &