from urllib import request, parse
import json, os, boto3


def send_message(event, context):
    # get url from environment variable
    arn = os.environ['EMAIL_TOPIC_ARN']

    client = boto3.client('sns')

    response = client.publish(
        TopicArn=arn,
        TargetArn='string',
        Message='See details about failure here',
        Subject='Stage Failed'
    )
