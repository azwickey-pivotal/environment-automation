#!/bin/bash
# Source: https://github.com/pivotalservices/concourse-pipeline-samples/blob/master/tasks/pcf/pks/configure-pks-cli-user/task.sh
set -eu

apt-get update -y && apt-get install -y curl

export ROOT_DIR=`pwd`
export CLOUD_SDK_REPO="cloud-sdk-xenial"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update -y && apt-get install -y google-cloud-sdk

gcloud auth activate-service-account --key-file=credential_key.json
gcloud config set project $GCP_PROJECT_ID
