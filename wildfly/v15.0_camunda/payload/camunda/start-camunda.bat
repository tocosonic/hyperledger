@echo off

set "JBOSS_HOME=%CD%\server\wildfly-16.0.0.Final"

echo "starting camunda BPM platform 7.11.0 on Wildfly Application Server 16.0.0.Final"

cd server\wildfly-16.0.0.Final\bin\
start standalone.bat

ping -n 5 localhost > NULL
start http://localhost:8080/camunda-welcome/index.html
 