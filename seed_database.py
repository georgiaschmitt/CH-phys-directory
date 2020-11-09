"""Script to seed database."""

from random import choice, randint

import crud
import model
import server


model.connect_to_db(server.app)

for n in range(10):
    email = f'user{n}@testemail.com' 
    password = 'test'
    user = crud.create_user(email, password)
