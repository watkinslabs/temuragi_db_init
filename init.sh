#!/bin/bash
set -e

echo "Starting database initialization..."

echo "Creating database: temuragi"
python -m app.cli database create temuragi

echo "Creating tables..."
python -m app.cli database create-tables

echo "Importing data..."
python -m app.cli porter import-dir /web/temuragi/data --update

echo "Initialization complete!"