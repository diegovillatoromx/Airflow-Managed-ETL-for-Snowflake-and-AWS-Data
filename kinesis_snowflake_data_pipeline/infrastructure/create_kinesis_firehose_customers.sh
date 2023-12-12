#!/bin/bash

# Read configuration from JSON file
config_file="kinesis_firehose_delivery.json"

# Create Kinesis Firehose Delivery Stream
aws firehose create-delivery-stream --cli-input-json file://$config_file

echo "Kinesis Data Firehose delivery stream created with the name: CustomerDeliveryFirehose"
