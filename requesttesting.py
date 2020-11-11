import requests
import urllib

payload = { 'input' : 'Mayo Clinic Rochester',
'inputtype': 'textquery',
'fields': 'formatted_address,name,geometry',
'key': 'AIzaSyAmekBy-tOKe3uQr7priiJ7te4a_nLSUV0'}
params = urllib.parse.urlencode(payload, quote_via=urllib.parse.quote)

req = requests.get('https://maps.googleapis.com/maps/api/place/findplacefromtext/json', params=params)

print(req.url)

# geo_info = req.json()
# results = res.json()

#https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Mayo%20Clinic&inputtype=textquery&fields=formatted_address,name,geometry&key=AIzaSyAmekBy-tOKe3uQr7priiJ7te4a_nLSUV0
