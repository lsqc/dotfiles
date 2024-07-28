[Unit]
Description=check battery status ever 5 mins

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min
Unit=battery_check.service

[Install]
WantedBy=timers.target
