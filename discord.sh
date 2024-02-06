#!/bin/sh

WEBHOOK_URL="ADD WEBHOOK URL HERE"
SERVERNAME="Proxmox" # change name to your pve server

# cat the outcome of the piped mail.
BODY="$(cat)"

JSON=$(jq -n --arg body_oneline "$BODY" '{ "content": null, "embeds": [ { "title": "Proxmox", "description": $body_oneline } ] }')
curl -d "$JSON" -H "Content-Type: application/json" "$WEBHOOK_URL"