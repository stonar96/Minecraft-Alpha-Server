#!/bin/bash
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
#cp -f jars/minecraft_server.jar final_out/minecraft_server.jar
#zip -ur ...?
