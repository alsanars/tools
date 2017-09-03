#!/bin/bash

op_host=one.plus
op_port=80

echo "# ------ FileDash downloader ------ #"
echo "Host $op_host"
echo "Port $op_port"

resources="$(echo "GET / HTTP/1.1" | nc -w 5 $op_host $op_port | sed -n 's/.*href="\([^"]*\).*/\1/p')"

for resource in $resources ; do wget --recursive --progress=bar:force "$op_host$resource"; done
