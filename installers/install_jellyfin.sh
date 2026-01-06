#!/bin/bash
# 1) Stop/disable whatever is there
sudo systemctl stop jellyfin 2>/dev/null || true
sudo systemctl disable jellyfin 2>/dev/null || true

# 2) Remove any old/broken install
sudo apt purge -y jellyfin
sudo rm -f /etc/init.d/jellyfin
sudo rm -rf /etc/systemd/system/jellyfin.service.d
sudo systemctl daemon-reload

# 3) Add official Jellyfin repo (if not already)
sudo apt update
sudo apt install -y curl gnupg apt-transport-https ca-certificates lsb-release
curl -fsSL https://repo.jellyfin.org/ubuntu/jellyfin_team.gpg.key \
  | sudo gpg --dearmor -o /usr/share/keyrings/jellyfin.gpg
echo "deb [signed-by=/usr/share/keyrings/jellyfin.gpg arch=$(dpkg --print-architecture)] \
https://repo.jellyfin.org/ubuntu $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/jellyfin.list

# 4) Install fresh
sudo apt update
sudo apt install -y jellyfin jellyfin-ffmpeg

# 5) Enable & start
sudo systemctl enable --now jellyfin

# 6) Verify it's the systemd unit (not LSB)
systemctl cat jellyfin
systemctl status jellyfin --no-pager -l
