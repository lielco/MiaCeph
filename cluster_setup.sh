#!/bin/bash


function isinstalled {
  if yum list installed "$@" >/dev/null 2>&1; then
    true
  else
    false
  fi
}

# Checks if ceph-deploy is already installed
if isinstalled "ceph-deploy"; then
	echo "ceph-deploy is already installed";
else
	sudo yum install ceph-deploy;
fi

############### NEED TO ENABLE EPEL #################

# Creates a local user which the Ceph Admin Node will use to control the cluster
sudo useradd -d /home/svc_ceph -m svc_ceph
sudo passwd svc_ceph
echo "svc_ceph ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/svc_ceph
sudo chmod 0440 /etc/sudoers.d/svc_ceph


################ NEED TO CHANGE REQUIRETTY FOR PASSWORDLESS SUDO ##################

# Generates ssh keys to enable passwordless SSH
su svc_ceph -c './install_cluster.sh'
