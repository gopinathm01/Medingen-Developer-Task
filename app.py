from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import Config
from models import db
from routes.api import api

app = Flask(__name__)
app.config.from_object(Config)

CORS(app)
JWTManager(app)

db.init_app(app)

app.register_blueprint(api, url_prefix='/api')

if __name__ == "__main__":
    with app.app_context():
        db.create_all()  # Create tables within app context
    app.run(debug=True)
