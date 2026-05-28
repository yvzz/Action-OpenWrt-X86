#!/bin/bash

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci

# ===== 网络配置 =====

# LAN 配置 (修改 IP 为 192.168.100.1)
uci set network.lan.ipaddr='192.168.100.1'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.gateway='192.168.100.1'
uci set network.lan.dns='192.168.100.1'

# WAN 配置 (DHCP 自动获取)
# 如果需要 PPPoE，取消下面的注释并修改账号密码
uci set network.wan=interface
uci set network.wan.device='eth1'
uci set network.wan.proto='dhcp'
# uci set network.wan.proto='pppoe'
# uci set network.wan.username='你的宽带账号'
# uci set network.wan.password='你的宽带密码'

# 无线配置 (2.4G)
uci set wireless.default_radio0.ssid='OpenWrt_2.4G'
uci set wireless.default_radio0.encryption='psk2'
uci set wireless.default_radio0.key='12345678'
uci set wireless.default_radio0.disabled='0'

# 无线配置 (5G)
uci set wireless.default_radio1.ssid='OpenWrt_5G'
uci set wireless.default_radio1.encryption='psk2'
uci set wireless.default_radio1.key='12345678'
uci set wireless.default_radio1.disabled='0'

# 提交网络配置
uci commit network
uci commit wireless

# 重启网络服务
/etc/init.d/network restart

exit 0
