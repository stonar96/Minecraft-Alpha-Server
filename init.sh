#!/bin/bash
cd "${0%/*}"
if [ -f 'Resources/mcp25.zip' ] && [ -f 'Resources/minecraft_server.jar' ]; then
  echo 'Resources already exist.'
else
  rm -rf 'Resources'
  mkdir 'Resources'
  cd 'Resources'
  curl -o 'mcp25.html' 'http://www.mediafire.com/file/7422b88qu650547/mcp25.zip'
  curl -O "$(egrep -o -m 1 'http://download.{20,40}/7422b88qu650547/mcp25\.zip' mcp25.html | head -1)"
  rm -f 'mcp25.html'
  curl -O 'https://web.archive.org/web/20101205185606/http://www.minecraft.net:80/download/minecraft_server.jar'
  cd '..'
fi
rm -rf 'Minecraft-Alpha-Server'
mkdir 'Minecraft-Alpha-Server'
cp -rf 'Minecraft-Alpha-Server-Init/.' 'Minecraft-Alpha-Server'
cd 'Minecraft-Alpha-Server'
git init
git config core.autocrlf true
cp -f '../Resources/mcp25.zip' 'mcp25.zip'
unzip 'mcp25.zip'
cp -rf 'scripts-linux/.' '.'
rm -rf 'jars'
mkdir 'jars'
cp -f '../Resources/minecraft_server.jar' 'jars/minecraft_server.jar'
case "$(uname -s)" in
  MINGW*|CYGWIN*)
    git update-index --add --chmod='+x' 'cleanup.sh'
    git update-index --add --chmod='+x' 'decompile.sh'
    git update-index --add --chmod='+x' 'recompile.sh'
    git update-index --add --chmod='+x' 'reobf.sh'
    git update-index --add --chmod='+x' 'setup.sh'
    git update-index --add --chmod='+x' 'test_game.sh'
    git update-index --add --chmod='+x' 'test_server.sh'
    git update-index --add --chmod='+x' 'update_names.sh'
    ./decompile.bat
    ;;
  *)
    chmod +x 'cleanup.sh'
    chmod +x 'decompile.sh'
    chmod +x 'recompile.sh'
    chmod +x 'reobf.sh'
    chmod +x 'setup.sh'
    chmod +x 'test_game.sh'
    chmod +x 'test_server.sh'
    chmod +x 'update_names.sh'
    ./decompile.sh
    ;;
esac
git add '.'
git -c 'user.name=stonar96' -c 'user.email=minecraft.stonar96@gmail.com' commit -m 'Initial commit' --date='Sun Jan 1 00:00:00 2017 +0200'
# https://stackoverflow.com/q/46395528
GIT_COMMITTER_DATE='Sun Jan 1 00:00:00 2017 +0200' git -c 'user.name=stonar96' -c 'user.email=minecraft.stonar96@gmail.com' commit --amend --no-edit
