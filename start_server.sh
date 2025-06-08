#!/bin/bash
# Script to start the Flask web server

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the project directory (assuming the script is in the project root)
PROJECT_DIR=$(dirname "$0")
cd "$PROJECT_DIR"

VENV_DIR=".venv"
API_SCRIPT="api.py"

# Check if virtual environment exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Error: Virtual environment '$VENV_DIR' not found." >&2
    echo "Please run ./install_deps.sh first to set up the environment." >&2
    exit 1
fi

# Check if API script exists
if [ ! -f "$API_SCRIPT" ]; then
    echo "Error: API script '$API_SCRIPT' not found." >&2
    exit 1
fi

# Define the port the API will run on
API_PORT=5001

echo "Checking for existing server on port $API_PORT..."
# Try to find and kill any process using the API_PORT
# The 'fuser' command is suitable for this. '-k' kills the process, '-n tcp' specifies the namespace.
if fuser -k "$API_PORT/tcp" &> /dev/null; then
    echo "Killed existing process on port $API_PORT."
    # Add a small delay to allow the port to be released
    sleep 1 
else
    echo "No existing process found on port $API_PORT."
fi

echo "Activating virtual environment..."
# Source the activate script. Note: 'source' is a bash built-in.
# In a script, the activation is typically for the scope of the script itself
# or for commands run directly after. For a persistent activated shell,
# the user would run 'source .venv/bin/activate' manually.
# Here, we just need python from the venv.
PYTHON_EXEC="$VENV_DIR/bin/python"

if [ ! -x "$PYTHON_EXEC" ]; then
    echo "Error: Python executable not found in virtual environment: $PYTHON_EXEC" >&2
    exit 1
fi

echo "Starting the Flask API server..."
echo "Access the API at http://localhost:$API_PORT"
echo "Press Ctrl+C to stop the server."

# Run the Flask application
"$PYTHON_EXEC" "$API_SCRIPT"

echo "Server stopped."
