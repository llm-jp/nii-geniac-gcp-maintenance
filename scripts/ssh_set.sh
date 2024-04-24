#!/bin/bash

HOSTS_FILE="hosts.txt"

# ~/.ssh/known_hosts file not found then create
if [ ! -f ~/.ssh/known_hosts ]; then
  touch ~/.ssh/known_hosts
fi

while read -r host; do
  if ! ssh-keygen -F $host > /dev/null; then
    ssh-keyscan -H $host >> ~/.ssh/known_hosts
  fi
done < $HOSTS_FILE
