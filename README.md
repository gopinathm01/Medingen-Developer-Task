#project setup 

medingen-backend/
│
├── app.py                  # Entry point of the Flask application
├── config.py               # Configuration settings for the Flask app
├── create_db.py            # Script to initialize or create the database tables
├── db_export.sql           # Optional: SQL dump for backup or import
├── requirements.txt        # List of dependencies for the app
├── .env                    # Environment variables (like DB credentials, secret keys)
│
├── models/                 # Database Models (SQLAlchemy ORM)
│   ├── __init__.py         # Binds all models for easy import
│   ├── description.py      # Description model (if medicines have textual details)
│   ├── product.py          # Product model (main medicine info)
│   ├── review.py           # Review model (user reviews, ratings)
│   ├── salt.py             # Salt model (composition info)
│   └── user.py             # User model (authentication, info)
│
├── routes/                 #  API route handlers
│   ├── __init__.py         # (Optional) if you want to make routes a package
│   └── api.py              # Main routes (register, login, product API, etc.)
│
├── utils/                  #  Utility functions/modules
│   ├── __init__.py         # (Optional)
│   └── auth.py             # Authentication helpers (JWT creation, password hashing)


# for more read requirement.txt file
