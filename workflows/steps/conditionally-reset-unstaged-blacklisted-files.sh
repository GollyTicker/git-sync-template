#!/bin/sh
set -e

if [ "$BLACKLIST" != "" ]; then
  git checkout --pathspec-from-file=$BLACKLIST
  bash workflows/steps/conditionally-run-post-checkout.sh
fi
