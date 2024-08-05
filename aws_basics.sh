##############################################
# Author : Shivanshu Tyagi
# Date : Time Travelling
#
# This scripts run aws automation commands
#
# Version : v1
##############################################

set -x
set -e
set -o pipefail

aws ec2 describe-instances 

aws s3 ls

aws iam list-users

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceID'

aws lambda list-functions

 