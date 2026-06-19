#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

assert_contains() {
  haystack=$1
  needle=$2
  if ! printf '%s\n' "$haystack" | grep -F "$needle" >/dev/null 2>&1; then
    echo "Expected output to contain: $needle" >&2
    echo "$haystack" >&2
    exit 1
  fi
}

EMPTY_PROJECT="$TMP_DIR/empty"
mkdir -p "$EMPTY_PROJECT"

EMPTY_OUTPUT=$(sh "$ROOT_DIR/scripts/audit.sh" "$EMPTY_PROJECT")
assert_contains "$EMPTY_OUTPUT" "Level: None"
assert_contains "$EMPTY_OUTPUT" "Instructions:"
assert_contains "$EMPTY_OUTPUT" "State:"
assert_contains "$EMPTY_OUTPUT" "Next fix: add AGENTS.md"

M_PROJECT="$TMP_DIR/m-project"
mkdir -p "$M_PROJECT"
cp -R "$ROOT_DIR/templates/M/." "$M_PROJECT/"
chmod +x "$M_PROJECT/scripts/check.sh" "$M_PROJECT/scripts/verify.sh" "$M_PROJECT/scripts/validate-feature-list.sh"

M_OUTPUT=$(sh "$ROOT_DIR/scripts/audit.sh" "$M_PROJECT")
assert_contains "$M_OUTPUT" "Level: M"
assert_contains "$M_OUTPUT" "Instructions: 2/2"
assert_contains "$M_OUTPUT" "State: 4/4"
assert_contains "$M_OUTPUT" "Verification: 3/3"
assert_contains "$M_OUTPUT" "Ratchet: 2/2"
assert_contains "$M_OUTPUT" "Lifecycle: 3/3"
assert_contains "$M_OUTPUT" "Lowest layer:"

echo "test_audit.sh passed"
