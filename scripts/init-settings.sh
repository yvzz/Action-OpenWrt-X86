#!/bin/sh
# init-settings.sh — OpenWrt 初始设置（uci-defaults）

# 语言 & 时区
uci set luci.languages.zh-cn=internal
uci set luci.main.lang=zh_cn
uci set system.@system[0].zonename='Asia/Shanghai'
uci set system.@system[0].timezone='CST-8'

# 主机名
uci set system.@system[0].hostname='OpenWrt'

# 网络 — IP 在编译时由 sed 替换
uci set network.lan.ipaddr='10.0.0.252'

uci commit
exit 0
