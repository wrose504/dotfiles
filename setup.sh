#!/bin/bash
DOTFILES="$HOME/.dotfiles"

function log {
  echo "[$(date +'%F %T')] $*"
}

# Set up our .zshrc, replacing if it exists.
log "Copying .zshrc"
cp -f "$DOTFILES/zshrc" "$HOME/.zshrc"

if ! test -d "$GITPOD_REPO_ROOT"
then
  >&2 echo "Workspace root value $GITPOD_REPO_ROOT does not refer to a directory"
  exit 0
fi

# Copy launch.json if not present
log "Copying launch.json (if not present)"
test -d "$GITPOD_REPO_ROOT/.vscode" ||
  mkdir -p "$GITPOD_REPO_ROOT/.vscode"
test -f "$GITPOD_REPO_ROOT/.vscode/launch.json" ||
  cp -v "$DOTFILES/vscode-launch.jsonc" "$GITPOD_REPO_ROOT/.vscode/launch.json"

# Copy docker-compose.override.yml if not present
log "Copying docker-compose.override.yml (if not present)"
test -f "$GITPOD_REPO_ROOT/docker-compose.override.yml" ||
  cp -v "$DOTFILES/docker-compose.override.yml" "$GITPOD_REPO_ROOT/docker-compose.override.yml"

log "Done"
