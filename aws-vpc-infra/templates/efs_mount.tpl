#!/bin/bash
sleep 3m
sudo su - root

# Install AWS EFS Utilities
yum install -y amazon-efs-utils

# Define Variables
MOUNT_PATH="${mount_path}"
EFS_ID="${efs_id}"

# Mount EFS
mkdir $MOUNT_PATH
mount -t efs $EFS_ID:/ $MOUNT_PATH

# Edit fstab so EFS automatically loads on reboot
echo $EFS_ID:/ $MOUNT_PATH efs defaults,_netdev 0 0 >> /etc/fstab