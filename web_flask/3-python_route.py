#!/usr/bin/python3
""" Script that starts a Flask web application """
from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def default_route():
    """ default_route """
    return "Hello HBNB!"


@app.route('/hbnb', strict_slashes=False)
def hbnb_route():
    """hbnb_route """
    return "HBNB"


@app.route('/c/<text>', strict_slashes=False)
def c_route(text):
    """ c_route """
    return "C {}".format(text.replace("_", " "))


@app.route('/python', strict_slashes=False)
@app.route('/python/<text>', strict_slashes=False)
def python_route(text="is cool"):
    """ python_route """
    return "Python {}".format(text.replace("_", " "))


if __name__ == "__main__":
    app.run()
