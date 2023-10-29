#!/bin/bash
set -e

# Ensure URLs from config are read
git submodule sync

# If new submodules are added, then they may not be cloned yet.
# Doing a naive 'git submodule update --init' may clone them,
# but it'll also override any existing unpushed commits in cloned submodules.
# To avoid that, we get the information from 'git submodule summary'
# and parse which submodules are not yet cloned. (They show the commit 000000.)
# Only these are then cloned.
UNCLONED_SUBMODULES="$(
  git submodule summary \
  | grep "\.\.\.000000" \
  | sed 's/^\* //' \
  | sed 's/ [^\s]*$//'
)"
if [[ "$UNCLONED_SUBMODULES" != "" ]]; then
  echo "Found new $(wc -l <<< "$UNCLONED_SUBMODULES") to be cloned."
  echo "$UNCLONED_SUBMODULES" | xargs --replace='+' bash -c 'git submodule update --init +'
fi

# Get a list of submodule name + relative path to submodule from working directory
# foreach: https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt-foreach--recursiveltcommandgt
SUBMODULES="$(git submodule foreach --quiet 'echo "$name $displaypath"')"
CLONED_SUBMODULES_COUNT="$(wc -l <<< "$SUBMODULES")"

commitUpdateMergePushSubmodule() {
  REL_PATH="$2"

  # Blacklisted files etc. are not supported for submodules

  cd "$REL_PATH"

  echo "=== Saving current state..."
  git switch --quiet $SUBMODULE_BRANCH
  git add .
  git status
  git commit -m "$COMMIT_MESSAGE" || true
  echo "=== Done."

  echo "=== Merging remote changes..."
  git fetch
  git merge --no-edit origin/$SUBMODULE_BRANCH
  echo "=== Done."

  echo "=== Merging remote changes..."
  $GIT_PUSH_COMMAND
  echo "=== Done."
}
export -f commitUpdateMergePushSubmodule

# Indent to distinguish interleave output
indent() {
  NAME="$1"
  sed "s|^|$NAME: |"
}
export -f indent

# =============================== Parallel processing of all submodules

echo "Processing $CLONED_SUBMODULES_COUNT submodules..."
# max-procs=0 means use maximum parallelization
export SHELLOPTS # make bash scripts inherit shell options
echo "$SUBMODULES" | xargs --replace="+" --max-procs=0 bash -c 'commitUpdateMergePushSubmodule + 2>&1 | indent +'
echo "Done."
