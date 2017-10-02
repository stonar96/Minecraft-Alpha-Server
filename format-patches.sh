#!/bin/bash
rm -rf 'Patches'
mkdir 'Patches'
cd 'Minecraft-Alpha-Server'
git format-patch -o '../Patches' "$(git rev-list --max-parents=0 HEAD)" -N
