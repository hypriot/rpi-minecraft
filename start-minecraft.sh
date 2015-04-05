#!/bin/bash
# Assuming we're running in /data
set -e
set -x

# Download Minecraft, if not already done
MINECRAFT_VERSION=1.8
if [ ! -f minecraft_server.jar ]; then
  wget --no-check-certificate "https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/minecraft_server.${MINECRAFT_VERSION}.jar" -O minecraft_server.jar
fi

# Accept Minecraft EULA
if [ ! -f eula.txt ]; then
  echo "eula=true" > eula.txt
fi

# Start Minecraft server with a maximum of 768MByte
java -Xms256M -Xmx768M -jar minecraft_server.jar nogui
