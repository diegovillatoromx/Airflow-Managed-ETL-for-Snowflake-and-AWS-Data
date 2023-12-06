# Efficient Airflow-Managed ETL: AWS EC2 Logs to Snowflake Data Pipeline

Airflow-Managed ETL: Seamlessly integrate AWS EC2 logs into Snowflake and S3. Defined transformations, orchestrated by Airflow DAGs, ensure a robust, scalable workflow. Achieve comprehensive data management for Snowflake and AWS in one streamlined solution.  
 
## Table of Contents 
  
- [Description](#description)
- [Architecture](#architecture)
- [Dataset](#Dataset)
- [Modular Code Overview](#modular-code-overview)
- [Methodology](#Methodology)
- [Contribution](#contribution)
- [Contact](#contact)
  
## Architecture

The Snowflake database architecture blends elements of traditional shared-disk and shared-nothing designs. It features a centralized data repository, akin to shared-disk architectures, ensuring universal access across all compute nodes. Snowflake enhances query performance through Massively Parallel Processing (MPP) compute clusters. Each node within the cluster locally stores a segment of the complete dataset, mirroring the principles of shared-nothing architectures. This approach harmonizes the simplicity of shared-disk designs with the speed and scalability inherent in shared-nothing architectures.

![diagram](https://github.com/diegovillatoromx/Airflow-Managed-ETL-for-Snowflake-and-AWS-Data/blob/main/data_architecture.png)

## Modular Code Overview

```terminal
kinesis_snowflake_data_pipeline/
├── src/
│   ├── ec2_logs_emitter/
│   │   ├── customer_data.py
│   │   ├── order_data.py
├── infrastructure/
│   ├── create_s3_bucket.sh
│   ├── setup_iam_role.sh
│   ├── create_ec2_instance.sh
│   ├── create_kinesis_firehose_delivery.sh
│   ├── install_kinesis_agent.sh
│   ├── move_data_to_firehose_delivery.sh
│   ├── setup_snowflake.sh
│   ├── create_airflow_dag.sh
│   ├── mwaa_setup/
│   │   ├── create_mwaa_environment.sh
│   │   ├── add_snowflake_connection.sh
├── config/
│   ├── s3_bucket_config.json
│   ├── iam_role_config.json
│   ├── ec2_instance_config.json
│   ├── kinesis_firehose_config.json
│   ├── kinesis_agent_config.json
│   ├── snowflake_config.json
│   ├── airflow_dag_config.json
│   ├── mwaa_config/
│   │   ├── mwaa_environment_config.json
│   │   ├── snowflake_connection_config.json
├── data/
│   ├── landing_zone/
│   ├── processing_zone/
│   ├── processed_zone/
│   ├── customer/
│   │   ├── customer_data_file.txt
│   ├── order/
│   │   ├── order_data_file.txt
├── scripts/
│   ├── upload_data_to_landing.sh
│   ├── trigger_airflow_dag.sh
│   ├── load_data_to_snowflake.sh
│   ├── transform_data_in_snowflake.sh
│   ├── transfer_data_between_zones.sh
├── images/
│   ├── kinesis_logo.png
│   ├── airflow_logo.png
│   ├── snowflake_logo.png
├── README.md

```

## Methodology for the Kinesis-Snowflake Data Pipeline Project

This project sets up an end-to-end data pipeline using various AWS services, including Kinesis, Apache Airflow, and Snowflake. The pipeline handles customer and order datasets placed on an EC2 machine emitting logs. The Kinesis Agent captures logs and sends them to Kinesis Data Firehose, progressing through three S3 zones - Landing, Processing, and Processed. Snowflake manages data ingestion, transformation, and storage, providing insights into the entire pipeline.

### Project Structure

#### 1. S3 Bucket Creation

- **Script:** [create_s3_bucket.sh](infrastructure/create_s3_bucket.sh)
- **Configuration:** [s3_bucket_config.json](config/s3_bucket_config.json)

#### 2. IAM Role Creation for EC2

- **Script:** [create_iam_role.sh](infrastructure/create_iam_role.sh)
- **Configuration:** [iam_role_config.json](config/iam_role_config.json)

#### 3. Snowflake Configuration

- **Script:** [setup_snowflake.sh](infrastructure/setup_snowflake.sh)
- **Configuration:** [snowflake_config.json](config/snowflake_config.json)

#### 4. Airflow DAG Creation

- **Script:** [create_airflow_dag.sh](infrastructure/create_airflow_dag.sh)
- **Configuration:** [airflow_dag_config.json](config/airflow_dag_config.json)

#### 5. Amazon MWAA Setup and Snowflake Connection

- **Scripts:** [mwaa_setup/create_mwaa_environment.sh](infrastructure/mwaa_setup/create_mwaa_environment.sh), [mwaa_setup/add_snowflake_connection.sh](infrastructure/mwaa_setup/add_snowflake_connection.sh)
- **Configuration:** [mwaa_config/mwaa_environment_config.json](config/mwaa_config/mwaa_environment_config.json), [mwaa_config/snowflake_connection_config.json](config/mwaa_config/snowflake_connection_config.json)

#### 6. Ingestion and Transformation in Airflow-Snowflake Pipeline

- **Scripts:** [upload_data_to_landing.sh](scripts/upload_data_to_landing.sh), [trigger_airflow_dag.sh](scripts/trigger_airflow_dag.sh), [load_data_to_snowflake.sh](scripts/load_data_to_snowflake.sh), [transform_data_in_snowflake.sh](scripts/transform_data_in_snowflake.sh), [transfer_data_between_zones.sh](scripts/transfer_data_between_zones.sh)

### Instructions for Use 

1. Execute each script in the `infrastructure/` folder to create the necessary resources.
2. Customize configuration files in the `config/` folder according to your project needs.
3. Follow the project steps outlined in the README to set up and execute the data pipeline.

Feel free to adjust the project structure and scripts as needed for your specific requirements. If you have any questions or need further assistance, please let me know!
