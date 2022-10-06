#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# Set up our .zshrc
cp -f "$DOTFILES/zshrc" "$HOME/.zshrc"

# Put our docker-compose.override.yml into the workspace
if test -d "$GITPOD_REPO_ROOT" -a \! -f "$GITPOD_REPO_ROOT/docker-compose.override.yml"
then
  cp "$DOTFILES/docker-compose.override.yml" "$GITPOD_REPO_ROOT/docker-compose.override.yml"
fi
