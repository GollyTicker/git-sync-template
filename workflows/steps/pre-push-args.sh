#!/bin/sh
set -e

# See: https://github.com/git/git/blob/master/templates/hooks--pre-push.sample

URL="$(git remote get-url origin)"

echo "origin $URL"
