#!/bin/bash
# Script to set up the Python virtual environment and install dependencies

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the project directory (assuming the script is in the project root)
PROJECT_DIR=$(dirname "$0")
cd "$PROJECT_DIR"

PYTHON_EXEC="python3"
VENV_DIR=".venv"

# Check if Python 3 is installed
if ! command -v $PYTHON_EXEC &> /dev/null
then
    echo "Error: $PYTHON_EXEC is not installed or not in PATH." >&2
    exit 1
fi

echo "Setting up Python virtual environment..."

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    $PYTHON_EXEC -m venv $VENV_DIR
    echo "Virtual environment '$VENV_DIR' created."
else
    echo "Virtual environment '$VENV_DIR' already exists."
fi

# Install dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    # Activate virtual environment for pip command or call pip directly
    # Using direct path to pip for robustness in scripts
    "$VENV_DIR/bin/python" -m pip install -r requirements.txt
    echo "Dependencies installed successfully."
else
    echo "Warning: requirements.txt not found. Skipping dependency installation." >&2
fi

echo "
Setup complete.
To activate the virtual environment, run:
  source $VENV_DIR/bin/activate
To run the API (after activating the venv), use:
  python api.py
"
