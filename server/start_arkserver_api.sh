#!/bin/bash

APP_DIR="/home/arkserver/tmacvica-arkserver"
LOG_FILE="$APP_DIR/server.log"
PID_FILE="$APP_DIR/server.pid"

cd "$APP_DIR" || exit 1

# Start the server in the background and write output to log
nohup npm start >> "$LOG_FILE" 2>&1 &

# Save the PID
echo $! > "$PID_FILE"
echo "Server started with PID $(cat $PID_FILE)"

