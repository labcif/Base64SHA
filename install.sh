#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cp b64sha /usr/local/bin
chmod +x /usr/local/bin/b64sha

echo "Done"
