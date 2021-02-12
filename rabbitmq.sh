#!/bin/bash
#####Script Colors#########
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BCyan='\033[4;36m'
Blue='\033[0;34m'
###Rabbitdq deployment script Version 1.0###########
###rpms found on virt101 ################## 
#echo -e Please type in the machines hostname
#read var2
#Importing Keys######
echo -e ${GREEN} Importing gpg keys${NC}
rpm --import https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc
rpm --import https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey
rpm --import https://packagecloud.io/gpg.key
echo -e ${GREEN} Keys imported${NC}
#Adding rabbit yum repository####
echo -e ${Blue} Creating yum repository${NC}
cd /etc/yum.repos.d
touch rabbitmq.repo
tee -a /etc/yum.repos.d/rabbitmq.repo << END
[bintray-rabbitmq-server] 
name=bintray-rabbitmq-rpm
baseurl=https://dl.bintray.com/rabbitmq/rpm/rabbitmq-server/v3.8.x/el/8/
echo gpgcheck=0 
echo repo_gpgcheck=0
echo enabled=1
END
echo -e ${Blue} Succesful${NC}
##### Installing Socat ####
echo -e ${GREEN} Installing socat dependency${NC}
yum install socat
sleep 2s
########Installing RPMs#########
echo -e ${Blue} Installing erlang${NC}
su -c 'rpm -Uvh https://download.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
yum update
sleep 2s
echo -e ${Blue} Installation complete${NC}
echo -e ${GREEN} Installing rabbitmq-server${NC}
yum install rabbitmq-server
sleep 2s
echo -e ${GREEN} Installation complete${NC}
#####Turning on rabbitmq-server####
echo -e ${Blue} Turning on server${NC}
chkconfig rabbitmq-server on
/sbin/service rabbitmq-server start
####Adding rabbit users###########
echo -e ${GREEN} Adding users and setting roles${NC}
rabbitmqctl add_user techtrakr Decisive2011
rabbitmqctl set_user_tags techtrakr administrator
rabbitmqctl set_permissions -p /  techtrakr ".*" ".*" ".*"
rabbitmqctl add_user local_admin Decisive2011
rabbitmqctl set_user_tags local_admin administrator
rabbitmqctl set_permissions -p /  local_admin ".*"
rabbitmqctl delete_user guest
echo -e ${GREEN} Users added${NC}
sleep 2s
######Setting firewall######
echo -e ${Blue} Configuring firewall${NC}
firewall-cmd --add-port=15672/tcp --permanent
firewall-cmd --add-port=5672/tcp --permanent
firewall-cmd --add-port={4369/tcp,25672/tcp} --permanent
echo -e ${Blue} Firewall configured${NC}
########Enable server & plugins######
echo -e ${GREEN} Enabling server and plugins${NC}
systemctl enable rabbitmq-server
rabbitmq-plugins enable rabbitmq_management
systemctl restart rabbitmq-server
#########Editing /etc/hosts#########
echo -e ${Blue} Editing /etc/hosts${NC}
echo 10.56.181.114 blade3 > /etc/hosts
echo 10.56.181.115 blade4 > /etc/hosts
echo 10.56.181.116 blade5 > /etc/hosts
echo -e ${RED}If blades 3 - 5 are no longer valid please update script${NC}
sleep 2s
echo " Complete "
