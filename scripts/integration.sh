#!/bin/bash

# Debugging: list files in the current directory
ls -ltr

# Capture arguments
ORG=$1
NEWMAN_TARGET_URL=$2
#base64encoded=$2
#NEWMAN_TARGET_URL="NoTargetProxy_GET_Req_Pass.postman_collection.json"

# Debug: print arguments
echo "ORG: $ORG"
#echo "base64encoded: $base64encoded"
echo "NEWMAN_TARGET_URL: $NEWMAN_TARGET_URL"


# Install Newman if not already installed
npm install -g newman
#newman run $NEWMAN_TARGET_URL --reporters cli,junit --reporter-junit-export junitReport.xml --env-var client_id=$id --env-var client_secret=$secret
newman run $CI_PROJECT_DIR/$NEWMAN_TARGET_URL --reporters cli,junit --reporter-junit-export $CI_PROJECT_DIR/junitReport.xml --env-var client_id=$id --env-var client_secret=$secret
