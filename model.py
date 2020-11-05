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

    def __repr__(self):
        return f'<User user_id={self.user_id} email={self.email}>'

class UserFavorite(db.Model):
    """A user-favorite."""

    __tablename__ = 'userfavorites'

    userfav_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    fav_id = db.Column(db.Integer, db.ForeignKey('favs.fav_id'))

    def __repr__(self):
        return f'<UserFavorite userfav_id={self.userfav_id} user_id={self.user_id} fav_id={self.fav_id}>'

class Favorite(db.Model):
    """A favorite."""

    __tablename__ = 'favorites'

    fav_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    physician_id = db.Column(db.Integer, db.ForeignKey('physicians.physician_id'))

    def __repr__(self):
        return f'<Favorite fav_id={self.fav_id} physician_id={self.physician_id}>'

class Physician(db.Model):
    """A physician."""

    __tablename__ = 'physicians'

    physician_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    institution_id = db.Column(db.Integer, db.ForeignKey('institution.user_id'), nullable=True)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.cities_id'))

    def __repr__(self):
        return f'<Physician physician_id={self.physician_id} name_id={self.name}>'

class Institution(db.Model):
    """An institution."""

    __tablename__ = 'institutions'

    institution_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.cities_id'))

    def __repr__(self):
        return f'<Institution institution_id={self.institution_id} name={self.name}>'

class City(db.Model):
    """A city."""

    __tablename__ = 'cities'

    city_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String)
    coordinates = db.Column(db.String)

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
    db.create_all()
    connect_to_db(app)