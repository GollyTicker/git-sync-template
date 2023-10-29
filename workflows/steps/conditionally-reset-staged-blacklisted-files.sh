#!/bin/sh
set -e

if [ "$BLACKLIST" != "" ]; then
  # no restore hooks here
  git restore --pathspec-from-file=$BLACKLIST
fi
