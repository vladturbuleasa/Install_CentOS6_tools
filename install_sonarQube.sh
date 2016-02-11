#!/bin/bash
echo "Installing SonarQube server..."
wget -O /etc/yum.repos.d/sonar.repo http://downloads.sourceforge.net/project/sonar-pkg/rpm/sonar.repo
yum -y install sonar
service sonar start
iptables -I INPUT -p tcp --dport 9000 -j ACCEPT
echo "Installation of SonarQube is done..."