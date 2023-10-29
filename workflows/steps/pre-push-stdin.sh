#!/bin/sh
set -e
# See: https://github.com/git/git/blob/master/templates/hooks--pre-push.sample

BRANCH="$(git rev-parse --abbrev-ref HEAD)"

LOCAL_COMMIT_ID="$(git log "$BRANCH" -1 --pretty="%H")"
REMOTE_COMMIT_ID="$(git log "origin/$BRANCH" -1 --pretty="%H")"

echo "refs/heads/$BRANCH $LOCAL_COMMIT_ID refs/heads/$BRANCH $REMOTE_COMMIT_ID"
