#!/bin/bash
echo "Install Maven 3 to machine..."
cd /opt/
mkdir -p /opt/maven/
wget -nv -O /opt/apache-maven-3.3.3-bin.tar.gz http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
tar -xf apache-maven-3.3.3-bin.tar.gz -C /opt/maven/
ln -s /opt/maven/apache-maven-3.3.3 /opt/maven/latest
touch /etc/profile.d/maven.sh
echo "export MAVEN_HOME=/opt/maven/latest\nexport PATH=$PATH:$MAVEN_HOME/bin" > /etc/profile.d/maven.sh
export MAVEN_HOME=/opt/gradle/latest
export PATH=$PATH:$MAVEN_HOME/bin
. /etc/profile.d/maven.sh
# check installation
mvn -v
echo "Install done..."