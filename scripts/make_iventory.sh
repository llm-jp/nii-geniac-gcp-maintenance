#!/bin/bash
echo "[google_cloud]" > inventory
while read -r line; do
  echo "node ansible_host=$line" >> inventory
done < hosts.txt
