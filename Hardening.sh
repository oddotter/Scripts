#!/bin/bash

####Hardening Script Version 1.0##########
#####Script Colors#########
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BCyan='\033[4;36m'
Blue='\033[0;34m'
###############################
###Setting Grub password#######
echo -e ${GREEN} Setting Grub2 Password${NC}
grub2-setpassword
####Setting permissions on host key,If an unauthorized user obtains the private SSH host key file, the host could be impersonated####
######################################
echo -e ${Blue} Setting Permissions to hostkey${NC}
chmod 0640 /etc/ssh/ssh_host*key
#####Routing protocol daemons are typically used on routers to exchange network topology information with other routers. If this software is used when not required, system network information may be unnecessarily transmitted across the network.########
################################
echo -e ${GREEN} Denying IPV6 Traffic${NC}
sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
#########################################################
echo -e ${Blue} Editing /etc/pam.d/password-auth & /etc/pam.d/system-auth because the system must use a strong hashing algorithm to store the password. The system must use a sufficient number of hashing rounds to ensure the required level of entropy.password sufficient pam_unix.so sha512 rounds=5000${NC}
##################################################################
echo -e ${GREEN}Configure RHEL 8 to automatically terminate all network connections associated with SSH traffic at the end of a session or after 10 minutes of inactivity. In /etc/ssh/sshd_config: ClientAliveInterval 600${NC} 
#################################################

echo -e ${Blue} Disabling kexec_load prevents an unsigned kernel image that could be a windows kernel or modified vulnerable kernel from being loaded. Add or edit the following line in a system configuration file in the "/etc/sysctl.d/" directory:kernel.kexec_load_disabled = 1${NC}
##################################################
echo -e ${GREEN} Configuring this setting for the SSH daemon provides additional assurance that remote logon via SSH will require a password, even in the event of misconfiguration elsewhere. Add the following line in "/etc/ssh/sshd_config" 
IgnoreUserKnownHosts yes
KerberosAuthentication no
GSSAPIAuthentication no${NC}
############################
#####
echo -e ${Blue} Configure RHEL 8 to enforce a 60-day maximum password lifetime.Add, or modify the following line in the "/etc/login.defs" file:PASS_MAX_DAYS 60${NC}
#####################################
####
echo -e ${GREEN} Providing users with feedback on when account accesses via SSH last occurred facilitates user recognition and reporting of unauthorized account use. Modify the "PrintLastLog" line in "/etc/ssh/sshd_config" to match the following:PrintLastLog yes${NC}
#########################################################
######
echo -e ${Blue}Configure RHEL 8 to prevent privilege escalation thru the kernel by disabling access to the bpf syscall by adding the following line to a file in the "/etc/sysctl.d" directory: kernel.unprivileged_bpf_disabled = 1
kernel.yama.ptrace_scope = 1${NC}
#########################################

