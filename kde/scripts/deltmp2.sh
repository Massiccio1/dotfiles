[Unit]
Description=Delete temp folder in downloads
DefaultDependencies=no
After=final.target

[Service]
Type=oneshot
ExecStart=/home/massimo/scripts/deltmp.sh


[Install]
WantedBy=final.target