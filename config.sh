#!/bin/bash

# 进入工作路径
cd $WORK_PATH

# 复制配置模板
cp -f configs/templates/$MODEL.config trunk/.config

# 删除不必要的配置项
sed -i '/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER/d' .config
sed -i '/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT/d' .config
# 更多删除命令...

# 应用从环境变量传递的配置
echo "CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER=$VPN_SVR" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT=$VPN_CLI" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=$SS" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_XRAY=$XRAY" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_TROJAN=$TROJAN" >> .config

# 配置局域网 IP 和管理员账号
bash trunk/bashScripts/setlanip.sh $LAN_IP
bash trunk/bashScripts/setaccount.sh $SIGN_ACCOUNT $SIGN_PASSWORD
