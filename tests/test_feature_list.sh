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

VALID_PROJECT="$TMP_DIR/valid"
mkdir -p "$VALID_PROJECT"
cp "$ROOT_DIR/templates/M/feature_list.json" "$VALID_PROJECT/feature_list.json"

VALID_OUTPUT=$(sh "$ROOT_DIR/scripts/validate-feature-list.sh" "$VALID_PROJECT")
assert_contains "$VALID_OUTPUT" "Feature List Validation"
assert_contains "$VALID_OUTPUT" "Status: valid"

MULTI_ACTIVE="$TMP_DIR/multi-active"
mkdir -p "$MULTI_ACTIVE"
cat > "$MULTI_ACTIVE/feature_list.json" <<'JSON'
{
  "features": [
    {
      "id": "feat-001",
      "title": "First feature",
      "user_visible_behavior": "First behavior",
      "status": "in_progress",
      "verification": ["Run first check"],
      "evidence": []
    },
    {
      "id": "feat-002",
      "title": "Second feature",
      "user_visible_behavior": "Second behavior",
      "status": "in_progress",
      "verification": ["Run second check"],
      "evidence": []
    }
  ]
}
JSON

if sh "$ROOT_DIR/scripts/validate-feature-list.sh" "$MULTI_ACTIVE" >/tmp/vibe-feature-multi 2>&1; then
  echo "Expected multiple in_progress features to fail" >&2
  exit 1
fi
assert_contains "$(cat /tmp/vibe-feature-multi)" "Only one feature may be in_progress"

MISSING_EVIDENCE="$TMP_DIR/missing-evidence"
mkdir -p "$MISSING_EVIDENCE"
cat > "$MISSING_EVIDENCE/feature_list.json" <<'JSON'
{
  "features": [
    {
      "id": "feat-001",
      "title": "Passing without evidence",
      "user_visible_behavior": "Visible behavior",
      "status": "passing",
      "verification": ["Run check"],
      "evidence": []
    }
  ]
}
JSON

if sh "$ROOT_DIR/scripts/validate-feature-list.sh" "$MISSING_EVIDENCE" >/tmp/vibe-feature-evidence 2>&1; then
  echo "Expected passing feature without evidence to fail" >&2
  exit 1
fi
assert_contains "$(cat /tmp/vibe-feature-evidence)" "passing requires evidence"

echo "test_feature_list.sh passed"
