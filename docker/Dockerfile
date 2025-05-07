FROM mcr.microsoft.com/dotnet/sdk:8.0-bookworm-slim


###########################
### Base setup

RUN apt-get update && \
    apt-get install -y \
      wget \
      curl \
      gpg \
      p7zip-full

### /Base setup
###########################


###########################
### Wine setup

RUN dpkg --add-architecture i386

RUN mkdir -pm755 /etc/apt/keyrings && \
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -

RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

RUN apt update && apt install -y --install-recommends winehq-stable=10.0.0.0~bookworm-1

RUN WINEARCH=win64 WINEPREFIX=/root/.winemonogame winecfg
RUN echo export WINEPREFIX=/root/.winemonogame >> /root/.bashrc
ENV WINEPREFIX=/root/.winemonogame

### /Wine setup
###########################


###########################
### MGFXC Setup

RUN echo export MGFXC_WINE_PATH=/root/.winemonogame >> /root/.bashrc
ENV MGFXC_WINE_PATH=/root/.winemonogame

RUN wget -qO- https://raw.githubusercontent.com/MonoGame/MonoGame/709f620de513a601a4f476e21e9417ea4a7cca37/Tools/MonoGame.Effect.Compiler/mgfxc_wine_setup.sh | bash

### /MGFXC Setup
###########################


###########################
### Monogame tooling stuff

COPY ./.config/ /.config/

WORKDIR /src/
RUN dotnet tool restore

### /Monogame tooling stuff
###########################
