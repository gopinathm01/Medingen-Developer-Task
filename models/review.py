from models import db

class Review(db.Model):
    __tablename__ = 'review'

    id = db.Column(db.Integer, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey('product.id'), nullable=False)
    rating = db.Column(db.Float, nullable=False)
    text = db.Column(db.Text)

    product = db.relationship('Product', backref=db.backref('reviews', lazy=True))

    def __repr__(self):
        return f"<Review id={self.id} rating={self.rating}>"
