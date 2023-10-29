# On mobile, we want to ignore changes in certain files,
# because their contents may look different on dekstop vs mobile.
# In that case, we don't want both to overwrite the formatting
# of the other. Hence, we reset the changes for the blacklisted files on mobile.
export BLACKLIST="mobile/blacklist.txt"

# Mobile Git on Termux doesn't support Git Hooks
export SUPPORTS_HOOKS=false

# On Mobile, we want to confirm steps via <enter>.
# You may want to deactivate once your setup works.
export ASK_CONFIRM=true
