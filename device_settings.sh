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
  "C-Life_XG1")
    model="C-Life-XG1"
    ;;
  "Diting_NEWIFI3")
    model="NEWIFI3"
    ;;
  "DLINK_DIR-878")
    model="DIR-878"
    ;;
  "DLINK_DIR-882")
    model="DIR-882"
    ;;
  "FCJ_G-AX1800_Black")
    model="G-AX1800-B"
    ;;
  "FCJ_G-AX1800_White")
    model="G-AX1800"
    ;;
  "Gee_B70")
    model="B70"
    ;;
  "GHL_R-001")
    model="GHL"
    ;;
  "H3C_TX1801")
    model="TX1801"
    ;;
  "H3C_TX1806")
    model="TX1801"
    ;;
  "Hair_HAR-20S2U1")
    model="HAR-20S2U1"
    ;;
  "JCG_836PRO")
    model="JCG-836PRO"
    ;;
  "JCG_AC860M")
    model="JCG-AC860M"
    ;;
  "JCG_Q20")
    model="JCG-Q20"
    ;;
  "JCG_Q20-PB")
    model="JCG-Q20-PB"
    ;;
  "JCG_Q10Pro")
    model="JCG-Q10Pro"
    ;;
  "JCG_Q10Pro-PB")
    model="JCG-Q10Pro-PB"
    ;;
  "JCG_Q11Pro")
    model="JCG-Q11Pro"
    ;;
  "JCG_Y2")
    model="JCG-Y2"
    ;;
  "JDCloud_1")
    model="JDCLOUD-RE-SP-01B"
    ;;
  "JDCloud_Luban")
    model="JDCLOUD-RE-CP-02"
    ;;
  "Lenovo_NEWIFI2")
    model="NEWIFI"
    ;;
  "Linksys_EA7500")
    model="EA7500"
    ;;
  "Motorola_MR2600")
    model="MR2600"
    ;;
  "Netgear_R6800")
    model="NETGEAR-R6800"
    ;;
  "Netgear_R7450")
    model="NETGEAR-R7450"
    ;;
  "Nokia-Sbell_A-040W-Q")
    model="BELL-A040WQ"
    ;;
  "Phicomm_K2P")
    model="K2P"
    ;;
  "Phicomm_K2P-NANO")
    model="K2P-NANO"
    ;;
  "Phicomm_K2P-USB")
    model="K2P-USB"
    ;;
  "QianmoBus_B1")
    model="QM-B1"
    ;;
  "Raisecom_MSG1500_X.00")
    model="MSG1500"
    ;;
  "Raisecom_MSG1500_Z.00")
    model="MSG1500-Z"
    ;;
  "Redmi_AC2100")
    model="RM2100"
    ;;
  "Skspruce_WIA3300-10")
    model="WIA3300-10"
    ;;
  "SIM_AX1800T")
    model="SIM-AX1800T"
    ;;
  "Xiaomi_4")
    model="MI-4"
    ;;
  "Xiaomi_AC2100")
    model="R2100"
    ;;
  "Xiaomi_CR6606")
    model="CR660x"
    ;;
  "Xiaomi_CR6608")
    model="CR660x"
    ;;
  "Xiaomi_CR6609")
    model="CR660x"
    ;;
  "Xiaomi_R3G")
    model="MI-R3G"
    ;;
  "Xiaomi_R3P")
    model="MI-R3P"
    ;;
  "Xiaomi_R3P-PB")
    model="MI-R3P-PB"
    ;;
  "Xiaomi_R3P-SPI")
    model="MI-R3P-SPI"
    ;;
  "Xiaomi_R4A")
    model="MI-R4A"
    ;;
  "Xiaoyu_C1")
    model="XY-C1"
    ;;
  "Xiaoyu_C3")
    model="XY-C1"
    ;;
  "Xiaoyu_C5")
    model="XY-C1"
    ;;
  "Youhua_WR1200JS")
    model="WR1200JS"
    ;;
  "Youhua_WR330")
    model="WR1200JS"
    ;;
  "ZTE_E8820V2")
    model="ZTE-E8820V2"
    ;;
  "ZTE_E8820S")
    model="ZTE-E8820S"
    ;;
  "ZTT_RX6000")
    model="ZTT-RX6000"
    ;;
  *)
    model="K2P" # 默认值
    ;;
esac

# 从插件设置中解析出各个配置
vpnsvr=$(echo $plugins | jq -r '.vpnsvr')
vpncli=$(echo $plugins | jq -r '.vpncli')
vpncmd=$(echo $plugins | jq -r '.vpncmd')
ss=$(echo $plugins | jq -r '.ss')
v2ray=$(echo $plugins | jq -r '.v2ray')
xray=$(echo $plugins | jq -r '.xray')
trojan=$(echo $plugins | jq -r '.trojan')
ssobfs=$(echo $plugins | jq -r '.ssobfs')
dnsforwarder=$(echo $plugins | jq -r '.dnsforwarder')
adbyby=$(echo $plugins | jq -r '.adbyby')
adguardhome=$(echo $plugins | jq -r '.adguardhome')
smartdns=$(echo $plugins | jq -r '.smartdns')
aliddns=$(echo $plugins | jq -r '.aliddns')
zerotier=$(echo $plugins | jq -r '.zerotier')
ddnsto=$(echo $plugins | jq -r '.ddnsto')
wireguard=$(echo $plugins | jq -r '.wireguard')
frpc=$(echo $plugins | jq -r '.frpc')
aldrive=$(echo $plugins | jq -r '.aldrive')
sqm=$(echo $plugins | jq -r '.sqm')
mentohust=$(echo $plugins | jq -r '.mentohust')
scutclient=$(echo $plugins | jq -r '.scutclient')
njitclient=$(echo $plugins | jq -r '.njitclient')
minieap=$(echo $plugins | jq -r '.minieap')
dogcom=$(echo $plugins | jq -r '.dogcom')

# 从自定义设置中解析出自定义项
lanip=$(echo $customization | jq -r '.lanip')
signaccount=$(echo $customization | jq -r '.signaccount')
signpassword=$(echo $customization | jq -r '.signpassword')
wifi2gssid=$(echo $customization | jq -r '.wifi2gssid')
wifi5gssid=$(echo $customization | jq -r '.wifi5gssid')
wifi2gpsk=$(echo $customization | jq -r '.wifi2gpsk')
wifi5gpsk=$(echo $customization | jq -r '.wifi5gpsk')

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
