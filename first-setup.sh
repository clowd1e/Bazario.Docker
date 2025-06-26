#!/bin/bash
set -e

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"

REPOSITORIES=(
    "https://github.com/Bazar-io/Bazario.Web.git"
    "https://github.com/Bazar-io/Bazario.AspNetCore.Shared.git"
    "https://github.com/Bazar-io/Bazario.Identity.git"
    "https://github.com/Bazar-io/Bazario.Users.git"
    "https://github.com/Bazar-io/Bazario.Notification.git"
    "https://github.com/Bazar-io/Bazario.Moderation.git"
    "https://github.com/Bazar-io/Bazario.ApiGateway.git"
)

echo "Cloning repositories into $BASE_DIR..."
echo

for REPO in "${REPOSITORIES[@]}"; do
    REPO_NAME=$(basename "$REPO" .git)
    REPO_DIR="$BASE_DIR/$REPO_NAME"

    if [ -d "$REPO_DIR" ]; then
        echo "Repository $REPO_NAME already exists. Skipping clone."
    else
        echo "Cloning $REPO..."
        git clone "$REPO" "$REPO_DIR"
        echo "Cloned $REPO_NAME."
    fi
done

echo
echo "All repositories cloned successfully."

sleep 3