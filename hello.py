import requests

def notify_slack(event, context):
    url = 'https://hooks.slack.com/services/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'
    myobj = '{"text":"Hello, World!"}'
    headers = { 'Content-type' : 'application/json'}

    x = requests.post(url, data=myobj, headers=headers)

    print(x.text)

    return {
        'message' : x.text
    }

