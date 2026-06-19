#!/usr/bin/env sh
set -eu

echo "==> Initializing harness"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

cd "$ROOT_DIR"

required_files="
AGENTS.md
docs/product.md
docs/architecture.md
docs/status.md
docs/plans/active.md
docs/mistake-log.md
docs/quality.md
docs/benchmark.md
feature_list.json
scripts/check.sh
scripts/verify.sh
scripts/validate-feature-list.sh
"

for file in $required_files; do
  if [ ! -e "$file" ]; then
    echo "Missing required harness file: $file" >&2
    exit 1
  fi
done

if [ -f package.json ] && command -v npm >/dev/null 2>&1; then
  npm install
fi

if [ -f pyproject.toml ]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 -m compileall . >/dev/null
  elif command -v python >/dev/null 2>&1; then
    python -m compileall . >/dev/null
  fi
fi

"$SCRIPT_DIR/validate-feature-list.sh" .
"$SCRIPT_DIR/check.sh"

echo "==> Harness initialized"
echo "Next: choose one feature from feature_list.json and keep docs/status.md current."
