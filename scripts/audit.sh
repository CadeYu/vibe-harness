#!/usr/bin/env sh
set -eu

TARGET_DIR=${1:-.}

has_file() {
  [ -f "$TARGET_DIR/$1" ]
}

has_exec() {
  [ -x "$TARGET_DIR/$1" ]
}

has_dir() {
  [ -d "$TARGET_DIR/$1" ]
}

has_text() {
  file=$1
  text=$2
  has_file "$file" && grep -F "$text" "$TARGET_DIR/$file" >/dev/null 2>&1
}

score_item() {
  score_name=$1
  shift
  if "$@"; then
    eval "$score_name=\$((\$$score_name + 1))"
  fi
}

instructions_score=0
instructions_max=2
score_item instructions_score has_file "AGENTS.md"
score_item instructions_score has_text "AGENTS.md" "完成"

state_score=0
state_max=4
score_item state_score has_file "docs/product.md"
score_item state_score has_file "docs/status.md"
score_item state_score has_file "docs/plans/active.md"
score_item state_score has_file "feature_list.json"

verification_score=0
verification_max=3
score_item verification_score has_exec "scripts/check.sh"
score_item verification_score has_exec "scripts/verify.sh"
score_item verification_score has_exec "scripts/validate-feature-list.sh"

scope_score=0
scope_max=3
score_item scope_score has_file "feature_list.json"
score_item scope_score has_text "AGENTS.md" "一次只"
score_item scope_score has_text "docs/plans/active.md" "验收"

lifecycle_score=0
lifecycle_max=3
score_item lifecycle_score has_file "docs/status.md"
score_item lifecycle_score has_exec "scripts/init-harness.sh"
score_item lifecycle_score has_exec "scripts/clean-state.sh"

ratchet_score=0
ratchet_max=2
score_item ratchet_score has_file "docs/mistake-log.md"
score_item ratchet_score has_dir "docs/decisions"

sensors_score=0
sensors_max=3
score_item sensors_score has_exec "scripts/check.sh"
score_item sensors_score has_exec "scripts/verify.sh"
score_item sensors_score has_file "docs/sensors.md"

quality_score=0
quality_max=2
score_item quality_score has_file "docs/quality.md"
score_item quality_score has_file "docs/benchmark.md"

total=$((instructions_score + state_score + verification_score + scope_score + lifecycle_score + ratchet_score + sensors_score + quality_score))
total_max=$((instructions_max + state_max + verification_max + scope_max + lifecycle_max + ratchet_max + sensors_max + quality_max))

level="None"
if [ "$instructions_score" -ge 1 ] &&
   [ "$state_score" -ge 2 ] &&
   [ "$verification_score" -ge 1 ]; then
  level="S"
fi
if [ "$instructions_score" -eq "$instructions_max" ] &&
   [ "$state_score" -eq "$state_max" ] &&
   [ "$verification_score" -eq "$verification_max" ] &&
   [ "$scope_score" -ge 2 ] &&
   [ "$lifecycle_score" -ge 2 ] &&
   [ "$ratchet_score" -eq "$ratchet_max" ]; then
  level="M"
fi
if [ "$level" = "M" ] &&
   [ "$sensors_score" -eq "$sensors_max" ] &&
   [ "$quality_score" -eq "$quality_max" ]; then
  level="L"
fi

lowest_layer="Instructions"
lowest_score=$instructions_score
lowest_max=$instructions_max

consider_lowest() {
  name=$1
  score=$2
  max=$3
  left=$((max - score))
  lowest_left=$((lowest_max - lowest_score))
  if [ "$left" -gt "$lowest_left" ]; then
    lowest_layer=$name
    lowest_score=$score
    lowest_max=$max
  fi
}

consider_lowest "State" "$state_score" "$state_max"
consider_lowest "Verification" "$verification_score" "$verification_max"
consider_lowest "Scope" "$scope_score" "$scope_max"
consider_lowest "Lifecycle" "$lifecycle_score" "$lifecycle_max"
consider_lowest "Ratchet" "$ratchet_score" "$ratchet_max"
consider_lowest "Sensors" "$sensors_score" "$sensors_max"
consider_lowest "Quality" "$quality_score" "$quality_max"

next_fix="no obvious missing harness artifact"
if ! has_file "AGENTS.md"; then
  next_fix="add AGENTS.md"
elif ! has_file "feature_list.json"; then
  next_fix="add feature_list.json"
elif ! has_file "docs/product.md"; then
  next_fix="add docs/product.md"
elif ! has_file "docs/status.md"; then
  next_fix="add docs/status.md"
elif ! has_file "docs/plans/active.md"; then
  next_fix="add docs/plans/active.md"
elif ! has_exec "scripts/init-harness.sh"; then
  next_fix="add executable scripts/init-harness.sh"
elif ! has_exec "scripts/check.sh"; then
  next_fix="add executable scripts/check.sh"
elif ! has_exec "scripts/verify.sh"; then
  next_fix="add executable scripts/verify.sh"
elif ! has_exec "scripts/validate-feature-list.sh"; then
  next_fix="add executable scripts/validate-feature-list.sh"
elif ! has_exec "scripts/clean-state.sh"; then
  next_fix="add executable scripts/clean-state.sh"
elif ! has_file "docs/mistake-log.md"; then
  next_fix="add docs/mistake-log.md"
elif ! has_file "docs/quality.md"; then
  next_fix="add docs/quality.md"
elif ! has_file "docs/benchmark.md"; then
  next_fix="add docs/benchmark.md"
elif ! has_file "docs/sensors.md"; then
  next_fix="add docs/sensors.md"
fi

cat <<EOF
Vibe Harness Audit

Target: $TARGET_DIR

Instructions: $instructions_score/$instructions_max
State: $state_score/$state_max
Verification: $verification_score/$verification_max
Scope: $scope_score/$scope_max
Lifecycle: $lifecycle_score/$lifecycle_max
Ratchet: $ratchet_score/$ratchet_max
Sensors: $sensors_score/$sensors_max
Quality: $quality_score/$quality_max

Total: $total/$total_max
Level: $level
Lowest layer: $lowest_layer ($lowest_score/$lowest_max)
Next fix: $next_fix
EOF

if [ "$TARGET_DIR" = "." ] || [ "$(CDPATH= cd -- "$TARGET_DIR" 2>/dev/null && pwd)" = "$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)" ]; then
  echo
  sh "$(dirname -- "$0")/check-consistency.sh"
fi
