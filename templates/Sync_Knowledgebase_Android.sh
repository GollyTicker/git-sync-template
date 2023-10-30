#!/bin/bash
set -e

# ADAPT ME
export SCRIPTS="/path/to/my/knowledge-base/scripts"
cd "$SCRIPTS"

# ADAPT ME
export GIT_MSG_PREFIX="my-android-git-message-prefix"

. source.sh
. mobile/source.sh

bash ./workflows/10-synchronize-workflow.sh
