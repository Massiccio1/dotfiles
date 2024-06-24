[Unit]
Description=Delete temp folder in downloads
DefaultDependencies=no
Before=shutdown.target

[Service]
Type=oneshot
ExecStart=/home/massimo/scripts/deltmp2.sh

[Install]
WantedBy=halt.target reboot.target