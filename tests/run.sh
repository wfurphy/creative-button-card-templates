#!/usr/bin/env bash

# Discover and run the shell test suite in deterministic filename order.
set -euo pipefail

test_directory="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

if [[ ! -d "$test_directory" ]]; then
  printf 'Test directory not found: %s\n' "$test_directory" >&2
  exit 1
fi

export LC_COLLATE=C
unset GLOBIGNORE GLOBSORT
shopt -u failglob
shopt -s nullglob
test_files=("$test_directory"/test-*.sh)
shopt -u nullglob

if [[ "${#test_files[@]}" -eq 0 ]]; then
  printf 'No test files found in %s.\n' "$test_directory" >&2
  exit 1
fi

for test_file in "${test_files[@]}"; do
  printf 'Running %s\n' "$(basename "$test_file")"
  bash "$test_file"
done

printf 'All tests passed.\n'
