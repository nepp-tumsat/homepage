#!/bin/bash
# sitemap.xml の lastmod を今日の日付に更新する
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SITEMAP="${SCRIPT_DIR}/../sitemap.xml"
DATE=$(date +%Y-%m-%d)

if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' "s|<lastmod>.*</lastmod>|<lastmod>${DATE}</lastmod>|" "$SITEMAP"
else
  sed -i "s|<lastmod>.*</lastmod>|<lastmod>${DATE}</lastmod>|" "$SITEMAP"
fi

echo "sitemap.xml の lastmod を ${DATE} に更新しました"
