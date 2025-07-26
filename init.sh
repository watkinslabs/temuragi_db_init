#!/bin/bash
set -e

echo "Starting database initialization..."

#"Postgress creates the database and the user"

echo "Creating tables..."
python -m app.cli database create-tables

echo "Importing data..."
python -m app.cli porter import-dir /web/temuragi/data --update

echo "Initialization complete!"