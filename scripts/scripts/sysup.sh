#!/usr/bin/env bash
set -euo pipefail

if ! sudo -n true 2>/dev/null; then
  echo "🔒 sudo password required, please enter it now"
  sudo -v
fi

(
  while true; do
    sudo -v       
    sleep 60     
  done
) &
KEEPALIVE_PID=$!

echo "🚀 running: yay -Syu"
yay -Syu

kill "$KEEPALIVE_PID" 2>/dev/null || true

echo "✅ update complete"
