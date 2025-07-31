#!/bin/bash
set -e

# 1. Build site locally
hugo --cleanDestinationDir --destination ./public

# 2. Sync public/ to droplet (change path as needed)
rsync -az --delete -e "ssh -i ~/.ssh/bjl13_rsa" ./public/ bjl@bjl13.com:/home/bjl/src/ORG/bjl13-org-site/public/

# 3. Trigger rebuild on droplet
ssh -i ~/.ssh/bjl13_rsa bjl@bjl13.com '~/src/ORG/bjl13-org-site/rebuild-container.sh'
