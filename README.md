# gpu0-api-person-generator

## Mock Person & Credit Card API

This project provides a simple Flask API to generate mock person data along with credit card details. The data is generated on-the-fly and does **not** interact with any database.

## Features

-   Generates random person information (name, email, address, phone).
-   Generates random credit card details (number, formatted number, expiry month/year, CVC, type).
-   Single GET endpoint to retrieve data.
-   Health check endpoint.

## Project Structure

```
/apps/form-v4/app/gpu0-api-person-generator/
├── .venv/                  # Python virtual environment (created by install_deps.sh)
├── api.py                  # Main Flask application file
├── generate_person.py      # Module for generating person and CB data
├── install_deps.sh         # Shell script to set up environment and install dependencies
├── README.md               # This file
└── requirements.txt        # Python package dependencies
```

## Setup and Installation

1.  **Clone/Copy the project:**
    Ensure you have all the project files in your desired directory.

2.  **Set up Environment & Install Dependencies:**
    Navigate to the project root directory (`/apps/form-v4/app/gpu0-api-person-generator/`) in your terminal and run the installation script:
    ```bash
    chmod +x install_deps.sh
    ./install_deps.sh
    ```
    This script will:
    *   Create a Python virtual environment named `.venv`.
    *   Install the required Python packages (Flask, Flask-CORS) listed in `requirements.txt` into the virtual environment.

3.  **Activate the Virtual Environment:**
    After the script finishes, activate the virtual environment:
    ```bash
    source .venv/bin/activate
    ```
    Your terminal prompt should change to indicate that the virtual environment is active.

## Running the API

Once the virtual environment is activated, you can start the Flask development server:

```bash
python api.py
```

The API will be running on `http://localhost:5001`.

## API Endpoints

### 1. Get Person with Credit Card

-   **URL:** `/get_person_with_cb`
-   **Method:** `GET`
-   **Description:** Returns a JSON object containing randomly generated data for one person, including their credit card details.
-   **Success Response (200 OK):**
    ```json
    {
        "status": "success",
        "person": {
            "id": "unique-uuid-string",
            "firstName": "John",
            "lastName": "Doe",
            "email": "john.doe@example.com",
            "phone": "+1-555-123-4567",
            "street": "123 Main St",
            "city": "Anytown",
            "region": "StateA",
            "postalCode": "12345",
            "country": "USA",
            "card_number": "1234567890123456",
            "card_formatted": "1234 5678 9012 3456",
            "card_month": "12",
            "card_year": "2027",
            "card_cvc": "123",
            "card_type": "Visa"
        }
    }
    ```

### 2. Health Check

-   **URL:** `/health`
-   **Method:** `GET`
-   **Description:** A simple health check endpoint to verify that the API is running.
-   **Success Response (200 OK):**
    ```json
    {
        "status": "ok",
        "message": "API is running"
    }
    ```

## To Do / Potential Enhancements

-   Add option to specify country/locale for generated data.
-   Implement more sophisticated data generation.
-   Add basic request validation.
# gpu0-api-person-generator
# gpu0-api-person-generato
# gpu0-api-person-generato
# gpu0-api-person-generato
