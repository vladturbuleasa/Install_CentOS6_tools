#!/bin/bash
echo "Install Jenkins Master on machine..."
#Installing jenkins
wget -nv -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
yum -y update
yum -y install jenkins
#Installing plugins on jenkins
mkdir -p /var/lib/jenkins/plugins/
wget -nv -O /var/lib/jenkins/plugins/scm-api.hpi https://updates.jenkins-ci.org/download/plugins/scm-api/latest/scm-api.hpi
wget -nv -O /var/lib/jenkins/plugins/git-client.hpi https://updates.jenkins-ci.org/download/plugins/git-client/1.11.1/git-client.hpi
wget -nv -O /var/lib/jenkins/plugins/git.hpi https://updates.jenkins-ci.org/download/plugins/git/2.3/git.hpi
wget -nv -O /var/lib/jenkins/plugins/ws-cleanup.hpi https://updates.jenkins-ci.org/download/plugins/ws-cleanup/0.24/ws-cleanup.hpi
wget -nv -O /var/lib/jenkins/plugins/token-macro.hpi https://updates.jenkins-ci.org/download/plugins/token-macro/1.10/token-macro.hpi
wget -nv -O /var/lib/jenkins/plugins/config-file-provider.hpi http://mirrors.xmission.com/hudson/plugins/config-file-provider/2.7.5/config-file-provider.hpi
wget -nv -O /var/lib/jenkins/plugins/swarm.hpi https://updates.jenkins-ci.org/latest/swarm.hpi
sudo chown -R jenkins:jenkins /var/lib/jenkins/plugins/
#setting up Jenkins as a service&start it
chkconfig jenkins on
service jenkins restart
service iptables stop
echo "All Done, jenkins master is installed."