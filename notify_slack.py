from urllib import request, parse
import json, os


def send_message(event, context):
    # get url from environment variable
    url = os.environ['SLACK_URL']
    s3url = os.environ['S3_DOWNLOAD_URL']
    body = {"text": f"A new *YourApplication* build has completed, and the artifact can be downloaded here: {s3url}"}

    jsondata = json.dumps(body);
    jsondatabytes = jsondata.encode('utf-8')

    req = request.Request(url)
    req.add_header('Content-type', 'application/json');
    resp = request.urlopen(req, jsondatabytes)

    print(resp)


#send_message("arg1", "arg2")
