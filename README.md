# my-chrome-cloud
Chromium Desktop in GitHub Codespaces (noVNC)
This project launches a full Linux desktop environment inside GitHub Codespaces, complete with:

# Xvfb (virtual display)

# Fluxbox (window manager)

# x11vnc (VNC server)

# noVNC (browser‑based VNC viewer)

# Chromium (installed from a real APT repository, not snap)

You can open a full GUI desktop directly in your browser and run Chromium like a normal Linux machine.

# Requirements
You must run this inside a GitHub Codespace using an Ubuntu‑based container (24.04 Noble or similar).

# Getting Started
1. Make the script executable
From the root of your Codespace:

# bash
chmod +x start-vnc.sh
2. Start the desktop + Chromium
Run:

# bash
./start-vnc.sh
The script will:

# Install Chromium from the xtradeb APT repository

# Start a virtual display on :2

# Launch Fluxbox

# Start x11vnc on port 5902

# Start noVNC on port 6082

# Launch Chromium with the correct flags

# Accessing the Desktop
# Open the Ports tab in GitHub Codespaces

# Find port 6082

# Set it to Public

# Open the URL shown in the Ports tab, which looks like:

Code
https://<your-codespace>-6082.preview.app.github.dev/vnc.html
You’ll now see a full Linux desktop running in your browser.
Chromium will launch automatically.

Stopping Everything (End All Tasks)
To shut down the desktop, VNC server, noVNC, and Chromium, run:

bash
pkill Xvfb
pkill fluxbox
pkill x11vnc
pkill websockify
pkill chromium
This cleanly stops:

The virtual display

The window manager

The VNC server

The noVNC proxy

Chromium

Your Codespace returns to normal.

Restarting Later
Any time you want to start the desktop again:

bash
./start-vnc.sh
