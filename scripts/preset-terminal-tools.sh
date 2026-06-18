#!/bin/bash
# preset-terminal-tools.sh — 终端工具预设
# TTYD 免登录
if [ -f feeds/packages/utils/ttyd/files/ttyd.config ]; then
  sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
fi
