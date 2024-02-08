#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"

function log {
  echo "[$(date +'%F %T')] $*"
}

# Set up our .zshrc, replacing if it exists.
log "Copying .zshrc"
cp -f "./zshrc" "$HOME/.zshrc"

# Try to find the checked out repo root
# In gitpod we have an environment variable. In coder, it's just ~/picnic.
WORKSPACE="${GITPOD_REPO_ROOT:-$HOME/picnic}"
if ! test -d "$WORKSPACE"
then
  >&2 echo "Workspace root value $WORKSPACE does not refer to a directory"
  exit 0
fi

# Copy docker-compose.override.yml if not present
log "Copying docker-compose.override.yml (if not present)"
test -f "$WORKSPACE/docker-compose.override.yml" ||
  cp -v "./docker-compose.override.yml" "$WORKSPACE/docker-compose.override.yml"

log "Done"
