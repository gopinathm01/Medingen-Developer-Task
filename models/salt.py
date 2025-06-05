from models import db

class SaltContent(db.Model):
    __tablename__ = 'salt_content'

    id = db.Column(db.Integer, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey('product.id'), nullable=False)
    salt_name = db.Column(db.String(100), nullable=False)

    product = db.relationship('Product', backref=db.backref('salt_contents', lazy=True))

    def __repr__(self):
        return f"<SaltContent id={self.id} salt_name={self.salt_name}>"
