from urllib import request, parse
import json

def send_message():
    url = 'https://hooks.slack.com/services/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'
    body = {"text": "Please dont delete this is a working in progress app"}

    jsondata = json.dumps(body);
    jsondatabytes = jsondata.encode('utf-8')

    req =  request.Request(url)
    req.add_header('Content-type', 'application/json');
    resp = request.urlopen(req, jsondatabytes)

    print(resp)



send_message()