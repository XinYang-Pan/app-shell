#!/bin/bash

APP_NAME=$1
ENV=$2

# USER_NAME
USER_NAME=${APP_NAME}

# APP_ROOT SERVICE_NAME
APP_ROOT=/app
SERVICE_NAME=${APP_NAME}

if [ "${ENV}" == "dev" ]; then
	APP_ROOT=/appdev
	SERVICE_NAME=${APP_NAME}_${ENV}
fi

# APP_HOME
APP_HOME=${APP_ROOT}/${APP_NAME}

# PATH
JAVA_HOME=/usr/java/default
M2_HOME=/usr/local/apache-maven-3.5.3
PATH=$PATH:${JAVA_HOME}/bin:${M2_HOME}/bin

# JAVA_SOURCE_PATH
JAVA_SOURCE_PATH=.

# SHELL_HOME
SHELL_HOME=/app/bin

#
export APP_NAME
export ENV
export USER_NAME
export APP_ROOT
export SERVICE_NAME
export APP_HOME
export PATH
export JAVA_SOURCE_PATH
export SHELL_HOME
