#!/bin/bash

# Function to source variables from JSON
source_vars() {
  local json_file="$1"
  jq -r ".delivery_stream_name" "$json_file"
  jq -r ".s3_bucket" "$json_file"
  jq -r ".s3_bucket_prefix" "$json_file"
  jq -r ".s3_error_prefix" "$json_file"
  jq -r ".buffer_interval" "$json_file"
  jq -r ".role_arn" "$json_file"
  jq -r ".bucket_arn" "$json_file"
}

# Variables
delivery_stream_name=$(source_vars "kinesis_firehose_delivery.json" | sed -n 1p)
s3_bucket=$(source_vars "kinesis_firehose_delivery.json" | sed -n 2p)
s3_bucket_prefix=$(source_vars "kinesis_firehose_delivery.json" | sed -n 3p)
s3_error_prefix=$(source_vars "kinesis_firehose_delivery.json" | sed -n 4p)
buffer_interval=$(source_vars "kinesis_firehose_delivery.json" | sed -n 5p)
role_arn=$(source_vars "kinesis_firehose_delivery.json" | sed -n 6p)
bucket_arn=$(source_vars "kinesis_firehose_delivery.json" | sed -n 7p)

# Create the delivery stream (Kinesis Data Firehose)
aws firehose create-delivery-stream \
  --delivery-stream-name $delivery_stream_name \
  --delivery-stream-type DirectPut \
  --s3-destination-configuration \
    RoleARN=$role_arn \
    BucketARN=$bucket_arn \
    Prefix=$s3_bucket_prefix \
    ErrorOutputPrefix=$s3_error_prefix \
    BufferingHints="{\"SizeInMBs\": 5, \"IntervalInSeconds\": $buffer_interval}"

echo "Kinesis Data Firehose created with the name: $delivery_stream_name"
