#!/bin/bash
 sudo apt-get update
 sudo apt-get install -y openjdk-17-jdk
 wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.94/bin/apache-tomcat-9.0.94.tar.gz
 tar -xzvf apache-tomcat-9.0.94.tar.gz

 sudo mv apache-tomcat-9.0.94  /opt/tomcat
 sudo chmod +x /opt/tomcat/bin/*.sh

git clone https://github.com/Urgen99/mavenappdeploy_terrafrom.git

sudo mv mavenappdeploy_terrafrom/java-tomcat-maven-example.war /opt/tomcat/webapps/

sudo chown -R ubuntu:ubuntu /opt/tomcat/webapps
/opt/tomcat/bin/startup.sh
/opt/tomcat/bin/shutdown.sh
/opt/tomcat/bin/startup.sh
sudo ufw allow 8081/tcp



