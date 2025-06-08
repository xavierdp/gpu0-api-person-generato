# /apps/form-v4/app/gpu0-api-person-generator/api.py
#!/usr/bin/env python3
"""
API for providing a mock person with credit card details via a GET request.
This API does not interact with any database.
"""

from flask import Flask, jsonify
from flask_cors import CORS

# Import our local module for generating person data
from generate_person import generate_person_with_cb

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/get_person_with_cb', methods=['GET'])
def get_person_with_cb_endpoint():
    """
    Endpoint to get a single mock person with credit card details.
    Data is generated on the fly, no database interaction.
    """
    person_data = generate_person_with_cb()
    return jsonify({
        "status": "success",
        "person": person_data
    })

@app.route('/health', methods=['GET'])
def health_check():
    """Simple health check endpoint."""
    return jsonify({
        "status": "ok",
        "message": "API is running"
    })

if __name__ == '__main__':
    # Note: For development only. Use a proper WSGI server for production.
    app.run(debug=True, port=5001) # Using a different port to avoid conflict if 5000 is common
