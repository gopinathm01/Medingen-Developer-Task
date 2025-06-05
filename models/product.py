from models import db

class Product(db.Model):
    __tablename__ = 'product'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    price = db.Column(db.Float, nullable=False)
    image_url = db.Column(db.String(255))

    # One-to-many relationship: One product can have multiple descriptions
    descriptions = db.relationship('Description', backref='product', lazy=True)

    def __repr__(self):
        return f"<Product id={self.id} name={self.name}>"
