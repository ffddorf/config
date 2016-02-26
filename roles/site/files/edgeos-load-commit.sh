#!/bin/vbash

# Obtain session environment
session_env=$(cli-shell-api getSessionEnv $PPID)

# Evaluate environment string
eval $session_env

# Setup the session
cli-shell-api setupSession

# Load config
/opt/vyatta/sbin/vyatta-load-config.pl $1

# Commit config
/opt/vyatta/sbin/my_commit
COMMIT_RC=$?

exit ${COMMIT_RC}