#!/bin/bash

ip=10.0.0.7
ceph-deploy install $ip
ceph-deploy osd prepare --zap-disk $ip:sdb
ceph-deploy osd activate $ip:sdb1
ceph-deploy admin $ip
