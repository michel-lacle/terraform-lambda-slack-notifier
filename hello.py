import requests

url = 'https://hooks.slack.com/services/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'
myobj = '{"text":"Hello, World!"}'
headers = { 'Content-type' : 'application/json'}

x = requests.post(url, data = myobj, headers = headers)

print(x.text)