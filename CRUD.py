"""CRUD operations."""
from model import db, User, Favorite, Location, Physician, connect_to_db


def create_user(email, password):
    """Create and return a new user."""

    user = User(email=email, password=password)
    db.session.add(user)
    db.session.commit()
    return user

def add_favorite(user, physician):
    """Create and return a new favorite."""
    
    user.favorites.append(physician)
    db.session.commit()

def create_physician(name, location):
    """Create and return a physician."""

    physician = Physician(name=name, location=location)
    db.session.add(physician)
    db.session.commit()
    return physician



if __name__ == '__main__':
    from server import app
    connect_to_db(app)
