#!/bin/bash

# Load configuration from JSON file 
CONFIG_FILE="config/ec2_instance_config.json"
KEY_NAME=$(jq -r '.keyName' $CONFIG_FILE)
SUBNET_ID=$(jq -r '.subnetId' $CONFIG_FILE)
INSTANCE_TYPE=$(jq -r '.instanceType' $CONFIG_FILE)
INSTANCE_NAME=$(jq -r '.instanceName' $CONFIG_FILE)
IAM_ROLE_NAME=$(jq -r '.iamRoleName' $CONFIG_FILE)
AMI_ID=$(jq -r '.amiId' $CONFIG_FILE)
AWS_REGION=$(jq -r '.region' $CONFIG_FILE)

# Command to launch the EC2 instance
aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --subnet-id $SUBNET_ID \
  --key-name $KEY_NAME \
  --iam-instance-profile Name=$IAM_ROLE_NAME \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --region $AWS_REGION

