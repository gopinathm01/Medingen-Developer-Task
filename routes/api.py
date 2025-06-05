from flask import Blueprint, request, jsonify
from models.user import User
from models.product import Product
from models.salt import SaltContent
from models.review import Review
from models.description import Description
from models import db
from utils.auth import generate_token
from flask_jwt_extended import jwt_required, create_access_token
from werkzeug.security import check_password_hash

api = Blueprint('api', __name__)

from werkzeug.security import generate_password_hash
from flask import request

# 🟢 Dummy registration endpoint it's not mandatory
@api.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    if not username or not password:
        return jsonify({"msg": "Username and password required"}), 400

    # Check if user already exists
    existing_user = User.query.filter_by(username=username).first()
    if existing_user:
        return jsonify({"msg": "User already exists"}), 409

    # Create new user
    hashed_password = generate_password_hash(password)
    new_user = User(username=username, password=hashed_password)
    db.session.add(new_user)
    db.session.commit()

    return jsonify({"msg": "User created successfully"}), 201


# 🟢 Dummy login endpoint 
@api.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get("username")
    password = data.get("password")
    print("Username:", username)
    print("Password:", password)

    user = User.query.filter_by(username=username).first()
    print("User:", user)
    if user:
        print("User password hash:", user.password)
        print("Password check:", check_password_hash(user.password, password))
    if user and check_password_hash(user.password, password):
        token = create_access_token(identity=username)
        return jsonify({"access_token": token}), 200
    return jsonify({"msg": "Invalid credentials"}), 401


# Get all products
@api.route('/products', methods=['GET'])
@jwt_required()
def get_products():
    products = Product.query.all()
    return jsonify([
        {
            "id": p.id,
            "name": p.name,
            "price": p.price,
            "image_url": p.image_url
        } for p in products
    ])


#Get salts by product
@api.route('/salts/<int:product_id>', methods=['GET'])
@jwt_required()
def get_salts(product_id):
    salts = SaltContent.query.filter_by(product_id=product_id).all()
    return jsonify([s.salt_name for s in salts])


#Get reviews by product
@api.route('/reviews/<int:product_id>', methods=['GET'])
@jwt_required()
def get_reviews(product_id):
    reviews = Review.query.filter_by(product_id=product_id).all()
    return jsonify([
        {
            "rating": r.rating,
            "text": r.text
        } for r in reviews
    ])


#Get descriptions by product
@api.route('/descriptions/<int:product_id>', methods=['GET'])
@jwt_required()
def get_descriptions(product_id):
    descriptions = Description.query.filter_by(product_id=product_id).all()
    return jsonify([
        {
            "section": d.section,
            "content": d.content
        } for d in descriptions
    ])
