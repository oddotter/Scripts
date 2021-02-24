#!/bin/bash
sudo rpm --import http://packages.microsoft.com/keys/microsoft.asc
#sudo yum-config-manager --add-repo=https://packages.microsoft.com/config/[distro]/[version]/[channel].repo
yum-config-manager --add-repo=https://packages.microsoft.com/config/rhel/8/prod.repo
yum-config-manager --add-repo=https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.repo
yum makecache
sudo yum install mdatp
#zypper addrepo -c -f -n microsoft-prod https://packages.microsoft.com/config/rhel/8/prod.repo
z#ypper addrepo -c -f -n microsoft-packages-microsoft-prod https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.repo
#sudo zypper install packages-microsoft-com-prod:mdatp
# install the package from the production repository
#sudo yum --enablerepo=packages-microsoft-com-prod install mdatp
unzip WindowsDefenderATPOnboardingPackage.zip
mdatp health --field org_id
mdatp health --field healthy
