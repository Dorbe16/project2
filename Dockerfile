FROM tomcat:9-jdk11
COPY target/myapp.war /usr/local/tomcat/webapps/

