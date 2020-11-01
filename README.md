# docker-ubuntu-init-ssh

Ubuntu-based container anti-pattern with systemd init and ssh server to mimic a standalone headless system for development and testing purposes

## Requirements

- avahi-daemon
- bash
- docker
- git
- ssh

## Usage

### Deployment

```bash
$ git clone https://github.com/dhanar10/docker-ubuntu-init-ssh.git
$ cd docker-ubuntu-init-ssh
$ bash deploy.sh --name sandbox --hostname sandbox
```

### SSH Access

```bash
$ ssh user@sandbox.local # Default password: user
```

## Notes

The container is deployed in detached mode with restart policy unless-stopped

## References

- https://developers.redhat.com/blog/2016/09/13/running-systemd-in-a-non-privileged-container
- https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container
- https://github.com/defn/docker-systemd
- https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata
