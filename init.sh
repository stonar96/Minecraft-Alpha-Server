#!/bin/bash
rm -rf 'Minecraft-Alpha-Server'
mkdir 'Minecraft-Alpha-Server'
cp -rf 'Minecraft-Alpha-Server-Init/.' 'Minecraft-Alpha-Server'
cd 'Minecraft-Alpha-Server'
curl -o 'mcp25.html' 'http://www.mediafire.com/file/7422b88qu650547/mcp25.zip'
curl -O "$(egrep -o -m 1 'http://download.*/7422b88qu650547/mcp25\.zip' mcp25.html)"
rm -f 'mcp25.html'
unzip 'mcp25.zip'
cp -rf 'scripts-linux/.' '.'
chmod +x 'cleanup.sh'
chmod +x 'decompile.sh'
chmod +x 'recompile.sh'
chmod +x 'reobf.sh'
chmod +x 'setup.sh'
chmod +x 'test_game.sh'
chmod +x 'test_server.sh'
chmod +x 'update_names.sh'
rm -rf 'jars'
mkdir 'jars'
cd 'jars'
curl -O 'https://web.archive.org/web/20101205185606/http://www.minecraft.net:80/download/minecraft_server.jar'
cd '..'
case "$(uname -s)" in
  MINGW*|CYGWIN*)
    ./decompile.bat
    ;;
  *)
    ./decompile.sh
    ;;
esac
git init
git config core.autocrlf true
git add '.'
git -c 'user.name=stonar96' -c 'user.email=minecraft.stonar96@gmail.com' commit -m 'Initial commit' --date='Sun Jan 1 00:00:00 2017 +0200'
GIT_COMMITTER_DATE='Sun Jan 1 00:00:00 2017 +0200' git -c user.name='stonar96' -c user.email='minecraft.stonar96@gmail.com' commit --amend --no-edit
