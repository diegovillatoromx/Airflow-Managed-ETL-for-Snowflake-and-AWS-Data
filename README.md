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

```arduino
efficient_airflow_managed_etl/
├── src/
│   ├── data_ingestion/
│   │   ├── aws_ec2_logs_ingestion.py
├── real_time_analytics_pipeline/
│   │   ├── airflow_managed_etl.py
├── mitigating_ddos_and_bot_attacks/
│   │   ├── lambda_mitigation.py
├── infrastructure/
│   ├── deploy_ec2_logs_ingestion.sh
│   ├── deploy_airflow_managed_etl.sh
│   ├── deploy_lambda_mitigation.sh
├── config/
│   ├── ec2_logs_ingestion_config.json
│   ├── airflow_managed_etl_config.json
│   ├── lambda_mitigation_config.json
├── images/
│   ├── aws_ec2_logs.png
│   ├── snowflake_logo.png
├── README.md
```
