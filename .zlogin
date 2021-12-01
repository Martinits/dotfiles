# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ `ps -aux | grep autossh | sed '/grep/d' | grep 7777:localhost:22 | wc -l` = '0' ]; then
        autossh -f -M 7778 -fNR 7777:localhost:22 root@47.98.134.245
fi

if [ `ps -aux | grep autossh | sed '/grep/d' | grep 6666:localhost:2222 | wc -l` = '0' ]; then
        autossh -f -M 6667 -fNR 6666:localhost:2222 martinit@martinit.co
fi
