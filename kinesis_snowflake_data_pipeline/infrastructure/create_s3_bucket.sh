#!/bin/bash

# Configuración
S3_BUCKET_NAME=$(jq -r .s3_bucket_name config/s3_bucket_config.json)
AWS_REGION=$(jq -r .aws_region config/s3_bucket_config.json)
 
# Crear el bucket de S3
aws s3api create-bucket --bucket $S3_BUCKET_NAME --region $AWS_REGION

# Configurar el bucket para el acceso público
aws s3api put-bucket-policy --bucket $S3_BUCKET_NAME --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::'$S3_BUCKET_NAME'/*"
        }
    ]
}'
