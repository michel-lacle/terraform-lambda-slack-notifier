#!/bin/bash

source .env


echo ${SLACK_URL}

python3 notify_slack.py