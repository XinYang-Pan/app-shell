#!/bin/bash
# source env.sh first
#  APP_NAME
#  ENV
#  APP_ROOT
#  APP_HOME
#  PATH - JAVA_HOME, M2_HOME
#  JAVA_SOURCE_PATH
#  SERVICE_NAME


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
rm -rf ${APP_HOME}
mkdir -p ${APP_HOME}

cp ./target/${APP_NAME}*.jar ${APP_HOME}/${APP_NAME}.jar
cp ./${APP_NAME}.conf.${ENV} ${APP_HOME}/${APP_NAME}.conf

sudo rm -f /etc/init.d/${SERVICE_NAME}
sudo ln -s ${APP_HOME}/${APP_NAME}.jar /etc/init.d/${SERVICE_NAME}

sudo chmod -R 777 ${APP_HOME}
sudo chown -R ${USER_NAME}:${USER_NAME} ${APP_HOME}

####################################################
# start app
####################################################
sudo service ${SERVICE_NAME} start
