#!/usr/bin/env bash

# https://developers.redhat.com/blog/2016/09/13/running-systemd-in-a-non-privileged-container/

set -e
set -o pipefail

if [ ! -d /sys/fs/cgroup/systemd ]; then
	sudo mkdir -p /sys/fs/cgroup/systemd
	sudo mount -t cgroup cgroup -o none,name=systemd /sys/fs/cgroup/systemd
fi

docker build -t ubuntu-init-ssh .
docker run --rm -ti \
	--tmpfs /run \
	--tmpfs /run/lock \
	--tmpfs /tmp \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--cap-add SYS_ADMIN \
	-p 22:22 \
	ubuntu-init-ssh
