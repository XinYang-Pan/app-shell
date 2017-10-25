#!/bin/bash
# source env.sh first
#  APP_NAME
#  ENV

PID=`ps -ef | grep java | grep "APP_NAME=${APP_NAME} " | grep "active=${ENV}" | awk '{ print $2 }'`

if [ "${PID}" == "" ];then
	echo "${APP_NAME} is not runing! skip stop. "
else
	kill ${PID}
	echo "${APP_NAME} is stopped on pid=${PID}!"
fi
