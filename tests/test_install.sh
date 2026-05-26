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

assert_file() {
  if [ ! -f "$1" ]; then
    echo "Expected file to exist: $1" >&2
    exit 1
  fi
}

DRY_TARGET="$TMP_DIR/dry"
mkdir -p "$DRY_TARGET"
DRY_OUTPUT=$(sh "$ROOT_DIR/scripts/install.sh" "$DRY_TARGET" --size S --dry-run)
assert_contains "$DRY_OUTPUT" "Dry run"
if [ -f "$DRY_TARGET/AGENTS.md" ]; then
  echo "Dry run should not write files" >&2
  exit 1
fi

S_TARGET="$TMP_DIR/s"
mkdir -p "$S_TARGET"
sh "$ROOT_DIR/scripts/install.sh" "$S_TARGET" --size S >/dev/null
assert_file "$S_TARGET/AGENTS.md"
assert_file "$S_TARGET/docs/product.md"
assert_file "$S_TARGET/scripts/check.sh"

M_TARGET="$TMP_DIR/m"
mkdir -p "$M_TARGET"
sh "$ROOT_DIR/scripts/install.sh" "$M_TARGET" --size M >/dev/null
assert_file "$M_TARGET/docs/architecture.md"
assert_file "$M_TARGET/docs/mistake-log.md"
assert_file "$M_TARGET/scripts/verify.sh"

NO_OVERWRITE_TARGET="$TMP_DIR/no-overwrite"
mkdir -p "$NO_OVERWRITE_TARGET"
printf '%s\n' "custom" > "$NO_OVERWRITE_TARGET/AGENTS.md"
if sh "$ROOT_DIR/scripts/install.sh" "$NO_OVERWRITE_TARGET" --size S >/tmp/vibe-install-out 2>&1; then
  echo "Expected install to fail when file exists" >&2
  exit 1
fi
assert_contains "$(cat /tmp/vibe-install-out)" "Refusing to overwrite"
assert_contains "$(cat "$NO_OVERWRITE_TARGET/AGENTS.md")" "custom"

echo "test_install.sh passed"

