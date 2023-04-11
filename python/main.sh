#!/bin/bash
export PATH="~/nginx/sbin:~/${REPL_SLUG}/python:$PATH"
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}
chmod a+x ./python/nginx.sh
./python/nginx.sh
uuid=$(grep -oE -m1 '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}' /tmp/config.json)
echo
green "========================================="
echo
blue "安装完毕！请点击下面白色的网页链接，查看相关协议信息"
echo 
echo "https://${REPL_SLUG}.${REPL_OWNER}.repl.co/$uuid.html" 
echo
yellow "最新更新日志：
2023.4.4更新：
1、分享链接：replit域名地址/变量uuid.html
2、伪装网页默认为随机，可设置www变量指定伪装网页（范围1-9）
3、分享链接内的协议支持一键复制协议链接
4、加入苹果oneclick免费客户端支持，须设置ver变量，值为任意字符

视频教程：https://www.youtube.com/@ygkkk
博客地址：https://ygkkk.blogspot.com"
echo
while true; do curl -s --user-agent "${UA_Browser}" "https://${REPL_SLUG}.${REPL_OWNER}.repl.co" >/dev/null 2>&1 && echo "$(date +'%Y%m%d%H%M%S') 我还活着 ..."; sleep 600; done &

./python/$(cat ./python/xr.log) -c /tmp/config.json >/dev/null 2>&1 &
./nginx/sbin/nginx -g 'daemon off;'
tail -f