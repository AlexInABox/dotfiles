#!/bin/bash
set -euo pipefail

DEVNAME="$1"
LABEL="$(lsblk -no LABEL "$DEVNAME")"

[[ "$LABEL" == EAV* ]] || exit 0

MOUNTPOINT="/mnt/evidences/$LABEL"

if [[ "$(findmnt -rno SOURCE --target "$MOUNTPOINT" 2>/dev/null)" == "$DEVNAME" ]]; then
    exit 0
fi

systemd-mount --collect --options=ro "$DEVNAME" "$MOUNTPOINT"
