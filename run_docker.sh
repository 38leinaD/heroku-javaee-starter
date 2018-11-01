#!/bin/bash
set -e

if [ -f ./gradlew ]; then
	./gradlew build
else
	./mvnw package
fi

#docker run --rm --name appsvr -p 80:9080 -p 443:9443 -e PORT=9080 -v $(pwd)/build/libs/heroku-javaee-starter.war:/config/dropins/heroku-javaee-starter.war -v $(pwd)/src/main/liberty/config/server.xml:/config/server.xml openliberty/open-liberty:javaee8
docker run --rm --name appsvr -p 80:8080 -e PORT=8080 -v $(pwd)/build/libs/heroku-javaee-starter.war:/usr/local/tomee/webapps/heroku-javaee-starter.war -v $(pwd)/src/main/tomee/config/server.xml:/usr/local/tomee/conf/server.xml -v $(pwd)/src/main/tomee/run_tomee.sh:/usr/local/run_tomee.sh tomee:8-jre-8.0.0-M1-plume /usr/local/run_tomee.sh
