#!/bin/bash

set -eu
set -o pipefail

# TODO: Get this from inventory
NEWS_FLASH_FLATPAK="io.gitlab.news_flash.NewsFlash"
NEWS_FLASH_CONFIG_DIR="${HOME}/.var/app/${NEWS_FLASH_FLATPAK}/config/news-flash"
NEWS_FLASH_CONFIG="${NEWS_FLASH_CONFIG_DIR}/newsflash_gtk.json"

ALL=inventory/group_vars/all

cd "$(git -C "${0%/*}" rev-parse --show-toplevel)"

################################################################################

function json2yaml {
    command json2yaml --multiline 1 --width 80 "${@}" | yamlfix -
}

function main {
    json2yaml --wrap news_flash_config "${NEWS_FLASH_CONFIG}" \
              > "${ALL}/news-flash.yml"
}

main "${@}"; exit
