# The commit message. Configure to your wishes.
export COMMIT_MESSAGE="[$GIT_MSG_PREFIX] $(date '+%Y-%m-%d %H:%M')"

export GIT_PUSH_COMMAND="git push"

export SUBMODULE_BRANCH="main"

# Comment this line, if you want to merge remote changes instead of rebasing local changes on top of remote ones.
git config advice.skippedCherryPicks false

# Some OS get confused with loing paths.
git config core.longpaths true

# When interactively running these sync scripts, we want to
# pause when an error happens, so that the user can view them.
# This is useful, as double-clicking on the sync-script will actually
# open a terminal only as long as the scirp is running - which unfortunately
# would immediately exit when an error occurs and then close the window.
# We use this function and a trap to ensure, that the window with the error is still open.
pause-script-for-error-inspection-on-interactive-mode() {
  EXIT_CODE="$?"
  if [[ "$EXIT_CODE" != "0" ]]; then
    echo "❗⚠️ Synchronize failed ⚠️❗"
    if [[ "$SHELLOPTS" == *interactive* ]]; then
      # interactive shell
      echo "Pausing here for you to inspect the error."
      while true; do
        read -p "Press any key and then Enter to terminate the process." answer
        [[ "$answer" != "" ]] && break
      done
    fi
    exit "$EXIT_CODE"
  fi
}
export -f pause-script-for-error-inspection-on-interactive-mode

trap pause-script-for-error-inspection-on-interactive-mode EXIT
