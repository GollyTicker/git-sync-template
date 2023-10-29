#!/bin/sh
set -e

# See: https://git-scm.com/docs/githooks#_post_merge

echo "Applying manual hook: post-merge $@"

git lfs post-merge "$@"
