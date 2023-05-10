#!/bin/bash
#
#必须 cd /opt/rt-n56u/blob/master/trunk 方可执行sh在这个目录下

echo '修改密码'
sed -i 's/#define\s*DEF_ROOT_PASSWORD\s*"admin"/#define  DEF_ROOT_PASSWORD     "123"/g' ./user/shared/defaults.h

echo '修改NTP1为中国NTP快速授时服务'
sed -i "s/ntp1.aliyun.com/cn.ntp.org.cn/g" ./user/shared/defaults.h

echo '修改NTP2为国家授时中心'
sed -i "s/2001:470:0:50::2/ntp.ntsc.ac.cn/g" ./user/shared/defaults.h

svn co https://github.com/hanwckf/padavan-4.4/branches/main/trunk/build_firmware_modify

echo '超级精简配置'
sed -i '/### Enable USB support/,$d' ./configs/templates/*.config
sed -i '$a\CONFIG_FIRMWARE_INCLUDE_LANG_CN=y'  ./configs/templates/*.config
