## BtSync Dockerfile

This repository contains the **Dockerfile** and the configuration file of [BitTorrent Sync](http://www.getsync.com/) for [Docker](https://www.docker.com/).
View it on the [Docker Registry](https://registry.hub.docker.com/u/inanimate/btsync/)!
### Usage

```bash
docker run -d -p 55555:55555 -v /opt/data:/data -e "SECRET=1234567890" inanimate/btsync
```

Or, you can define a different directory entirely, nice for `volumes-from` another container:

```bash
docker run -d -p 55555:55555 --volumes-from ghost -e "SYNC_DIR=/ghost/content" -e "SECRET=1234567890" inanimate/btsync
```
> Note that the Web UI is disabled in the config file.
> If you do not specify the SYNC_DIR variable, `/data` is used by default.
> If you do not specify the SECRET env variable, a new one will be generated.
