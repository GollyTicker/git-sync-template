#!/bin/sh
set -e

bash workflows/_0-submodules.sh

echo ""

bash workflows/0-save-local-changes.sh

echo ""

bash workflows/1-pull-and-merge.sh

echo ""

bash workflows/2-upload.sh

echo ""

bash workflows/steps/conditionally-ask-confirm.sh
