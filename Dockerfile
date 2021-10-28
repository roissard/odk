FROM tomcat:8.5-jre8-alpine

WORKDIR /app
RUN apk update && apk upgrade && \
    apk add openjdk8
#RUN apk update && apk install -y openjdk8
#RUN apt-get update && apt-get install -y default-jdk

#COPY tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
#COPY context.xml ${CATALINA_HOME}/webapps/manager/META-INF/context.xml

RUN wget https://jdbc.postgresql.org/download/postgresql-9.4.1209.jre7.jar && \
    mv postgresql-9.4.1209.jre7.jar ${CATALINA_HOME}/lib/

#RUN wget https://github.com/opendatakit/aggregate/releases/download/v2.0.3/ODK-Aggregate-v2.0.3.war && \
#    mv ODK-Aggregate-v2.0.3.war ${CATALINA_HOME}/webapps/ODK-Aggregate-v2.0.3.war
#COPY ODK-Aggregate-v2.0.3.war ${CATALINA_HOME}/webapps/ODK-Aggregate-v2.0.3.war

COPY ODK-Aggregate-v2.0.3.war jdbc.properties security.properties ./

RUN pwd && mkdir odktemp && \
    cd odktemp && \
    ls -la /app && \
    jar -xvf /app/ODK-Aggregate-v2.0.3.war && \
    cp /app/jdbc.properties ./WEB-INF/classes/ && \
    cp /app/security.properties ./WEB-INF/classes/ && \
    cd /app && \
    mkdir ${CATALINA_HOME}/webapps/odk-aggregate && \
    rm -fr ${CATALINA_HOME}/webapps/ROOT/* && \
    mv odktemp/* ${CATALINA_HOME}/webapps/ROOT
