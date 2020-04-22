from urllib import request, parse
import json

url = 'https://hooks.slack.com/services/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'
body = {"text": "Hello, World!"}

jsondata = json.dumps(body);
jsondatabytes = jsondata.encode('utf-8')

req =  request.Request(url)
req.add_header('Content-type', 'application/json');
resp = request.urlopen(req, jsondatabytes)

print(resp)
