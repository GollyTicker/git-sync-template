#!/bin/sh
set -e

if [ "$SUPPORTS_HOOKS" = "false" ]; then
  IS_SQUASH="0" # Only non-squash is supported.
  bash workflows/manual-hooks/post-merge.sh $IS_SQUASH
fi
