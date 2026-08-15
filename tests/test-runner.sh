#!/usr/bin/env bash

# Verify central test discovery, ordering, empty suites and failure propagation.
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
temporary_root="$(mktemp -d)"
trap 'rm -rf "$temporary_root"' EXIT

ordered_tests="$temporary_root/ordered"
mkdir -p "$ordered_tests"
cat > "$ordered_tests/test-02-second.sh" <<'EOF'
#!/usr/bin/env bash
printf 'second test\n'
EOF
cat > "$ordered_tests/test-01-first.sh" <<'EOF'
#!/usr/bin/env bash
printf 'first test\n'
EOF

ordered_output="$(bash "$repository_root/tests/run.sh" "$ordered_tests")"
expected_output='Running test-01-first.sh
first test
Running test-02-second.sh
second test
All tests passed.'
if [[ "$ordered_output" != "$expected_output" ]]; then
  printf 'Unexpected ordered test output:\n%s\n' "$ordered_output" >&2
  exit 1
fi

empty_tests="$temporary_root/empty"
mkdir -p "$empty_tests"
if bash "$repository_root/tests/run.sh" "$empty_tests" > "$empty_tests/output.log" 2>&1; then
  echo 'An empty test directory unexpectedly passed.' >&2
  exit 1
fi
grep -q '^No test files found' "$empty_tests/output.log"

failing_tests="$temporary_root/failing"
mkdir -p "$failing_tests"
cat > "$failing_tests/test-01-pass.sh" <<'EOF'
#!/usr/bin/env bash
exit 0
EOF
cat > "$failing_tests/test-02-fail.sh" <<'EOF'
#!/usr/bin/env bash
exit 7
EOF
cat > "$failing_tests/test-03-must-not-run.sh" <<EOF
#!/usr/bin/env bash
touch "$failing_tests/unexpected"
EOF

set +e
bash "$repository_root/tests/run.sh" "$failing_tests" > "$failing_tests/output.log" 2>&1
runner_status=$?
set -e

if [[ "$runner_status" -ne 7 ]]; then
  printf 'Expected runner status 7, received %s.\n' "$runner_status" >&2
  exit 1
fi
if [[ -e "$failing_tests/unexpected" ]]; then
  echo 'The runner continued after a failed test.' >&2
  exit 1
fi

echo 'Test runner tests passed.'
