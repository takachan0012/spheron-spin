#!/bin/bash

# Setup environment
export PATH=$PATH:/usr/local/bin  # For cron to find npx
cd "$(dirname "$0")" || { echo "Failed to cd into script directory"; exit 1; } # Change to current project directory

# Delay before running
DELAY=$((RANDOM % 180))
sleep $DELAY
echo "Started script at $(date)" >> scripts/spheron/logs/cronjob.txt 2>&1
echo "" >> scripts/spheron/logs/cronjob.txt
# Run commands
# # Daily spin
/usr/local/bin/npx ts-node scripts/spheron/spin.ts >> scripts/spheron/logs/cronjob.txt 2>&1
# # check point
/usr/local/bin/npx ts-node scripts/spheron/points.ts >> scripts/spheron/logs/cronjob.txt 2>&1
echo "" >> scripts/spheron/logs/cronjob.txt


/usr/local/bin/npx ts-node scripts/main.ts >> scripts/spheron/logs/cronjob.txt 2>&1