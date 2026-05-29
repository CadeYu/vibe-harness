#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

count_files() {
  find "$1" -type f -name "$2" | wc -l | tr -d ' '
}

count_dirs_with_file() {
  find "$1" -mindepth 2 -maxdepth 2 -type f -name "$2" | wc -l | tr -d ' '
}

assert_file() {
  if [ ! -f "$ROOT_DIR/$1" ]; then
    echo "Missing required file: $1" >&2
    return 1
  fi
  return 0
}

check_index_entry() {
  index_file=$1
  entry=$2
  if ! grep -F "\`$entry\`" "$ROOT_DIR/$index_file" >/dev/null 2>&1; then
    echo "Missing index entry in $index_file: $entry" >&2
    return 1
  fi
  return 0
}

prompt_score=0
prompt_max=$(count_files "$ROOT_DIR/prompts" "*.md")
for prompt in "$ROOT_DIR"/prompts/*.md; do
  name=$(basename "$prompt")
  if check_index_entry "README.md" "prompts/$name"; then
    prompt_score=$((prompt_score + 1))
  fi
done

skill_score=0
skill_max=$(count_dirs_with_file "$ROOT_DIR/skills" "SKILL.md")
for skill in "$ROOT_DIR"/skills/*/SKILL.md; do
  name=$(basename "$(dirname "$skill")")
  if check_index_entry "docs/skills.md" "$name"; then
    skill_score=$((skill_score + 1))
  fi
done

example_score=0
example_max=0
for example in "$ROOT_DIR"/examples/*; do
  if [ -d "$example" ]; then
    example_max=$((example_max + 1))
    name=$(basename "$example")
    if check_index_entry "docs/examples.md" "examples/$name"; then
      example_score=$((example_score + 1))
    fi
  fi
done

core_score=0
core_max=12
for file in \
  "docs/spec.md" \
  "docs/framework.md" \
  "docs/workflow.md" \
  "docs/agents.md" \
  "docs/orchestration.md" \
  "docs/sensors.md" \
  "docs/mistake-ratchet.md" \
  "docs/skills.md" \
  "docs/examples.md" \
  "docs/references.md" \
  "docs/interview-playbook.md" \
  "docs/philosophy.md"
do
  if assert_file "$file"; then
    core_score=$((core_score + 1))
  fi
done

cat <<EOF
Repository Consistency

Prompt Index: $prompt_score/$prompt_max
Skill Index: $skill_score/$skill_max
Example Index: $example_score/$example_max
Core Docs: $core_score/$core_max
EOF

if [ "$prompt_score" -ne "$prompt_max" ] ||
   [ "$skill_score" -ne "$skill_max" ] ||
   [ "$example_score" -ne "$example_max" ] ||
   [ "$core_score" -ne "$core_max" ]; then
  exit 1
fi
