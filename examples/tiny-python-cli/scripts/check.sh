#!/usr/bin/env sh
set -eu

export PYTHONDONTWRITEBYTECODE=1
trap 'find src tests -type d -name __pycache__ -prune -exec rm -rf {} +' EXIT

python - <<'PY'
from pathlib import Path

for path in Path("src").rglob("*.py"):
    compile(path.read_text(), str(path), "exec")
PY
PYTHONPATH=src python -m unittest discover -s tests
