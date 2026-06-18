#!/bin/bash
# preset-clash-core.sh — 下载 OpenClash 所用的 clash 内核
arch="$1"
[ -z "$arch" ] && arch="amd64"
clash_core_dir="package/luci-app-openclash/files/etc/openclash/core"
mkdir -p "$clash_core_dir"

# dev 内核
dev_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep browser_download_url | grep "$arch" | grep -v "sha256sum" | head -1 | awk -F'"' '{print $4}')
[ -n "$dev_url" ] && wget -q "$dev_url" -O "$clash_core_dir/clash"

# meta 内核
meta_url=$(curl -sL https://api.github.com/repos/MetaCubeX/mihomo/releases/latest | grep browser_download_url | grep "$arch" | grep -v "sha256sum" | head -1 | awk -F'"' '{print $4}')
[ -n "$meta_url" ] && wget -q "$meta_url" -O "$clash_core_dir/clash_meta"

# 赋权
chmod +x "$clash_core_dir"/clash* 2>/dev/null || true
