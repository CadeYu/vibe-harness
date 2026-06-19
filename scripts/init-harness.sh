#!/usr/bin/env sh
set -eu

echo "==> Initializing Vibe Harness repository"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

cd "$ROOT_DIR"

required_files="
AGENTS.md
README.md
docs/spec.md
docs/framework.md
docs/workflow.md
docs/feature-list.md
docs/product.md
docs/status.md
docs/plans/active.md
feature_list.json
scripts/check.sh
scripts/verify.sh
scripts/audit.sh
scripts/check-consistency.sh
scripts/validate-feature-list.sh
scripts/clean-state.sh
"

for file in $required_files; do
  if [ ! -e "$file" ]; then
    echo "Missing required harness repository file: $file" >&2
    exit 1
  fi
done

"$SCRIPT_DIR/check.sh"

echo "==> Vibe Harness repository initialized"
echo "Next: run shell tests before committing framework changes."
