#!/usr/bin/env bash

timeout 1 echo > /dev/tcp/10.100.3.113/3142 \
    && echo "http://10.100.3.113:3142" \
    || echo "DIRECT"
