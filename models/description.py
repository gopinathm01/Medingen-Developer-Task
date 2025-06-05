from models import db

class Description(db.Model):
    __tablename__ = 'description'  # explicitly define table name (optional but good practice)

    id = db.Column(db.Integer, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey('product.id'), nullable=False)
    section = db.Column(db.String(100))  # e.g., "About", "How it Works"
    content = db.Column(db.Text)

    def __repr__(self):
        return f"<Description id={self.id} section={self.section}>"
