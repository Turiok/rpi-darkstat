# DEPRECATED 

New image here [docker-darkstat](https://hub.docker.com/r/didierc/docker-darkstat) and code here : [Gitlab](https://gitlab.com/Turiok/docker-darkstat)

Darkstat
==========================


Darkstat - https://unix4lyfe.org/darkstat/



Running on the latest debian stable slim for arm, with darkstat from git repository on the master branch.

### Pull image

```
docker pull didierc/rpi-darkstat
```

### Run container

```
docker run -d --net="host" --name=<container name> -v <local path to store db/log>:/darkstat/config -v /etc/localtime:/etc/localtime:ro -e OPTIONS=<options for darkstat> -e DS_UID=<uid> -e DS_GID=<uid> didierc/rpi-darkstat
```

- OPTIONS = To see the list of options available for darkstat. Please check the website of darkstat.
  Or search "man darkstat" on the web
- DS_UID = uid for the user darkstat. Default is 1000
- DS_GID = gid for the user darkstat. Default is 1000

By default the user darkstat is created in the container and used by darkstat. And darkstat is launched in no deamon and with the chroot "/darkstat/config" to save log and database with the volume.

### Web-UI

```
http://<host ip>:[PORT]
```

### Example

```shell
docker run -d --net="host"  --name=darkstat -v /mylocal/directory/fordata:/config -v /etc/localtime:/etc/localtime:ro -e OPTIONS="-i eth0  -p 666 --daylog darkstat.log --verbose --import darkstat.db --export darkstat.db" didierc/rpi-darkstat
```

### Database

##### To export the database here the workaround. 

> See the documentation of darkstat to enable the exportation the database

- Get the PID of darkstat process

  ```shell
  pc >$ docker top <container id>
  ```

![](/home/vagrant/workspace/rpi/docker-darkstat/images/docker_top.png)

- Send a SIGUSR1 or SIGUSR2 to the darkstat process

  ```shell
  pc >$ kill -10 13080
  ```

### Improvments

- add an entrypoint to export the database with an SIGUSR1 signal like in the darkstat documentation.
- Delete the run.sh and make an entrypoint for the start to be always the PID 1
