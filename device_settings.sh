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
  # 继续为其他设备设置型号...
  *)
    model="default"
    ;;
esac

# 从插件设置中解析出各个配置
vpnsvr=$(echo $plugins | jq -r '.vpnsvr')
vpncli=$(echo $plugins | jq -r '.vpncli')
ss=$(echo $plugins | jq -r '.ss')
xray=$(echo $plugins | jq -r '.xray')
trojan=$(echo $plugins | jq -r '.trojan')

# 从自定义设置中解析出自定义项
lanip=$(echo $customization | jq -r '.lanip')
signaccount=$(echo $customization | jq -r '.signaccount')
signpassword=$(echo $customization | jq -r '.signpassword')

# 导出环境变量
echo "MODEL=$model" >> $GITHUB_ENV
echo "VPN_SVR=$vpnsvr" >> $GITHUB_ENV
echo "VPN_CLI=$vpncli" >> $GITHUB_ENV
echo "SS=$ss" >> $GITHUB_ENV
echo "XRAY=$xray" >> $GITHUB_ENV
echo "TROJAN=$trojan" >> $GITHUB_ENV
echo "LAN_IP=$lanip" >> $GITHUB_ENV
echo "SIGN_ACCOUNT=$signaccount" >> $GITHUB_ENV
echo "SIGN_PASSWORD=$signpassword" >> $GITHUB_ENV
