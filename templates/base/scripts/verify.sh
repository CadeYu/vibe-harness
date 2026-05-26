#!/usr/bin/env sh
set -eu

echo "==> Running full verification"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
"$SCRIPT_DIR/check.sh"

if [ -f package.json ]; then
  if command -v npm >/dev/null 2>&1; then
    npm run build --if-present
  else
    echo "npm not found; skipping package build"
  fi
fi

if [ -f pyproject.toml ]; then
  if command -v python >/dev/null 2>&1; then
    python -m compileall .
  else
    echo "python not found; skipping Python compile check"
  fi
fi

if [ -f go.mod ]; then
  if command -v go >/dev/null 2>&1; then
    go vet ./...
  else
    echo "go not found; skipping Go vet"
  fi
fi

if [ -f Cargo.toml ]; then
  if command -v cargo >/dev/null 2>&1; then
    cargo clippy --all-targets -- -D warnings
  else
    echo "cargo not found; skipping Rust clippy"
  fi
fi

echo "==> Full verification complete"

