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
rm -f 'final_out/minecraft_server.jar'
cp -f 'jars/minecraft_server.jar' 'final_out/minecraft_server.jar'
cd 'final_out/minecraft_server'
jar -uf '../minecraft_server.jar' '.'
cd '../../bin/minecraft_server'
jar -cfe '../../final_out/minecraft_server_unobfuscated.jar' 'net.minecraft.server.MinecraftServer' '.'
