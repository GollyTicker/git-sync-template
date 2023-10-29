#!/bin/sh
set -e

# See: https://github.com/git/git/blob/master/templates/hooks--pre-push.sample
# See: https://git-scm.com/docs/githooks#_pre_push

REMOTE="$1"
URL="$2"

echo "Applying manual hook: pre-push $@"

git lfs pre-push "$@" <&0
