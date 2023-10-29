#!/bin/sh
set -e

cd "$SCRIPTS"

# When changing this, one may also want to change the pull definitions for submodules

bash workflows/steps/conditionally-reset-staged-blacklisted-files.sh

# Use rebase = true, so that we can avoid empty merge commits, when a submodule is updated.
git pull --rebase=true --no-edit
bash workflows/steps/conditionally-run-post-merge.sh

echo ""

git status
