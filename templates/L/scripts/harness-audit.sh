#!/usr/bin/env sh
set -eu

if [ -x ./scripts/audit.sh ]; then
  ./scripts/audit.sh .
else
  echo "scripts/audit.sh is not installed in this project"
  exit 1
fi

