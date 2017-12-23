#!/bin/bash
cd "${0%/*}"
rm -rf 'Patches'
mkdir 'Patches'
cd 'Minecraft-Alpha-Server'
git format-patch -o '../Patches' --no-signature -N "$(git rev-list --max-parents=0 HEAD)"
