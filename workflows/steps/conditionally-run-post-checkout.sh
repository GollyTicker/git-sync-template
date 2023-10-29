#!/bin/sh
set -e

if [ "$SUPPORTS_HOOKS" = "false" ]; then
  # Only file checkout supported
  COMMIT="$(git rev-parse HEAD)"
  IS_BRANCH_CHECKOUT="0"
  bash workflows/manual-hooks/post-checkout.sh $COMMIT $COMMIT $IS_BRANCH_CHECKOUT
fi
