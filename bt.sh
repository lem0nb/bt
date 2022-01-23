installpanel_version=7.4.3 #版本
installpanel_admin_path_pl=True #取消入口限制
installpanel_port=8080 #面板端口

#正常安装官方最新版
curl -sSO http://download.bt.cn/install/install_panel.sh && bash install_panel.sh

#切换成自己想要的版本
curl -sL http://download.bt.cn/install/update6.sh|sed "s/version=.*/version=${installpanel_version}/g"|bash

#取消入口限制
if [[ "${installpanel_admin_path_pl}" == "False" ]];then
bt 11
fi

#改端口
if [[ "${installpanel_port}" ]];then
bt 8 <<EOF
$installpanel_port
EOF
fi

#安装软件(自己定制)
#installpanel_soft=False
if [[ "${installpanel_soft}" == "True" ]];then
dir=/www/server/panel/install
if [[ -f $dir/install_soft.sh ]];then
cd $dir
else
echo "没找到$dir/install_soft.sh，是不是没安装宝塔或者有其他错误"
fi
fi

bt default
