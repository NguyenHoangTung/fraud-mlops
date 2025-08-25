#!/bin/bash
mkdir -p ingestion/{batch_spark,streaming} \
         feature_store/registry \
         data \
         training \
         serving/bento \
         pipelines/airflow/dags \
         monitoring/grafana \
         bi \
         ci/.github/workflows

touch docker-compose.yml .env README.md \
      ingestion/batch_spark/job.py \
      ingestion/streaming/{producer.py,consumer.py} \
      feature_store/{feature_store.yaml,features.py} \
      training/{train.py,evaluate.py,requirements.txt} \
      serving/bento/{service.py,bentofile.yaml} \
      pipelines/airflow/dags/train_pipeline.py \
      monitoring/prometheus.yml \
      bi/{ddl.sql,queries.sql} \
      ci/.github/workflows/ci.yml
