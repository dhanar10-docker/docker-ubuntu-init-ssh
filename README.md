# docker-ubuntu-init-ssh

Ubuntu container anti-pattern with systemd init and ssh server to mimic a standalone headless system

## Requirements

- avahi-daemon
- bash
- docker
- git
- ssh

## Usage

### Deploy

```bash
$ git clone https://github.com/dhanar10/docker-ubuntu-init-ssh.git
$ cd docker-ubuntu-init-ssh
$ bash deploy.sh --name sandbox --hostname sandbox
```

### SSH Access

```bash
$ ssh user@sandbox.local # Default password: user
```

## References

- https://developers.redhat.com/blog/2016/09/13/running-systemd-in-a-non-privileged-container
- https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container
- https://github.com/defn/docker-systemd
- https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata
