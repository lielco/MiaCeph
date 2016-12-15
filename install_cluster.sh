#!/bin/bash

ssh-keygen
sudo yes | cp -rf /home/svc_ceph/.ssh/id_rsa.pub /var/www/html/

# Creates a directory where all the cluster data will be saved
mkdir /home/svc_ceph/mia-ceph
cd /home/svc_ceph/mia-ceph
ceph-deploy new "$(hostname)"
ceph-deploy install "$(hostname)"
ceph-deploy mon create-initial
ceph-deploy admin "$(hostname)"
sudo chmod +r /etc/ceph/ceph.client.admin.keyring
ceph health

