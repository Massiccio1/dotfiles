

[Unit]
Description=del tmp folder in download before reboot or shutdown
DefaultDependencies=no
Before=shutdown.target reboot.target halt.target

[Service]
Type=oneshot
ExecStart=/home/massimo/scripts/deltmp.sh

[Install]
WantedBy=halt.target reboot.target shutdown.target