#!/bin/sh
exec python yolov5/detect-mod.py --weights "$WEIGHTS" --source "$SOURCE" --chat-id "$CHAT_ID" --token "$TOKEN"
