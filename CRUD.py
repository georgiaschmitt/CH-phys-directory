"""CRUD operations."""
from model import db, User, Favorite, Location, Physician, connect_to_db


def create_user(email, password):
    """Create and return a new user."""

    user = User(email=email, password=password)
    db.session.add(user)
    db.session.commit()
    return user

def create_location(institution, city, state, coordinates):
    """Create and return a new location in the database."""
    location = Location(institution=institution, city=city, state=state, coordinates=coordinates)
    db.session.add(location)
    db.session.commit()
    return location

def create_physician(name, location):
    """Create and return a physician."""

    physician = Physician(name=name, location=location)
    db.session.add(physician)
    db.session.commit()
    return physician

def add_favorite(user_id, physician_id):
    """Create and return a new favorite."""
    
    user = User.query.get(user_id)
    physician = Physician.query.get(physician_id)
    user.favorites.append(physician)
    db.session.commit()
    return f"Added favorite: {physician}"

def get_all_physicians():
    """Returns all physicians."""
    return Physician.query.all()

def get_all_users():
    """Returns all users."""
    return User.query.all()

def get_all_locations():
    """Returns all locations."""
    return Location.query.all()

def get_physician_by_id(physician_id):
    """Return physician by id."""
    return Physician.query.get(physician_id)

def get_user_by_id(user_id):
    """Return user by id."""
    return User.query.get(user_id)

def get_user_by_email(email):
    """Return user by email."""
    return User.query.filter(User.email == email).first()



# def get_favorites_by_user(user):
#     """Return user's favorites."""
#     return user.favorites

# def get_favorites_by_physician(physician):
#     """Return a list of users who have favorited a physician."""
#     return physician.users
 
def get_physician_by_location(location):
    """Return physicians by location."""
    return Physician.query.filter(Physician.location == location).all()

def get_physician_name_by_location(location):
    """Return physicians' names by location."""
    names = []
    for physician in get_physician_by_location(location):
        name = physician.name
        names.append(name)
    return names


def get_physicians_by_state(state_query):
    """Return physician by state."""
    return Physician.query.filter(Physician.location.has(state = state_query)).all()

def get_locations_by_state(state_query):
    """Return locations by state."""
    return Location.query.filter(Location.state == state_query).all()

def get_physicians_by_name(name):
    """Return physicians by name."""
    return Physician.query.filter(Physician.name.like(f'%{name}%')).all()


def password_match(email, password):
    """Check if password matches email."""
    return User.query.filter(User.email == email, User.password==password).first()

def get_location_by_id(location_id):
    """Return location by id."""
    return Location.query.get(location_id)




if __name__ == '__main__':
    from server import app
    connect_to_db(app)
