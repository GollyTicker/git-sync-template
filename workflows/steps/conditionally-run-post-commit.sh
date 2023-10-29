#!/bin/sh
set -e

if [ "$SUPPORTS_HOOKS" = "false" ]; then
  bash workflows/manual-hooks/post-commit.sh
fi
