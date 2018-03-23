#!/bin/bash

echo Removing apps...
for i in $(flatpak --user list --app); do
    [ "${i}" != "current" ] && flatpak --user uninstall "${i}"
done

echo Removing runtimes...
for i in $(flatpak --user list --runtime); do
    [ "${i}" != "current" ] && flatpak --user uninstall "${i}"
done

echo Removing remotes...
for i in gnome gnome-apps gnome-apps-nightly gnome-nightly flathub; do
    flatpak --user remote-delete "${i}";
done
