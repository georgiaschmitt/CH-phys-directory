"""Models for movie ratings app."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class User(db.Model):
    """A user."""

    __tablename__ = 'users'

    user_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    email = db.Column(db.String, unique=True)
    password = db.Column(db.String)

    favorites = db.relationship("Physician", secondary="favorites", backref="users")

    def __repr__(self):
        return f'<User user_id={self.user_id} email={self.email}>'

class Favorite(db.Model):
    """A favorite."""

    __tablename__ = 'favorites'

    fav_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    physician_id = db.Column(db.Integer, db.ForeignKey('physicians.physician_id'), nullable=False)


    def __repr__(self):
        return f'<Favorite fav_id={self.fav_id} user_id={self.user_id} phys_id={self.physician_id}>'



class Physician(db.Model):
    """A physician."""

    __tablename__ = 'physicians'

    physician_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    location_id = db.Column(db.Integer, db.ForeignKey('locations.location_id'))

    location = db.relationship('Location', backref='physicians')

    # Users = a list of User objects who have favorited this physician

    def __repr__(self):
        return f'<Physician physician_id={self.physician_id} name={self.name}>'


class Location(db.Model):
    """A location."""

    __tablename__ = 'locations'

    location_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    institution = db.Column(db.String)
    city = db.Column(db.String)
    state = db.Column(db.String)
    lat = db.Column(db.Numeric(precision=20, scale=15))
    lng = db.Column(db.Numeric(precision=20, scale=15))

    # Physicians = a list of Physician objects belonging to this location

    def __repr__(self):
        return f'<Location location_id={self.location_id} institution={self.institution} city={self.city}>'



def connect_to_db(flask_app, db_uri='postgresql:///CH', echo=True):
    """Connect the database to the Flask app."""
    flask_app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    flask_app.config['SQLALCHEMY_ECHO'] = echo
    flask_app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.app = flask_app
    db.init_app(flask_app)

    print('Connected to the db!')


if __name__ == '__main__':
    from server import app


    # Call connect_to_db(app, echo=False) if your program output gets
    # too annoying; this will tell SQLAlchemy not to print out every
    # query it executes.

    connect_to_db(app)