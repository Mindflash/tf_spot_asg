#!/bin/bash
echo ${env} > /etc/mf-env
mkdir /etc/mf-secrets
aws s3 cp s3://mf-pa-secrets/${env}/secrets.js /etc/mf-secrets/secrets.js
aws s3 cp s3://mf-pa-secrets/${env}/key.pem /etc/mf-secrets/key.pem
cp /etc/mf-secrets/key.pem /home/app/node/key.pem
chown app:app /home/app/node/key.pem
chmod 755 /etc/mf-secrets
chmod 644 /etc/mf-secrets/*
chmod 644 /etc/mf-env

#Give the FS time to sync before the apps start
sleep 2