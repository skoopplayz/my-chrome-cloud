<div align="center">

# Chromium Desktop in Codespaces  
### via noVNC + Fluxbox + Xvfb

Run a full Linux desktop environment — including Chromium — directly inside **GitHub Codespaces**, viewable in your browser through **noVNC**.

</div>

---

<div align="center">

## Features

</div>

- Full virtual Linux desktop  
- Chromium browser (non‑snap APT version)  
- Fluxbox window manager  
- Xvfb virtual display  
- x11vnc VNC server  
- noVNC web client  
- One‑command startup script  

---

<div align="center">

## Getting Started

</div>

### **1. Make the script executable**

```bash
chmod +x start-vnc.sh

./start-vnc.sh

pkill Xvfb
pkill fluxbox
pkill x11vnc
pkill websockify
pkill chromium

