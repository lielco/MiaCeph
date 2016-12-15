#!/bin/bash

ssh-keygen

# Creates a directory where all the cluster data will be saved
mkdir /home/svc_ceph/mia-ceph
cd /home/svc_ceph/mia-ceph
ceph-deploy new "$(hostname)"
ceph-deploy install "$(hostname)"
ceph-deploy mon create-initial
sudo chmod +r /etc/ceph/ceph.client.admin.keyring
ceph health

