#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

INSTALL_DIR="/usr/local/bin"

cp b64sha $INSTALL_DIR
chmod +x $INSTALL_DIR/b64sha

echo "Done"
