#!/bin/sh
set -e


# See: https://git-scm.com/docs/githooks#_post_checkout

echo "Applying manual hook: post-checkout $@"

git lfs post-checkout "$@"
