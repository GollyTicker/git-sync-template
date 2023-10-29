#!/bin/sh
set -e

# See: https://git-scm.com/docs/githooks#_post_commit

echo "Applying manual hook: post-commit $@"

git lfs post-commit # no args
