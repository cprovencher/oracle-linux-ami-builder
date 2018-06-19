#!/usr/bin/env bash

# set kernel to RHCK, not Unbreakable kernel
grub2-set-default 1
grub2-mkconfig -o /boot/grub2/grub.cfg
yum -y install cloud-init
