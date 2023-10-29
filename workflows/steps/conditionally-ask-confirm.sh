#!/bin/sh
set -e

if [ "$ASK_CONFIRM" = "true" ]; then
  echo "Press ENTER to continue."
  read ignored
fi
