Darkstat
==========================


Darkstat - https://unix4lyfe.org/darkstat/



Running on the latest debian stable slim for arm, with darkstat from git repository on the master branch.

**Pull image**

```
docker pull didierc/rpi-darkstat
```

**Run container**

```
docker run -d --net="host" --name=<container name> -v <local path to store db/log>:/config -v /etc/localtime:/etc/localtime:ro -e OPTIONS=<options for darkstat> -e DS_UID=<uid> -e DS_GID=<uid> didierc/rpi-darkstat
```

- OPTIONS = To see the list of options available for darkstat. Please check the website of darkstat.
  Or search "man darkstat" on the web
- DS_UID = uid for the user darkstat. Default is 1000
- DS_GID = gid for the user darkstat. Default is 1000



By default the user darkstat is created in the container and used by darkstat. And darkstat is launched in no deamon and with the chroot /config to save log and database with the volume.

**Web-UI**

```
http://<host ip>:[PORT]
```

**Example**

```
docker run -d --net="host"  --name=darkstat -v /mylocal/directory/fordata:/config -v /etc/localtime:/etc/localtime:ro -e OPTIONS="-i eth0 -p 666 --verbose" didierc/rpi-darkstat
```

**Additional notes**

* To clear the database just delete it on the host.

**Improvments**

- add an entrypoint to save the database with an SIGUSR1 signal like in the darkstat documentation.