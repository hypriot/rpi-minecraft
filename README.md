
https://github.com/overshard/docker-minecraft
https://registry.hub.docker.com/u/itzg/minecraft-server/
http://blog.kopis.de/running-minecraft-in-a-docker-container/


## Java Download from https://jdk7.java.net/download.html
http://www.java.net/download/jdk7u80/archive/b05/binaries/jdk-7u80-ea-bin-b05-linux-arm-vfp-hflt-20_jan_2015.tar.gz

## Minecraft server
https://minecraft.net/download
http://minecraft.gamepedia.com/Setting_up_a_server?cookieSetup=true

### run a Minecraft server
On Linux and Mac OS X this should already be set up but on Windows you might have to tinker with the PATH environment variable. Download and run minecraft_server.1.8.3.jar with java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui.

```bash
docker run -d -p=25565:25565 -v $(pwd)/data:/data hypriot/rpi-minecraft
```

