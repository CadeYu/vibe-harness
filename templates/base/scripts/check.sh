#!/usr/bin/env sh
set -eu

echo "==> Running fast checks"

if [ -f package.json ]; then
  if command -v npm >/dev/null 2>&1; then
    npm run lint --if-present
    npm run typecheck --if-present
    npm test --if-present
  else
    echo "npm not found; skipping package.json checks"
  fi
fi

if [ -f pyproject.toml ]; then
  if command -v ruff >/dev/null 2>&1; then
    ruff check .
  else
    echo "ruff not found; skipping Python lint"
  fi

  if command -v pytest >/dev/null 2>&1; then
    pytest
  else
    echo "pytest not found; skipping Python tests"
  fi
fi

if [ -f go.mod ]; then
  if command -v go >/dev/null 2>&1; then
    go test ./...
  else
    echo "go not found; skipping Go tests"
  fi
fi

if [ -f Cargo.toml ]; then
  if command -v cargo >/dev/null 2>&1; then
    cargo fmt --check
    cargo test
  else
    echo "cargo not found; skipping Rust checks"
  fi
fi

echo "==> Fast checks complete"

