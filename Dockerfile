# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Dieter Reuter <dieter@hypriot.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install JAVA
RUN mkdir -p /opt/java && \
  wget --no-check-certificate -O - "http://www.java.net/download/jdk7u80/archive/b05/binaries/jdk-7u80-ea-bin-b05-linux-arm-vfp-hflt-20_jan_2015.tar.gz" \
  | tar -xzC /opt/java --strip-components=1
ENV JAVA_HOME /opt/java
ENV PATH /opt/java/bin:$PATH

# Define working directory
WORKDIR /data

# Minecraft static files and database
VOLUME ["/data"]

# Add start script
ADD start-minecraft.sh /start-minecraft.sh

# Minecraft port 25565/tcp
EXPOSE 25565

# Start Minecraft server, optionally download it
CMD ["/start-minecraft.sh"]