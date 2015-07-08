#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage: marathon-deploy.sh [json_deployment_file]"
    exit 1
fi

port=8080

masters=( 01.master.mesos.domain.tld \
          02.master.mesos.domain.tld \
          03.master.mesos.domain.tld )

master=${masters[$RANDOM % ${#masters[@]} ]}

echo "Using '${master}'..."
curl -i -H 'Content-Type: application/json' -d@${1} ${master}:${port}/v2/apps
