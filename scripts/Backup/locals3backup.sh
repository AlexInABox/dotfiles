
#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/locals3backup.env"

exec >> "$(dirname "$0")/locals3backup.log" 2>&1
echo "=== Backup started: $(date) ==="

rc alias set source "$SOURCE_URL" "$SOURCE_ACCESS_KEY" "$SOURCE_SECRET_KEY"
rc alias set target "$TARGET_URL" "$TARGET_ACCESS_KEY" "$TARGET_SECRET_KEY"
rc mb --ignore-existing "target/$DEST_BUCKET"

while read -r bucket; do
  bucket="${bucket%/}"
  rc mirror --overwrite --remove --summary \
    "source/$bucket" "target/$DEST_BUCKET/$bucket"
done < <(rc ls source | awk '$NF ~ /\/$/ {print $NF}')

echo "=== Backup finished: $(date) ==="
