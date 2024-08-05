#!/bin/bash


#####################
# Author: Shivanshu
# Date : Time Travelling
#
# This script outputs the node health
#
# Version: v1
######################
echo "Debug mode on"
set -x
set -e  #exit the script when there is an error
set -o pipefail
date

echo "The disk space of the system is"
df -h   # for the disk space

echo "Checking the free space"
#free -g

echo "The cpu usage"
nproc 

ps -ef

# psciids  ## To check the GPU

#top

ps -ef | awk -F" " '{print $2}'

#curl logfile | grep ERROR
#curl -X GET api.foo.com

#wget logfile ## download the logfile from internet

#find / -name filename






