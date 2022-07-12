autossh -f -M 8889 -fNR 8888:localhost:22 root@47.98.134.245

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway
