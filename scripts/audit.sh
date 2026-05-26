#!/usr/bin/env sh
set -eu

TARGET_DIR=${1:-.}

has_file() {
  [ -f "$TARGET_DIR/$1" ]
}

has_exec() {
  [ -x "$TARGET_DIR/$1" ]
}

score=0
max=0

check_item() {
  max=$((max + 1))
  if "$@"; then
    score=$((score + 1))
  fi
}

context_score=0
context_max=5
has_file "AGENTS.md" && context_score=$((context_score + 1))
has_file "docs/product.md" && context_score=$((context_score + 1))
has_file "docs/architecture.md" && context_score=$((context_score + 1))
has_file "docs/status.md" && context_score=$((context_score + 1))
has_file "docs/plans/active.md" && context_score=$((context_score + 1))

workflow_score=0
workflow_max=3
has_file "prompts/start-project.md" && workflow_score=$((workflow_score + 1))
has_file "prompts/implement-slice.md" && workflow_score=$((workflow_score + 1))
has_file "prompts/review-diff.md" && workflow_score=$((workflow_score + 1))

verification_score=0
verification_max=2
has_exec "scripts/check.sh" && verification_score=$((verification_score + 1))
has_exec "scripts/verify.sh" && verification_score=$((verification_score + 1))

ratchet_score=0
ratchet_max=2
has_file "docs/mistake-log.md" && ratchet_score=$((ratchet_score + 1))
has_file "docs/decisions/0001-initial-architecture.md" && ratchet_score=$((ratchet_score + 1))

skills_score=0
skills_max=5
has_file "skills/frame-project/SKILL.md" && skills_score=$((skills_score + 1))
has_file "skills/implement-slice/SKILL.md" && skills_score=$((skills_score + 1))
has_file "skills/review-diff/SKILL.md" && skills_score=$((skills_score + 1))
has_file "skills/solidify-mistake/SKILL.md" && skills_score=$((skills_score + 1))
has_file "skills/session-handoff/SKILL.md" && skills_score=$((skills_score + 1))

total=$((context_score + workflow_score + verification_score + ratchet_score + skills_score))
total_max=$((context_max + workflow_max + verification_max + ratchet_max + skills_max))

level="None"
if [ "$context_score" -ge 2 ] && [ "$verification_score" -ge 1 ]; then
  level="S"
fi
if [ "$context_score" -eq "$context_max" ] && [ "$verification_score" -eq "$verification_max" ] && [ "$ratchet_score" -eq "$ratchet_max" ]; then
  level="M"
fi
if [ "$level" = "M" ] && [ "$workflow_score" -eq "$workflow_max" ] && [ "$skills_score" -eq "$skills_max" ]; then
  level="L"
fi

next_fix="no obvious missing harness artifact"
if ! has_file "AGENTS.md"; then
  next_fix="add AGENTS.md"
elif ! has_file "docs/product.md"; then
  next_fix="add docs/product.md"
elif ! has_file "docs/architecture.md"; then
  next_fix="add docs/architecture.md"
elif ! has_file "docs/status.md"; then
  next_fix="add docs/status.md"
elif ! has_exec "scripts/check.sh"; then
  next_fix="add executable scripts/check.sh"
elif ! has_exec "scripts/verify.sh"; then
  next_fix="add executable scripts/verify.sh"
elif ! has_file "docs/mistake-log.md"; then
  next_fix="add docs/mistake-log.md"
elif ! has_file "prompts/implement-slice.md"; then
  next_fix="add prompt library"
elif ! has_file "skills/solidify-mistake/SKILL.md"; then
  next_fix="add skills collection"
fi

cat <<EOF
Vibe Harness Audit

Target: $TARGET_DIR

Context Layer: $context_score/$context_max
Workflow Layer: $workflow_score/$workflow_max
Verification Layer: $verification_score/$verification_max
Ratchet Layer: $ratchet_score/$ratchet_max
Skills Layer: $skills_score/$skills_max

Total: $total/$total_max
Level: $level
Next fix: $next_fix
EOF

