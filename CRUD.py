"""CRUD operations."""
from model import db, User, UserFavorite, Favorite, City, Institution, Physician, connect_to_db


def create_user(email, password):
    """Create and return a new user."""

    user = User(email=email, password=password)
    db.session.add(user)
    db.session.commit()
    return user

def create_favorite(user, physician):

    favorite = Favorite(physician)



if __name__ == '__main__':
    from server import app
    connect_to_db(app)
