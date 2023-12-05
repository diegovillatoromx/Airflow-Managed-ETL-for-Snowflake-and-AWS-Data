#!/bin/bash

# Configuración
IAM_ROLE_NAME=$(jq -r .iam_role_name config/iam_role_config.json)
IAM_ROLE_DESCRIPTION=$(jq -r .iam_role_description config/iam_role_config.json)

# Crear el rol IAM
IAM_ROLE_ARN=$(aws iam create-role --role-name $IAM_ROLE_NAME --assume-role-policy-document file://path/to/assume_role_policy.json --description "$IAM_ROLE_DESCRIPTION" --output text --query 'Role.Arn')

# Adjuntar políticas al rol
aws iam attach-role-policy --role-name $IAM_ROLE_NAME --policy-arn arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess
aws iam attach-role-policy --role-name $IAM_ROLE_NAME --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess
aws iam attach-role-policy --role-name $IAM_ROLE_NAME --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess
aws iam attach-role-policy --role-name $IAM_ROLE_NAME --policy-arn arn:aws:iam::aws:policy/CloudWatchEventsFullAccess

echo "IAM Role ARN: $IAM_ROLE_ARN"
