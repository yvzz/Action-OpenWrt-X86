#!/bin/bash
# preset-adguard-core.sh — 下载 AdGuardHome 核心
arch="$1"
[ -z "$arch" ] && arch="amd64"
case "$arch" in
  amd64) adg_arch="linux_amd64" ;;
  arm64) adg_arch="linux_arm64" ;;
  armv7) adg_arch="linux_armv7" ;;
  *)     adg_arch="linux_amd64" ;;
esac

adg_dir="package/luci-app-adguardhome/root/usr/bin/AdGuardHome"
mkdir -p "$(dirname "$adg_dir")"

adg_url=$(curl -sL https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest | grep browser_download_url | grep "AdGuardHome_${adg_arch}" | head -1 | awk -F'"' '{print $4}')
[ -n "$adg_url" ] && wget -q "$adg_url" -O "$adg_dir" && chmod +x "$adg_dir"
