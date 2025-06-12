#!/bin/bash
echo "[RUN.SH]"

# Setup environment
export PATH=$PATH:/usr/local/bin  # For cron to find npx
cd "$(dirname "$0")" || { echo "Failed to cd into script directory"; exit 1; } # Change to current project directory

# Delay before running
DELAY=$((RANDOM % 180))
sleep $DELAY
echo "Started script at $(date)" 
echo ""
# Run commands
# # Daily spin
/usr/local/bin/npx ts-node scripts/spheron/spin.ts
# # check point
/usr/local/bin/npx ts-node scripts/spheron/points.ts
echo "" 


/usr/local/bin/npx ts-node scripts/main.ts 
