# -*- mode: sh -*-
# shellcheck shell=bash

# Source settings file
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/bash/profile" ]; then
    # shellcheck disable=SC1091
    . "${XDG_CONFIG_HOME:-$HOME/.config}/bash/profile"
fi
