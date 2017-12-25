#!/bin/bash
cd "${0%/*}"
cd 'Minecraft-Alpha-Server'
case "$(uname -s)" in
  MINGW*|CYGWIN*)
    ./recompile.bat
    ./reobf.bat
    ;;
  *)
    ./recompile.sh '' 'server'
    ./reobf.sh
    ;;
esac
rm -rf 'final_out/minecraft_server.jar'
cp -f 'jars/minecraft_server.jar' 'final_out/minecraft_server.jar'
cd 'final_out/minecraft_server'
jar -uf '../minecraft_server.jar' '.'
