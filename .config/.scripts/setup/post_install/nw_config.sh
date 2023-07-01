#!/bin/bash
# Network Configuration

echo njuwate > /etc/hostname

touch /etc/hosts

echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	myarch" > /etc/hosts
