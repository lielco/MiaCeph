#!/bin/sh
ceph_user=svc_ceph
admin_srv=mama-mia

# Creates the user for ceph in case it doesnt exist
if [ -z "$(getent passwd $ceph_user)" ]; then
	echo "in if"
	sudo useradd -d /home/$ceph_user -m $ceph_user
	sudo passwd $ceph_user 
	key=$(curl -s http://$admin_srv/id_rsa.pub)
	mkdir -p /home/$ceph_user/.ssh/
	grep -q "$key" "/home/$ceph_user/.ssh/authorized_keys" 2>/dev/null || echo "$key" >> "/home/$ceph_user/.ssh/authorized_keys"
fi



