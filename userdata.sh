#!/bin/bash
echo ${env} > /etc/mf-env
mkdir /etc/mf-secrets
aws s3 cp s3://mf-pa-secrets/${env}/secrets.js /etc/mf-secrets/secrets.js
aws s3 cp s3://mf-pa-secrets/${env}/key.pem /etc/mf-secrets/key.pem
cp /etc/mf-secrets/key.pem /home/ubuntu/node/key.pem
chown ubuntu:ubuntu /home/ubuntu/node/key.pem