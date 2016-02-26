#!/bin/vbash

# Obtain session environment
session_env=$(cli-shell-api getSessionEnv $PPID)

# Evaluate environment string
eval $session_env

# Setup the session
cli-shell-api setupSession

/opt/vyatta/sbin/vyatta-load-config.pl $1
LOAD_RC=$?

exit ${LOAD_RC}