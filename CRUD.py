"""CRUD operations."""
from model import db, User, UserFavorite, Favorite, City, Institution, Physician, connect_to_db


def create_user(email, password):
    """Create and return a new user."""

    user = __blank__(email=__blank__, password=__blank__)

    db.__blank__.__blank__(user)
    db.__blank__.__blank__()

    return user



if __name__ == '__main__':
    from server import app
    connect_to_db(app)
