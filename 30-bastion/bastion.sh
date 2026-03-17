#!/bin/bash

#we are creating 50GB root disk,but only 20GB is partitioned
#remainig 30GBW WE need to extend using below commands
growpart /dev/nvme0n1 4
lvextend -r -L+30G /dev/mapper/RootVG-homeVol
xfs_growfs /home  

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform