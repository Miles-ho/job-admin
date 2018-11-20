#!/bin/sh
#变量设置
SERVICE_NAME=xxl-job-admin
SERVER_PORT=8900
while getopts "p:" opt
do
    case $opt in
        p)
        SERVER_PORT=$OPTARG
        ;;
        ?)
        echo "usage: start.sh [-p port]"
        exit -1;;
    esac
done
PROJECT_DIR=$(cd "$(dirname "$0")"; pwd)
PROJECT_DIR=$PROJECT_DIR/..
CONFIG_DIR=$PROJECT_DIR/config
LIB_DIR=$PROJECT_DIR/lib
LIB_JARS=`ls $LIB_DIR | grep .jar | awk '{print "'$LIB_DIR'/"$0}' | tr "\n" ":"`
mkdir -p /data/logs/$SERVICE_NAME/
MAIN_CLASS="com.xxl.job.admin.XxlJobAdminApplication"
JAVE_HOME=/usr/local/java
LOG_PATH=$PROJECT_DIR/../logs
STD_OUT_PATH_LOG=$PROJECT_DIR/../start_std_out.log

# 设置classpath
nohup $JAVE_HOME/jre/bin/java -classpath $CONFIG_DIR:$LIB_JARS $MAIN_CLASS --server.port=$SERVER_PORT --logging.path=$LOG_PATH >> $STD_OUT_PATH_LOG 2>&1 &