#!/bin/sh
set -e

cd "$SCRIPTS"

# When changing this, one may also want to change the pull definitions for submodules

bash workflows/steps/conditionally-run-pre-push.sh
$GIT_PUSH_COMMAND

echo ""

git status
