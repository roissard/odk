FROM tomcat:8.5

WORKDIR /app

#RUN apt-get update && apt-get install -y mc default-jdk
RUN apt-get update && apt-get install -y default-jdk

#COPY tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
#COPY context.xml ${CATALINA_HOME}/webapps/manager/META-INF/context.xml

RUN wget https://jdbc.postgresql.org/download/postgresql-9.4.1209.jre7.jar && \
    mv postgresql-9.4.1209.jre7.jar ${CATALINA_HOME}/lib/

#RUN wget https://github.com/opendatakit/aggregate/releases/download/v2.0.3/ODK-Aggregate-v2.0.3.war && \
#    mv ODK-Aggregate-v2.0.3.war ${CATALINA_HOME}/webapps/ODK-Aggregate-v2.0.3.war
#COPY ODK-Aggregate-v2.0.3.war ${CATALINA_HOME}/webapps/ODK-Aggregate-v2.0.3.war

COPY ODK-Aggregate-v2.0.3.war jdbc.properties ./

RUN pwd && mkdir odktemp && \
    cd odktemp && \
    ls -la /app && \
    jar -xvf /app/ODK-Aggregate-v2.0.3.war && \
    cp /app/jdbc.properties ./WEB-INF/classes/ && \
    cd /app && \
    mkdir ${CATALINA_HOME}/webapps/odk-aggregate && \
    mv odktemp/* ${CATALINA_HOME}/webapps/odk-aggregate
