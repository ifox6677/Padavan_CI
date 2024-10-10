#!/bin/bash

# 解析 JSON 输入内容
target=$1
plugins=$2
customization=$3

# 设置设备型号
case $target in
  "360_T6M")
    model="360-T6M"
    ;;
  "360_T6M-PB")
    model="360-T6M-PB"
    ;;
  "Arcadyan_WE410443-TC")
    model="WE410443-TC"
    ;;
  "Asus_RT-AC85P")
    model="RT-AC85P"
    ;;
  # ...（其他型号）...
  "Xiaomi-R3P")
    model="MI-R3P"
    ;;
  *)
    model="Mi-R3P" # 默认值
    ;;
esac

# 从插件设置中解析出各个配置
# 确保 plugins 是有效的 JSON 格式
vpnsvr=$(echo "$plugins" | jq -r '.vpnsvr')
vpncli=$(echo "$plugins" | jq -r '.vpncli')
vpncmd=$(echo "$plugins" | jq -r '.vpncmd')
ss=$(echo "$plugins" | jq -r '.ss')
v2ray=$(echo "$plugins" | jq -r '.v2ray')
xray=$(echo "$plugins" | jq -r '.xray')
trojan=$(echo "$plugins" | jq -r '.trojan')
ssobfs=$(echo "$plugins" | jq -r '.ssobfs')
dnsforwarder=$(echo "$plugins" | jq -r '.dnsforwarder')
adbyby=$(echo "$plugins" | jq -r '.adbyby')
adguardhome=$(echo "$plugins" | jq -r '.adguardhome')
smartdns=$(echo "$plugins" | jq -r '.smartdns')
aliddns=$(echo "$plugins" | jq -r '.aliddns')
zerotier=$(echo "$plugins" | jq -r '.zerotier')
ddnsto=$(echo "$plugins" | jq -r '.ddnsto')
wireguard=$(echo "$plugins" | jq -r '.wireguard')
frpc=$(echo "$plugins" | jq -r '.frpc')
aldrive=$(echo "$plugins" | jq -r '.aldrive')
sqm=$(echo "$plugins" | jq -r '.sqm')
mentohust=$(echo "$plugins" | jq -r '.mentohust')
scutclient=$(echo "$plugins" | jq -r '.scutclient')
njitclient=$(echo "$plugins" | jq -r '.njitclient')
minieap=$(echo "$plugins" | jq -r '.minieap')
dogcom=$(echo "$plugins" | jq -r '.dogcom')

# 从自定义设置中解析出自定义项
lanip=$(echo "$customization" | jq -r '.lanip')
signaccount=$(echo "$customization" | jq -r '.signaccount')
signpassword=$(echo "$customization" | jq -r '.signpassword')
wifi2gssid=$(echo "$customization" | jq -r '.wifi2gssid')
wifi5gssid=$(echo "$customization" | jq -r '.wifi5gssid')
wifi2gpsk=$(echo "$customization" | jq -r '.wifi2gpsk')
wifi5gpsk=$(echo "$customization" | jq -r '.wifi5gpsk')

# 导出环境变量
echo "MODEL=$model" >> $GITHUB_ENV
echo "VPN_SVR=$vpnsvr" >> $GITHUB_ENV
echo "VPN_CLI=$vpncli" >> $GITHUB_ENV
echo "VPN_CMD=$vpncmd" >> $GITHUB_ENV
echo "SS=$ss" >> $GITHUB_ENV
echo "V2RAY=$v2ray" >> $GITHUB_ENV
echo "XRAY=$xray" >> $GITHUB_ENV
echo "TROJAN=$trojan" >> $GITHUB_ENV
echo "SSOBFS=$ssobfs" >> $GITHUB_ENV
echo "DNSFORWARDER=$dnsforwarder" >> $GITHUB_ENV
echo "ADBYBY=$adbyby" >> $GITHUB_ENV
echo "ADGUARDHOME=$adguardhome" >> $GITHUB_ENV
echo "SMARTDNS=$smartdns" >> $GITHUB_ENV
echo "ALIDDNS=$aliddns" >> $GITHUB_ENV
echo "ZEROTIER=$zerotier" >> $GITHUB_ENV
echo "DDNSTO=$ddnsto" >> $GITHUB_ENV
echo "WIREGUARD=$wireguard" >> $GITHUB_ENV
echo "FRPC=$frpc" >> $GITHUB_ENV
echo "ALDRIVE=$aldrive" >> $GITHUB_ENV
echo "SQM=$sqm" >> $GITHUB_ENV
echo "MENTOHUST=$mentohust" >> $GITHUB_ENV
echo "SCUTCLIENT=$scutclient" >> $GITHUB_ENV
echo "NJIT_CLIENT=$njitclient" >> $GITHUB_ENV
echo "MINIEAP=$minieap" >> $GITHUB_ENV
echo "DOGCOM=$dogcom" >> $GITHUB_ENV
echo "LAN_IP=$lanip" >> $GITHUB_ENV
echo "SIGN_ACCOUNT=$signaccount" >> $GITHUB_ENV
echo "SIGN_PASSWORD=$signpassword" >> $GITHUB_ENV
echo "WIFI_2G_SSID=$wifi2gssid" >> $GITHUB_ENV
echo "WIFI_5G_SSID=$wifi5gssid" >> $GITHUB_ENV
echo "WIFI_2G_PSK=$wifi2gpsk" >> $GITHUB_ENV
echo "WIFI_5G_PSK=$wifi5gpsk" >> $GITHUB_ENV
