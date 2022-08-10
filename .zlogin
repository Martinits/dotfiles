if [ `ps -aux | grep autossh | sed '/grep/d' | grep 8888:localhost:22 | wc -l` = '0' ]; then
    autossh -f -M 8889 -fNR 8888:localhost:22 root@47.98.134.245
fi

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
