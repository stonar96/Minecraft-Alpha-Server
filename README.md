# Minecraft-Alpha-Server
A Minecraft-Alpha-Server (version: Alpha 1.2.6, server version: Alpha 0.2.8) mod, that aims to make the server more usable and secure for the public as well as fix bugs.

**Note** that this project is currently under development and there are no real fixes yet. Instead of fixing the bugs directly in the source code of the server, I am currently working on a plugin API. Bug fixes will be released later in the form of plugins.

**Note** that there are no official compiled releases available online for this project. The repository does not even contain the source code of the server. Instead, this repository contains patch files and some scripts to apply them to the original minecraft_server.jar. These scripts are using MCP (Mod Coder Pack) and they will download and set up everything for you to build the modified minecraft_server.jar.
## Prerequisites
Information in \[brackets\] indicates details about the version which was used during testing. Other versions will probably also work but it would be too much work to test all possibilities.
### Windows
* Git for Windows \[2.19.1\]
* \[Oracle\] JDK \[8\] with Path environment variable entry to \<path to java\>\jdk\<version\>\bin
* .NET Framework 3.5 (Windows will probably ask you to install it while building the server if it is not already installed. Repeat the whole building process after installing the .NET Framework.)
### Linux
* Git \[2.19.1\]
* Unzip
* \[Open\]JDK \[8\]
* Wine \[3.17\] with i386 architecture
* Python 2 \[2.7.15\]
### Mac
I don't know.
## How to build
Clone or download this repository and run build.sh. On Windows the command line interface asks you several times to press any key. If everything has successfully finished, you can find the modified class files and the modified minecraft_server.jar file inside the Minecraft-Alpha-Server/Minecraft-Alpha-Server/final_out directory. Please use the minecraft_server_unobfuscated.jar file if you install or develop plugins.
## How to develop or contribute
TODO.
## How to develop plugins
TODO.
## Official plugins
* [OnlineCheck by stonar96](https://github.com/stonar96/OnlineCheck)
* [ValidUsername by stonar96](https://github.com/stonar96/ValidUsername)
