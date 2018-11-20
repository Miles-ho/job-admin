#!/bin/sh
#变量设置
SERVICE_NAME=xxl-job-admin
PROJECT_DIR=$(cd "$(dirname "$0")"; pwd)
PROJECT_DIR=$PROJECT_DIR/..
CONFIG_DIR=$PROJECT_DIR/config
LIB_DIR=$PROJECT_DIR/lib
LIB_JARS=`ls $LIB_DIR | grep .jar | awk '{print "'$LIB_DIR'/"$0}' | tr "\n" ":"`
mkdir -p /logs/$SERVICE_NAME/
MAIN_CLASS="com.xxl.job.admin.XxlJobAdminApplication"
JAVE_HOME=/usr/local/java

# 设置classpath
nohup $JAVE_HOME/jre/bin/java -classpath $CONFIG_DIR:$LIB_JARS $MAIN_CLASS  >> /data/app/build/$SERVICE_NAME/std_out.log 2>&1 &