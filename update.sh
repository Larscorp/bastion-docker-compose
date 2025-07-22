#!/bin/bash

# Base directory to search from (default: current directory)
BASE_DIR="${1:-.}"

# Find all docker-compose.yml files
find "$BASE_DIR" -name "docker-compose.yml" | while read -r COMPOSE_FILE; do
    PROJECT_DIR=$(dirname "$COMPOSE_FILE")
    echo "🔍 Found docker-compose project in: $PROJECT_DIR"

    cd "$PROJECT_DIR" || continue

    echo "🔍 Checking running containers..."
    RUNNING_CONTAINERS=$(docker compose ps --services --filter "status=running")

    if [ -n "$RUNNING_CONTAINERS" ]; then
        echo "📥 Pulling latest images..."
        docker compose pull

        echo "🔁 Recreating running containers with new images..."
        docker compose up -d
    else
        echo "⏸️ No running containers."
    fi

    echo "✅ Done with: $PROJECT_DIR"
    echo "----------------------------------------"

    cd ..
done
