#!/usr/bin/env bash

set -e

echo "Cleaning old processes..."
pkill Xvfb || true
pkill fluxbox || true
pkill x11vnc || true
pkill websockify || true
pkill chromium || true

echo "Installing required packages (this may take a bit)..."
sudo add-apt-repository ppa:xtradeb/apps -y
sudo apt-get update -y
sudo apt-get install -y xvfb x11vnc fluxbox novnc websockify chromium

echo "Starting virtual display on :2..."
export DISPLAY=:2
Xvfb :2 -screen 0 1280x800x24 &
sleep 1

echo "Starting Fluxbox window manager..."
fluxbox &
sleep 1

echo "Starting VNC server on port 5902..."
x11vnc -display :2 -nopw -forever -shared -rfbport 5902 &
sleep 1

echo "Starting noVNC on port 6082..."
websockify --web=/usr/share/novnc 6082 localhost:5902 &
sleep 1

echo "Launching Chromium..."
chromium --no-sandbox --disable-gpu --disable-dev-shm-usage &

echo ""
echo "All set!"
echo "Now expose port 6082 in the Ports tab and open:"
echo "  https://<your-codespace>-6082.preview.app.github.dev/vnc.html"
echo ""
