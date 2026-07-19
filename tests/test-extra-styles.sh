#!/usr/bin/env bash

# Verify that core Creative Button-Card Templates do not use card-mod styling.
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if rg --line-number \
  --glob '*.yaml' \
  --glob '!custom/**' \
  '^[[:space:]]*card_mod:' \
  "$repository_root"; then
  echo 'Found card-mod styling outside button-card extra_styles.' >&2
  exit 1
fi

for template in select.yaml climate.yaml light_motion.yaml; do
  if ! rg --quiet '^[[:space:]]*extra_styles:[[:space:]]*\|' "$repository_root/$template"; then
    echo "Missing extra_styles in $template." >&2
    exit 1
  fi
done
