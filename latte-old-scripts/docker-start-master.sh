#!/bin/bash


# Starts Spark master on the machine this script is executed on.

. "$SPARK_HOME/sbin/spark-config.sh"

. "$SPARK_HOME/bin/load-spark-env.sh"

if [ "$SPARK_MASTER_PORT" = "" ]; then
	SPARK_MASTER_PORT=7077
fi

if [ "$SPARK_MASTER_IP" = "" ]; then
	SPARK_MASTER_IP=`hostname`
fi

if [ "$SPARK_MASTER_WEBUI_PORT" = "" ]; then
	SPARK_MASTER_WEBUI_PORT=8080
fi

if [[ "$METADATA_SERVER" != "" ]]; then
  echo "Use SafeSpark, Attesting the code"

fi

exec "$SPARK_HOME"/bin/spark-class org.apache.spark.deploy.master.Master \
	--ip $SPARK_MASTER_IP --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT "$@"

