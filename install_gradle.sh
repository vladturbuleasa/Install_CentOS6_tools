#!/bin/bash
echo "Install Gradle to machine..."
gradle_version=2.11
wget -nv -O /opt/gradle-${gradle_version}-all.zip https://services.gradle.org/distributions/gradle-${gradle_version}-all.zip
unzip /opt/gradle-${gradle_version}-all.zip -d /opt/gradle
ln -s /opt/gradle/gradle-${gradle_version} /opt/gradle/latest
touch /etc/profile.d/gradle.sh
echo 'export GRADLE_HOME=/opt/gradle/latest' >> /etc/profile.d/gradle.sh
echo 'export PATH=$PATH:/opt/gradle/latest/bin' >> /etc/profile.d/gradle.sh
chmod +x /etc/profile.d/gradle.sh
. /etc/profile.d/gradle.sh
# check installation
gradle -v
rm -rf /opt/*.zip
echo "Gradle install finish..."