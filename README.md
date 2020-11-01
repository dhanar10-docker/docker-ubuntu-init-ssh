# docker-ubuntu-init-ssh

Ubuntu container anti-pattern with systemd init and ssh server to mimic a standalone headless system

## Requirements

- avahi-daemon
- bash
- docker
- git
- ssh

## Usage

### Deploying

```bash
$ git clone https://github.com/dhanar10/docker-ubuntu-init-ssh.git
$ cd docker-ubuntu-init-ssh
$ bash deploy.sh --name sandbox --hostname sandbox
```

### Accessing

```bash
$ ssh user@sandbox.local # Password: user
```
