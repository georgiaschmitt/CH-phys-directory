"""Server for Cluster Headache Provider Directory app."""

from flask import (Flask, render_template, jsonify, request, flash, session,
                   redirect)
from model import connect_to_db
import crud
from jinja2 import StrictUndefined

app = Flask(__name__)
app.secret_key = 'dev'
app.jinja_env.undefined = StrictUndefined


@app.route("/")
def homepage():
    """View homepage."""

    if 'user_id' in session:
        return render_template("user-homepage.html")
    else:
        return render_template("homepage.html")

@app.route("/users", methods=['POST'])
def register_user():
    """Create a new user."""
    email = request.form.get("email")
    password = request.form.get("password")

    if crud.get_user_by_email(email):
        flash('There is already an account with that email, please try again!')
    else:
        crud.create_user(email, password)
        flash('Account created! Please log in.')
    return redirect("/")

@app.route("/login")
def user_login():
    """Log a user in."""
    email = request.args.get("login-email")
    password = request.args.get("login-password")
    if crud.password_match(email, password):
        user = crud.get_user_by_email(email)
        session['user_id'] = user.user_id
        session['user_email'] = user.email
        flash('Logged in!')
    else:
        flash('Username and password do not match, please try again!')
    return redirect("/")

@app.route("/logout")
def user_logout():
    """Log a user out."""
    session.clear()
    flash('Logged out')
    return redirect("/")



@app.route("/search/state")
def search_by_state():
    """Search providers by state."""

    if "user_id" in session:
        user = crud.get_user_by_id(session['user_id'])
    else:
        user = None
    
    query_state = request.args.get('state')
    providers = crud.get_physicians_by_state(query_state)
    return render_template('search_results.html', providers=providers, user=user)


@app.route("/search/name")
def search_by_name():
    """Search providers by name."""
    if "user_id" in session:
        user = crud.get_user_by_id(session['user_id'])
    else:
        user = None
    name = request.args.get('name')
    providers = crud.get_physicians_by_name(name)
    return render_template('search_results.html', providers=providers, user=user)


@app.route("/providers")
def all_providers():
    """View all providers."""
    if "user_id" in session:
        user = crud.get_user_by_id(session['user_id'])
    else:
        user = None
    providers = crud.get_all_physicians()
    return render_template("all_providers.html", providers=providers, user=user)

@app.route("/api/locations")
def location_info():
    """JSON information about provider locations."""

    locations = [
        {
            "id": location.location_id,
            "providers": crud.get_physician_name_by_location(location),
            "institution": location.institution,
            "city": location.city,
            "state": location.state,
            "lat": float(location.lat),
            "lng": float(location.lng),
        }
        for location in crud.get_all_locations()
    ]
    print(locations)
    return jsonify(locations)

@app.route("/providers/<provider_id>")
def show_provider(provider_id):
    """Show details on a provider."""
    if "user_id" in session:
        user = crud.get_user_by_id(session['user_id'])
    else:
        user = None
    provider = crud.get_physician_by_id(provider_id)
    return render_template('provider_details.html', provider=provider, user=user)

@app.route("/suggestion_form")
def suggest_provider():
    return render_template('suggestion_form.html')


@app.route("/bookmarks")
def show_user_bookmarks():
    """Show a user's bookmarks."""
    if 'user_id' in session:
        user = crud.get_user_by_id(session['user_id'])
        return render_template("user_bookmarks.html", user=user)
    else:
        return redirect("/")

@app.route("/new-bookmark", methods=["POST"])
def add_bookmark():
    """Add a provider to a user's bookmarked list in the database."""

    user_id = session['user_id']
    physician_id = request.form.get("physician")
    add = crud.add_bookmark(user_id, physician_id)
    return add

@app.route("/remove-bookmark", methods=["POST"])
def remove_bookmark():
    """Remove a provider from a user's bookmarks."""
    user_id= session['user_id']
    physician_id = request.form.get("physician")
    add = crud.remove_bookmark(user_id, physician_id)
    return add

@app.route("/clear-bookmarks", methods=["POST"])
def clear_bookmarks():
    """Clear all of a user's bookmarks."""
    user_id = session['user_id']
    add = crud.remove_all_bookmarks(user_id)
    return add



if __name__ == '__main__':
    connect_to_db(app)
    app.run(host='0.0.0.0', debug=True)
