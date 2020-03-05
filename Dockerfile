FROM tomcat:8.0.20-jre8

RUN mkdir /usr/local/tomcat/webapps/myapp

COPY project/target/project-1.0-aman.war /usr/local/tomcat/webapps/project-1.0-aman.war
