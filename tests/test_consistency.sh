#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

OUTPUT=$(sh "$ROOT_DIR/scripts/check-consistency.sh")
AUDIT_OUTPUT=$(sh "$ROOT_DIR/scripts/audit.sh" "$ROOT_DIR")

assert_contains() {
  haystack=$1
  needle=$2
  if ! printf '%s\n' "$haystack" | grep -F "$needle" >/dev/null 2>&1; then
    echo "Expected output to contain: $needle" >&2
    echo "$haystack" >&2
    exit 1
  fi
}

assert_contains "$OUTPUT" "Repository Consistency"
assert_contains "$OUTPUT" "Prompt Index: 8/8"
assert_contains "$OUTPUT" "Skill Index: 5/5"
assert_contains "$OUTPUT" "Example Index: 3/3"
assert_contains "$OUTPUT" "Core Docs: 16/16"
assert_contains "$AUDIT_OUTPUT" "Repository Consistency"
assert_contains "$AUDIT_OUTPUT" "Level: L"

echo "test_consistency.sh passed"
