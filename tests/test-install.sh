#!/usr/bin/env bash

# Exercise installer configuration detection and non-destructive settings merging.
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
temporary_root="$(mktemp -d)"
trap 'rm -rf "$temporary_root"' EXIT

# Run the installer with a local git replacement that supplies the test repository.
run_installer() {
  local test_directory="$1"

  mkdir -p "$test_directory/bin"
  cp "$repository_root/tests/fixtures/install/git" "$test_directory/bin/git"
  chmod +x "$test_directory/bin/git"

  (
    cd "$test_directory"
    PATH="$test_directory/bin:$PATH" \
      CBC_TEST_REPOSITORY="$repository_root" \
      CBC_REPOSITORY_URL="test://creative-button-card-templates" \
      bash "$repository_root/bin/install"
  )
}

# Assert that two files have identical content.
assert_files_equal() {
  local expected_file="$1"
  local actual_file="$2"

  if ! cmp -s "$expected_file" "$actual_file"; then
    diff -u "$expected_file" "$actual_file"
    exit 1
  fi
}

already_configured="$temporary_root/already-configured"
mkdir -p "$already_configured"
cat > "$already_configured/ui-lovelace.yaml" <<'EOF'
button_card_templates: !include_dir_merge_named creative-button-card-templates/
views: []
EOF
cp "$already_configured/ui-lovelace.yaml" "$already_configured/expected.yaml"
run_installer "$already_configured" > "$already_configured/output.log"
assert_files_equal "$already_configured/expected.yaml" "$already_configured/ui-lovelace.yaml"
grep -q '^::CBC::✅::> Creative Button-Card Templates is already configured.*No changes were made' "$already_configured/output.log"

existing_templates="$temporary_root/existing-templates"
mkdir -p "$existing_templates"
cat > "$existing_templates/ui-lovelace.yaml" <<'EOF'
button_card_templates:
  local_template:
    color: red
views: []
EOF
cp "$existing_templates/ui-lovelace.yaml" "$existing_templates/expected.yaml"
run_installer "$existing_templates" > "$existing_templates/output.log"
assert_files_equal "$existing_templates/expected.yaml" "$existing_templates/ui-lovelace.yaml"
grep -q '^::CBC::⚠️::> button_card_templates.*does not include Creative Button-Card Templates.*No changes were made' "$existing_templates/output.log"

new_configuration="$temporary_root/new-configuration"
mkdir -p "$new_configuration"
printf 'views: []\n' > "$new_configuration/ui-lovelace.yaml"
run_installer "$new_configuration" > "$new_configuration/output.log"
test "$(grep -c '^button_card_templates:' "$new_configuration/ui-lovelace.yaml")" -eq 1
grep -q '^views: \[\]$' "$new_configuration/ui-lovelace.yaml"
grep -q '^::CBC::💻::> Installing Creative Button-Card Templates' "$new_configuration/output.log"
grep -q '^::CBC::📝::> Adding Creative Button-Card Templates' "$new_configuration/output.log"

merged_settings="$temporary_root/merged-settings"
mkdir -p "$merged_settings"
cat > "$merged_settings/cbc_settings.yaml" <<'EOF'
cbc_settings:
  variables:
    _cbc_settings:
      check_version:
        auto: false
        frequency: 30
      stats:
        generate: true
      user_only:
        retained: yes
EOF
cp "$merged_settings/cbc_settings.yaml" "$merged_settings/existing-settings.yaml"
CBC_TEST_SETTINGS="$merged_settings/existing-settings.yaml" run_installer "$merged_settings" > "$merged_settings/output.log"
result="$merged_settings/creative-button-card-templates/custom/cbc_settings.yaml"
grep -q '^[[:space:]]*auto: false$' "$result"
grep -q '^[[:space:]]*frequency: 30$' "$result"
grep -q '^[[:space:]]*generate: true$' "$result"
grep -q '^[[:space:]]*retained: yes$' "$result"
grep -q '^[[:space:]]*notify: true$' "$result"
grep -q '^[[:space:]]*hash_panels: false$' "$result"
test "$(grep -c '^[[:space:]]*notify:' "$result")" -eq 1
test "$(grep -c '^[[:space:]]*hash_panels:' "$result")" -eq 1
grep -q 'New repository settings were added.*existing settings were preserved' "$merged_settings/output.log"

missing_section="$temporary_root/missing-section"
mkdir -p "$missing_section"
cat > "$missing_section/existing-settings.yaml" <<'EOF'
cbc_settings:
  variables:
    _cbc_settings:
      check_version:
        auto: false
        frequency: 30
        notify: false
EOF
CBC_TEST_SETTINGS="$missing_section/existing-settings.yaml" run_installer "$missing_section" > "$missing_section/output.log"
result="$missing_section/creative-button-card-templates/custom/cbc_settings.yaml"
grep -q '^      stats:$' "$result"
grep -q '^        generate: false$' "$result"
grep -q '^        hash_panels: false$' "$result"

current_settings="$temporary_root/current-settings"
mkdir -p "$current_settings"
CBC_TEST_SETTINGS="$repository_root/custom/cbc_settings.sample" run_installer "$current_settings" > "$current_settings/output.log"
assert_files_equal \
  "$repository_root/custom/cbc_settings.sample" \
  "$current_settings/creative-button-card-templates/custom/cbc_settings.yaml"
grep -q 'already includes all settings from the repository' "$current_settings/output.log"

clone_failure="$temporary_root/clone-failure"
mkdir -p "$clone_failure"
if CBC_TEST_GIT_FAILURE=1 run_installer "$clone_failure" > "$clone_failure/output.log"; then
  echo 'Installer unexpectedly succeeded after a clone failure.' >&2
  exit 1
fi
grep -q '^::CBC::❌::> Failed to clone repository' "$clone_failure/output.log"

echo 'Installer tests passed.'
