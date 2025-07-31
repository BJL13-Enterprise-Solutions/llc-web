#!/bin/bash
set -e

cd ~/src/ORG/bjl13-org-site/

echo "🔁 Rebuilding Docker container to serve updated Hugo public/..."

docker-compose down
docker-compose up -d --build

echo "✅ Deployment complete: https://bjl13.org"
