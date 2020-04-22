from urllib import request, parse
import json, os


def send_message(event, context):
    # get url from environment variable
    url = os.environ['SLACK_URL']
    body = {"text": "Please dont delete this is a working in progress app"}

    jsondata = json.dumps(body);
    jsondatabytes = jsondata.encode('utf-8')

    req = request.Request(url)
    req.add_header('Content-type', 'application/json');
    resp = request.urlopen(req, jsondatabytes)

    print(resp)


# send_message("arg1", "arg2")
