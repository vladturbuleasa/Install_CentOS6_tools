#!/bin/bash
echo "Installing Nexus..."
rm -rf /var/lib/nexus /home/nexus
userdel nexus
wget -nv -O /var/lib/nexus-2.12.0-01-bundle.tar.gz http://download.sonatype.com/nexus/oss/nexus-2.12.0-01-bundle.tar.gz
cd /var/lib/;tar xvzf nexus-2.12.0-01-bundle.tar.gz;rm -rf nexus-2.12.0-01-bundle.tar.gz
mv nexus-2.12.0-01 nexus
cd nexus;chmod -R a+x bin
sudo adduser nexus
chown -R nexus:nexus /var/lib/nexus
chown -R nexus:nexus /var/lib/sonatype-work
ln -s /var/lib/nexus/bin/nexus /etc/init.d/nexus
sed -i 's/#RUN_AS_USER=/RUN_AS_USER=nexus/g' /var/lib/nexus/bin/nexus
chkconfig --add nexus
chkconfig --levels 345 nexus on
service nexus start
iptables -P INPUT ACCEPT
iptables -I INPUT -p tcp --dport 8081 -j ACCEPT
echo "Installation of Nexus Sonatype is done..."