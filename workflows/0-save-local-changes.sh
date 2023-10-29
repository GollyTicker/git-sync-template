#/bin/bash
set -e
cd "$SCRIPTS"

# When changing this, one may also want to change the commit definitions for submodules

bash workflows/steps/conditionally-reset-unstaged-blacklisted-files.sh

git add ..
git status

echo ""

bash workflows/steps/conditionally-reset-staged-blacklisted-files.sh

git commit -m "$COMMIT_MESSAGE" || true
bash workflows/steps/conditionally-run-post-commit.sh

bash workflows/steps/conditionally-ask-confirm.sh
