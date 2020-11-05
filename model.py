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

    # favorites = a list of favorites objects for this user

    def __repr__(self):
        return f'<User user_id={self.user_id} email={self.email}>'

class Favorite(db.Model):
    """A favorite."""

    __tablename__ = 'favorites'

    fav_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    physician_id = db.Column(db.Integer, db.ForeignKey('physicians.physician_id'))

    users = db.relationship("User", secondary="userfavorites", backref="favorites")
    physician = db.relationship('Physician', backref='Favorites')


    def __repr__(self):
        return f'<Favorite fav_id={self.fav_id} physician_id={self.physician_id}>'


class UserFavorite(db.Model):
    """A user-favorite."""

    __tablename__ = 'userfavorites'

    userfav_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    fav_id = db.Column(db.Integer, db.ForeignKey('favorites.fav_id'), nullable=False)


    def __repr__(self):
        return f'<UserFavorite userfav_id={self.userfav_id} user_id={self.user_id} fav_id={self.fav_id}>'



class Physician(db.Model):
    """A physician."""

    __tablename__ = 'physicians'

    physician_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    institution_id = db.Column(db.Integer, db.ForeignKey('institutions.institution_id'), nullable=True)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'))

    institution = db.relationship('Institution', backref='Physicians')
    city = db.relationship('City', backref='Physicians')

    # Favorites = a list of Favorite objects

    def __repr__(self):
        return f'<Physician physician_id={self.physician_id} name_id={self.name}>'


class Institution(db.Model):
    """An institution."""

    __tablename__ = 'institutions'

    institution_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'))

    city = db.relationship('City', backref='Institutions')

    # Physicians = a list of Physician objects

    def __repr__(self):
        return f'<Institution institution_id={self.institution_id} name={self.name}>'


class City(db.Model):
    """A city."""

    __tablename__ = 'cities'

    city_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    coordinates = db.Column(db.Numeric(precision=20, scale=15))
    
    # Physicians = a list of Physician objects
    # Institutions = a list of Institution objects

    def __repr__(self):
        return f'<City city_id={self.city_id} name={self.name}>'




def connect_to_db(flask_app, db_uri='postgresql:///CH', echo=True):
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