#!/usr/bin/env bash
# Renders page 1 of every PDF in pubs/ to pubs/thumbs/<name>.png
# Requires poppler: brew install poppler   (or apt install poppler-utils)
set -e
mkdir -p pubs/thumbs
for f in pubs/*.pdf; do
  name=$(basename "$f" .pdf)
  pdftoppm -png -f 1 -l 1 -scale-to 480 -singlefile "$f" "pubs/thumbs/$name"
  echo "made pubs/thumbs/$name.png"
done
