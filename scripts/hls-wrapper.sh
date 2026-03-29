#!/usr/bin/env bash
set -euo pipefail

# Ensure JetBrains-launched process can find GHC/Cabal installed via ghcup.
export PATH="$HOME/.ghcup/bin:$HOME/.cabal/bin:$PATH"

exec "$HOME/.ghcup/bin/haskell-language-server-wrapper" "$@"
