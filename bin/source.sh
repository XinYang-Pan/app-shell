#!/bin/bash

APP_NAME=$1
ENV=$2

# APP_ROOT
APP_ROOT=/app
if [ "${ENV}" == "dev" ]; then
	APP_ROOT=/appdev
fi

# APP_HOME
APP_HOME=/${APP_ROOT}/${APP_NAME}

# PATH
JAVA_HOME=/usr/java/jdk1.8.0_144
M2_HOME=/usr/local/apache-maven-3.5.0
PATH=$PATH:${JAVA_HOME}/bin:${M2_HOME}/bin

# JAVA_SOURCE_PATH
JAVA_SOURCE_PATH=.

# SHELL_HOME
SHELL_HOME=/app/bin

#
export APP_NAME
export ENV
export APP_ROOT
export APP_HOME
export PATH
export JAVA_SOURCE_PATH
export SHELL_HOME
