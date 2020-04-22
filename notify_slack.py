from urllib import request, parse
import json
body = {"text": "Hello, World!"}

url = 'https://hooks.slack.com/services/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'
url = 'https://hooks.slack.com/services/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'
headers = {'Content-type': 'application/json'}
data = parse.urlencode(body).encode()

jsondata = json.dumps(body);
jsondatabytes = jsondata.encode('utf-8')


req =  request.Request(url, data=data) # this will make the method "POST"
req.add_header('Content-type', 'application/json');
resp = request.urlopen(req, jsondatabytes)

print(resp)


#import urllib.request

#x = urllib.request.urlopen('https://www.google.com/')
#print(x.read())