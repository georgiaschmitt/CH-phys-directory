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
    password = db.Column(db.String_)

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

    userfav_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    fav_id = db.Column(db.Integer, db.ForeignKey('favs.fav_id'))

    def __repr__(self):
        return f'<UserFave userfav_id={self.userfav_id} user_id={self.user_id} fav_id={self.fav_id}>'





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