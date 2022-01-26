# docker-qbittorrent-autodl
Based on *linuxserver/qbittorrent* & *horjulf/docker-rutorrent-autodl*. Big thanks for them!

## Usage

```bash
docker run -d \
  --name=qbittorrent-autodl \
  -e PGID=1000 -e PUID=1000 \
  -e TZ=Europe/Budapest \
  -e WEBUI_PORT=8080 \
  -p 6881:6881 -p 6881:6881/udp \
  -p 8080:8080 \
  -v /path/to/appdata/config:/config \
  -v /path/to/downloads:/downloads \
  --restart unless-stopped \
  expeacer/qbittorrent-autodl
```

### Parameters
Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 6881` | tcp connection port |
| `-p 6881/udp` | udp connection port |
| `-p 8080` | http gui |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/Budapest` | Specify a timezone to use EG Europe/London |
| `-e WEBUI_PORT=8080` | for changing the port of the webui, see below for explanation |
| `-v /config` | Contains all relevant configuration files. |
| `-v /downloads` | Location of downloads on disk. |

### WEBUI_PORT variable

Due to issues with CSRF and port mapping, should you require to alter the port for the webui you need to change both sides of the -p 8080 switch AND set the WEBUI_PORT variable to the new port.  

For example, to set the port to 8090 you need to set -p 8090:8090 and -e WEBUI_PORT=8090

## Application Setup

### QBittorrent

The webui is at `<your-ip>:8080` and the default username/password is `admin/adminadmin`.  

Change username/password via the webui in the webui section of settings.  

### AutoDL-IRSSI

The IRSSI will run automatically, but you have to add your config to `/config/.autodl/autodl.conf`.

Edit the config, restart the conatiner, and enjoy the AutoDL.

For default, the client will download the torrents to `/downloads/watched/`.
