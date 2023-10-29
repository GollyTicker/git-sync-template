#!/bin/bash
set -e

# ADAPT ME
export SCRIPTS="/path/to/my/knowledge-base/scripts"
cd "$SCRIPTS"

# ADAPT ME
export GIT_MSG_PREFIX="my-linux-git-message-prefix"

source source.sh
source desktop/source.sh

./workflows/10-synchronize-workflow.sh
