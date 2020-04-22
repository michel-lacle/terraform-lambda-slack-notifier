from urllib import request, parse
import json

def send_message():
    url = 'https://hooks.slack.com/services/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'
    body = {"text": "Hello, World!"}

    jsondata = json.dumps(body);
    jsondatabytes = jsondata.encode('utf-8')

    req =  request.Request(url)
    req.add_header('Content-type', 'application/json');
    resp = request.urlopen(req, jsondatabytes)

    print(resp)



send_message()