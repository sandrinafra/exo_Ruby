#!/bin/sh

curl -s $1 | grep http:// | cut -c16- | cut -d '>' -f 1 | cut -d '"' -f 1
