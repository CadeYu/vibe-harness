#!/usr/bin/env sh
set -eu

echo "==> Checking clean session state"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

cd "$ROOT_DIR"

"$SCRIPT_DIR/validate-feature-list.sh" .
"$SCRIPT_DIR/check.sh"

if find . \
  -path ./.git -prune -o \
  -type f \( \
    -name "*.tmp" -o \
    -name "*.bak" -o \
    -name "*.orig" -o \
    -name ".DS_Store" -o \
    -name "debug.log" \
  \) -print | grep . >/dev/null 2>&1; then
  echo "Temporary artifacts found. Remove or document them before handoff." >&2
  find . \
    -path ./.git -prune -o \
    -type f \( \
      -name "*.tmp" -o \
      -name "*.bak" -o \
      -name "*.orig" -o \
      -name ".DS_Store" -o \
      -name "debug.log" \
    \) -print >&2
  exit 1
fi

if [ -d .git ] && command -v git >/dev/null 2>&1; then
  if ! git diff --quiet -- docs/status.md feature_list.json 2>/dev/null; then
    echo "Status files have uncommitted changes. That is allowed, but they must be intentional." >&2
  fi
fi

echo "==> Clean session state check complete"
