#!/bin/bash
curl -s https://packagecloud.io/install/repositories/chef/stable/script.rpm.sh | sudo bash
yum install chef-server-core
chef-server-ctl reconfigure
mkdir -p /opt/chef-server
sudo chef-server-ctl user-create --filename /opt/chef-server/vagrant.pem vagrant Vlad ENDAVA vlad.turbuleasa@endava.com vagrant
sudo chef-server-ctl org-create ssh DevOps --association_user vagrant --filename /opt/chef-server/ssh.pem