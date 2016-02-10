#!/bin/bash
echo "Install Oracle JDK 8u74 x64 for CentOS"
#Install Oracle JDK
wget -nv \
--no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.rpm" \
-O jdk-8u74-linux-x64.rpm
yum -y install jdk-8u74-linux-x64.rpm
\rm -rf jdk-8u74-linux-x64.rpm
echo "Installation fo JDK Done."