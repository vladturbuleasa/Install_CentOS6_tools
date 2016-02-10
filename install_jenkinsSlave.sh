#!/bin/bash
echo "Installing JenkinsSlave..."
mkdir -p /var/lib/jenkins/
cd /var/lib/jenkins
touch /var/lib/jenkins/jenkins.log
wget -nv -O /var/lib/jenkins/swarm-client-2.0-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar
echo 'nohup java -jar /var/lib/jenkins/swarm-client-2.0-jar-with-dependencies.jar -master http://172.16.1.2:8080 > /var/lib/jenkins/jenkins.log 2>&1 &' >> /etc/rc.local
nohup java -jar /var/lib/jenkins/swarm-client-2.0-jar-with-dependencies.jar -master http://172.16.1.2:8080 > /var/lib/jenkins/jenkins.log 2>&1 &
sudo service iptables stop
echo "Installing JenkinsSlave Done..."2