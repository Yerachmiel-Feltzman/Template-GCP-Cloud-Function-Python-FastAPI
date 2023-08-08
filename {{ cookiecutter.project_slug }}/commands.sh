#!/bin/bash
set -e # exit on first error encountered

GCP_MULTI_REGION='us'
GCP_REGION="{{ cookiecutter.gcp_region }}"
GCP_PROJECT="{{ cookiecutter.gcp_project }}"

CLOUD_RUN_SERVICE_NAME='{{ cookiecutter.gcp_cloud_run_service_name }}'

gcp:cloud_run:deploy() {
  gcloud run deploy "$CLOUD_RUN_SERVICE_NAME" \
    --service-account "{{ cookiecutter.gcp_service_account_for_cloud_run }}" \
    --source . \
    --max-instances "{{ cookiecutter.gcp_cloud_run_max_instances }}" \
    --no-allow-unauthenticated \
    --region "$GCP_REGION" \
    --project "$GCP_PROJECT"
}

gcp:cloud_run:get_url() {
  gcloud run services describe "$CLOUD_RUN_SERVICE_NAME" \
    --region "$GCP_REGION" \
    --project "$GCP_PROJECT" \
    --format='value(status.url)'
}

# to allow calling function form terminal
# based on https://stackoverflow.com/a/16159057/12894926
"$@"
