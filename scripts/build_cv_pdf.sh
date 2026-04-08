#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT/assets/files"
TMP_MD="/tmp/colin-williams-cv.md"
OUT_PDF="$OUT_DIR/colin-williams-cv.pdf"

mkdir -p "$OUT_DIR"
ruby "$ROOT/scripts/render_cv_markdown.rb" > "$TMP_MD"
pandoc "$TMP_MD" --pdf-engine=pdflatex -o "$OUT_PDF"

printf 'Built %s\n' "$OUT_PDF"
