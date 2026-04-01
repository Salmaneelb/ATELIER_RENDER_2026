import os
import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)

def get_db():
    return psycopg2.connect(os.getenv("DATABASE_URL"))

@app.route("/")
def index():
    return {"message": "Flask is running!"}

@app.route("/info")
def info():
    return {"app": "Flask Render", "student": "TON_NOM", "version": "v1"}

@app.route("/env")
def env():
    return {"env": os.getenv("ENV")}

@app.route("/db-test")
def db_test():
    try:
        conn = get_db()
        conn.close()
        return {"db": "connected"}
    except Exception as e:
        return {"db": "error", "detail": str(e)}, 500
