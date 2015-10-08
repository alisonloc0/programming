import httplib
import json

h = httplib.HTTPConnection('graph.facebook.com')
h.request('GET', '/19292868552')
response = h.getresponse()
content_length = int(response.getheader('Content-Length','0'))

# Read data until we've read Content-Length bytes or the socket is closed
data = ''
while len(data) < content_length or content_length == 0:
    s = response.read(content_length - len(data))
    if not s:
        break
    data += s

# We now have the full data -- decode it
j = json.loads(data)
print j