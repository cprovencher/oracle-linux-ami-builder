#!/bin/bash -eux

# change cloud-init user name
sed -i 's/name: fedora/name: oracle/g' /etc/cloud/cloud.cfg
sed -i 's/gecos: Fedora Cloud User/gecos: EC2 Default User/g' /etc/cloud/cloud.cfg
sed -i 's/distro: fedora/distro: rhel/g' /etc/cloud/cloud.cfg

sudo touch /etc/cloud/cloud.cfg.d/defaults.cfg
sudo tee /etc/cloud/cloud.cfg.d/defaults.cfg <<-'EOF'
#cloud-config
system_info:
    default_user:
        name: oracle
EOF

# lock login user
passwd -l oracle

# delete cloud-init lock
rm -rf /var/lib/cloud/instance/sem/*
