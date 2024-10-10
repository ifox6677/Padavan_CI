#!/bin/bash

# 进入工作路径
cd $WORK_PATH

# 复制设备配置模板
if [ ! -f configs/templates/$MODEL.config ] ; then
  echo "配置文件未找到: configs/templates/$MODEL.config"
  exit 1
fi
cp -f configs/templates/$MODEL.config trunk/.config

################################################################################################
# 先删除旧的配置项，确保新的配置能正确写入
################################################################################################
sed -i '/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CMD/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SSSERVER/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_ADBYBY/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_TUNSAFE/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_ALIDDNS/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SRELAY/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_ADGUARDHOME/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SMARTDNS/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_ZEROTIER/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_DDNSTO/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_WIREGUARD/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_FRPS/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_FRPC/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_ALDRIVER/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SQM/d' .config
# 校园网相关配置
sed -i '/CONFIG_FIRMWARE_INCLUDE_MENTOHUST/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_NJIT_CLIENT/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_MINIEAP/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_DOGCOM/d' .config

################################################################################################
# 写入新配置，按输入的插件和自定义项重新配置
################################################################################################
echo "CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER=$VPN_SVR" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT=$VPN_CLI" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CMD=$VPN_CMD" >> .config

# 科学上网相关
echo "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=$SS" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_V2RAY=$V2RAY" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_XRAY=$XRAY" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_TROJAN=$TROJAN" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SSOBFS=$SSOBFS" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SSSERVER=n" >> .config # SS server不需要
if [[ "$XRAY" == "y" && "$USE_XRAY_MIN" == "true" ]]; then
  sed -i 's/+= xray/+= xraymin/g' trunk/user/Makefile
fi

# 其他网络相关
echo "CONFIG_FIRMWARE_INCLUDE_SRELAY=n" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_TUNSAFE=n" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER=$DNSFORWARDER" >> .config

# 广告过滤
echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=$ADBYBY" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_ADGUARDHOME=$ADGUARDHOME" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNS=$SMARTDNS" >> .config

# DDNS、ZeroTier等网络功能
echo "CONFIG_FIRMWARE_INCLUDE_ALIDDNS=$ALIDDNS" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_ZEROTIER=$ZEROTIER" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_DDNSTO=$DDNSTO" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_WIREGUARD=$WIREGUARD" >> .config

# FRP配置
echo "CONFIG_FIRMWARE_INCLUDE_FRPS=n" >> .config # FRP server不需要
echo "CONFIG_FIRMWARE_INCLUDE_FRPC=$FRPC" >> .config # FRP client需要

# 云盘与流控
echo "CONFIG_FIRMWARE_INCLUDE_ALDRIVER=$ALDRIVE" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SQM=$SQM" >> .config # QOS流控

# 校园网相关
echo "CONFIG_FIRMWARE_INCLUDE_MENTOHUST=$MENTOHUST" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=$SCUTCLIENT" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_NJIT_CLIENT=$NJIT_CLIENT" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_MINIEAP=$MINIEAP" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_DOGCOM=$DOGCOM" >> .config

################################################################################################
# 自定义配置写入
################################################################################################
# 更新版本号
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=${FIRMWARE_VER}/g" trunk/versions.inc

# 配置局域网IP、管理员账号和Wi-Fi信息
bash trunk/bashScripts/setlanip.sh $LAN_IP
bash trunk/bashScripts/setaccount.sh $SIGN_ACCOUNT $SIGN_PASSWORD
bash trunk/bashScripts/setwifi.sh $WIFI_2G_SSID $WIFI_5G_SSID $WIFI_2G_PSK $WIFI_5G_PSK
