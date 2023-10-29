#!/bin/sh
set -e

if [ "$SUPPORTS_HOOKS" = "false" ]; then
  INPUT="$(bash workflows/steps/pre-push-stdin.sh)"
  echo "$INPUT" | bash workflows/manual-hooks/pre-push.sh $(bash workflows/steps/pre-push-args.sh)
fi
