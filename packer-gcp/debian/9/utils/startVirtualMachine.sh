#!/usr/bin/env bash

qemu-system-x86_64 \
    -name debian9-core \
    -m 1024M \
    -machine type=pc-q35-4.0,accel=hvf \
	-device virtio-net,netdev=user.0 \
	-netdev user,id=user.0,hostfwd=tcp::9000-:22 \
	-drive file=./../output-qemu/debian9-core,if=virtio,cache=writeback,discard=ignore,format=raw \
	-boot c \
    -vga cirrus \
	-monitor stdio
