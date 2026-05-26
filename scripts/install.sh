#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage: scripts/install.sh /path/to/project [--size S|M|L] [--dry-run] [--force]

Options:
  --size      Harness size to install. Default: M.
  --dry-run   Print planned writes without copying files.
  --force     Overwrite existing files.
EOF
}

if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

TARGET_DIR=$1
shift

SIZE=M
DRY_RUN=0
FORCE=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --size)
      if [ "$#" -lt 2 ]; then
        echo "--size requires S, M, or L" >&2
        exit 1
      fi
      SIZE=$2
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

case "$SIZE" in
  S|M|L)
    ;;
  *)
    echo "Invalid size: $SIZE" >&2
    echo "Expected S, M, or L" >&2
    exit 1
    ;;
esac

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
TEMPLATE_DIR="$ROOT_DIR/templates/$SIZE"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Template not found: $TEMPLATE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

copy_template() {
  src_root=$1
  find "$src_root" -type f | while IFS= read -r src; do
    rel=${src#"$src_root/"}
    dest="$TARGET_DIR/$rel"

    if [ -e "$dest" ] && [ "$FORCE" -ne 1 ]; then
      echo "Refusing to overwrite existing file: $dest" >&2
      echo "Use --force to overwrite." >&2
      exit 1
    fi

    if [ "$DRY_RUN" -eq 1 ]; then
      echo "Would write: $dest"
    else
      mkdir -p "$(dirname -- "$dest")"
      cp "$src" "$dest"
      case "$dest" in
        */scripts/*.sh)
          chmod +x "$dest"
          ;;
      esac
      echo "Wrote: $dest"
    fi
  done
}

if [ "$DRY_RUN" -eq 1 ]; then
  echo "Dry run: installing Vibe Harness size $SIZE into $TARGET_DIR"
else
  echo "Installing Vibe Harness size $SIZE into $TARGET_DIR"
fi

copy_template "$TEMPLATE_DIR"

if [ "$SIZE" = "L" ]; then
  echo "Note: L is additive. Install M first when starting from an empty project, then install L."
fi

