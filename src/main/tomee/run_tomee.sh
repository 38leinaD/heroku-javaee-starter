#!/bin/bash
export CATALINA_OPTS="-Xms256m -Xmx256m"
export JAVA_OPTS="-Dhttp.port=$PORT"
rm -rf /usr/local/tomee/webapps/ROOT
exec catalina.sh run