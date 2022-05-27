#!/bin/bash
exec /root/.config/ecoconfig.js
cd /opt/impl-agency/
pm2 start ecosystem.config.js
exit 0
