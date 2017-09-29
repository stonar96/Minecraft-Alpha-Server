#!/bin/bash
cd 'Minecraft-Alpha-Server'
git -c user.name='stonar96' -c user.email='minecraft.stonar96@gmail.com' am --committer-date-is-author-date --ignore-whitespace '../Patches/'*'.patch'
