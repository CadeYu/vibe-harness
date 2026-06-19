#!/usr/bin/env sh
set -eu

TARGET_DIR=${1:-.}
FEATURE_FILE="$TARGET_DIR/feature_list.json"

if [ ! -f "$FEATURE_FILE" ]; then
  echo "Feature List Validation"
  echo
  echo "Status: invalid"
  echo "Error: missing feature_list.json"
  exit 1
fi

PYTHON_BIN=${PYTHON_BIN:-}
if [ -z "$PYTHON_BIN" ]; then
  if command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN=python3
  elif command -v python >/dev/null 2>&1; then
    PYTHON_BIN=python
  else
    echo "Feature List Validation"
    echo
    echo "Status: invalid"
    echo "Error: python3 or python is required to validate JSON"
    exit 1
  fi
fi

"$PYTHON_BIN" - "$FEATURE_FILE" <<'PY'
import json
import sys

path = sys.argv[1]
allowed_statuses = {"not_started", "in_progress", "blocked", "passing"}
errors = []

try:
    with open(path, "r", encoding="utf-8") as handle:
        data = json.load(handle)
except Exception as exc:
    print("Feature List Validation")
    print()
    print("Status: invalid")
    print(f"Error: cannot parse feature_list.json: {exc}")
    sys.exit(1)

features = data.get("features")
if not isinstance(features, list) or not features:
    errors.append("features must be a non-empty array")
    features = []

seen_ids = set()
active_count = 0
passing_count = 0
blocked_count = 0

for index, feature in enumerate(features, start=1):
    if not isinstance(feature, dict):
        errors.append(f"feature #{index} must be an object")
        continue

    feature_id = feature.get("id")
    label = feature_id or f"feature #{index}"
    if not isinstance(feature_id, str) or not feature_id.strip():
        errors.append(f"{label}: id is required")
    elif feature_id in seen_ids:
        errors.append(f"{label}: duplicate id")
    else:
        seen_ids.add(feature_id)

    title = feature.get("title") or feature.get("name")
    if not isinstance(title, str) or not title.strip():
        errors.append(f"{label}: title or name is required")

    behavior = feature.get("user_visible_behavior") or feature.get("description")
    if not isinstance(behavior, str) or not behavior.strip():
        errors.append(f"{label}: user_visible_behavior or description is required")

    status = feature.get("status")
    if status not in allowed_statuses:
        errors.append(f"{label}: status must be one of {', '.join(sorted(allowed_statuses))}")
    elif status == "in_progress":
        active_count += 1
    elif status == "passing":
        passing_count += 1
    elif status == "blocked":
        blocked_count += 1

    verification = feature.get("verification")
    if not isinstance(verification, list) or not verification:
        errors.append(f"{label}: verification must be a non-empty array")

    evidence = feature.get("evidence")
    if evidence is None:
        errors.append(f"{label}: evidence must exist, even when empty")
    elif not isinstance(evidence, list):
        errors.append(f"{label}: evidence must be an array")
    elif status == "passing" and not evidence:
        errors.append(f"{label}: passing requires evidence")

if active_count > 1:
    errors.append("Only one feature may be in_progress")

print("Feature List Validation")
print()
print(f"File: {path}")
print(f"Features: {len(features)}")
print(f"In progress: {active_count}")
print(f"Passing: {passing_count}")
print(f"Blocked: {blocked_count}")

if errors:
    print("Status: invalid")
    print()
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("Status: valid")
PY
