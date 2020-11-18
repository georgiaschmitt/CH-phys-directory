"""Updates all locations' coordinates in the database."""

import requests
import urllib
import os
from model import db, User, Favorite, Location, Physician, connect_to_db

GOOGLEMAPS_KEY = os.environ['GOOGLEMAPS_KEY']

def updatecoords():
    locations = Location.query.all()
    for location in locations:
        if location.institution != 'null':
            textinput = location.institution
        if location.institution == 'null':
            textinput = location.city
        geo_info = places_req(textinput)
        if geo_info['status'] == 'ZERO_RESULTS':
            textinput = location.city
            geo_info = places_req(textinput)
        print(geo_info)
        coords = geo_info['candidates'][0]['geometry']['location']
        lat = coords['lat']
        lng = coords['lng']
        location.lat = lat
        location.lng = lng
        db.session.commit()



def places_req(textinput):
    payload = {'input' : textinput,
            'inputtype': 'textquery',
            'fields': 'formatted_address,name,geometry',
            'key': GOOGLEMAPS_KEY}
    params = urllib.parse.urlencode(payload, quote_via=urllib.parse.quote)
    req = requests.get('https://maps.googleapis.com/maps/api/place/findplacefromtext/json', params=params)
    geo_info = req.json()
    return geo_info
    
        


if __name__ == '__main__':
    from server import app
    connect_to_db(app)


