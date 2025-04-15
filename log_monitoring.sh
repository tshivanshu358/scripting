#!/bin/bash

# Variables
LOG_DIR="/var/log"
ANALYSIS_DIR="$HOME/log_analysis"
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
ANALYSIS_FILE="$ANALYSIS_DIR/analysis_$TIMESTAMP.log"
EMAIL="your-email@example.com"
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX"

mkdir -p "$ANALYSIS_DIR"

# Step 1: Copy logs
echo "Collecting logs..."
cp $LOG_DIR/*.log "$ANALYSIS_DIR/" 2>/dev/null

# Step 2: Analyze logs for errors and common warnings
echo "Analyzing logs..." | tee -a "$ANALYSIS_FILE"
for file in "$ANALYSIS_DIR"/*.log; do
    echo ">>> Checking $file" >> "$ANALYSIS_FILE"
    grep -i "error\|fail\|warning\|critical" "$file" >> "$ANALYSIS_FILE"
done

# Step 3: Provide suggestions
echo -e "\n>>> Hints to resolve common errors:\n" >> "$ANALYSIS_FILE"
grep -i "permission denied" "$ANALYSIS_FILE" && echo "Try checking file/directory permissions using chmod/chown." >> "$ANALYSIS_FILE"
grep -i "connection refused" "$ANALYSIS_FILE" && echo "Verify if the target service is running and accessible." >> "$ANALYSIS_FILE"
grep -i "not found" "$ANALYSIS_FILE" && echo "Check if the referenced command or file exists." >> "$ANALYSIS_FILE"

# Step 4: Email notification (if mail is configured)
SUBJECT="Log Analysis Report - $TIMESTAMP"
mail -s "$SUBJECT" "$EMAIL" < "$ANALYSIS_FILE"

# Step 5: Slack notification
SLACK_MSG="{
  \"text\": \"📋 Log Analysis completed on $(hostname) at $TIMESTAMP. Potential issues found. Check: $ANALYSIS_FILE\"
}"

curl -X POST -H 'Content-type: application/json' --data "$SLACK_MSG" "$SLACK_WEBHOOK_URL"

echo "Analysis complete. Results saved in $ANALYSIS_FILE"
