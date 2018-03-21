#!/bin/bash

WanderlustPreSuspend() {
    echo "Wanderlust pre suspend..."
    /bin/emacsclient --socket-name /tmp/emacs1000/server \
    --eval "(wl-toggle-plugged 'off)"
}

WanderlustPostResume() {
    echo "Wanderlust post resume..."
    /bin/emacsclient --socket-name /tmp/emacs1000/server \
                     --eval "(wl-toggle-plugged 'on)"
}

case $1/$2 in
    pre/*)
        WanderlustPreSuspend
        ;;
    post/*)
        WanderlustPostResume
        ;;
esac
