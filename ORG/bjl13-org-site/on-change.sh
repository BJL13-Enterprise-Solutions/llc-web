#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "🔁 Change detected. Rebuilding..."

# Rebuild Hugo
hugo --cleanDestinationDir --destination ./public

# Commit and push to Git (optional: tweak message strategy)
git add .
git commit -m "Auto-update: $(date -Is)" || echo "No changes to commit."
git push origin main  # or replace with your current branch

# Rebuild Docker
docker-compose up -d --build

echo "✅ Update complete."

