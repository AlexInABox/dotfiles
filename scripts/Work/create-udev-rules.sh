#!/bin/bash
set -euo pipefail

DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
chmod +x "$DIR/automount.sh"

cat > /etc/systemd/system/automount@.service <<EOF
[Unit]
Description=Mount evidence drive %I

[Service]
Type=oneshot
ExecStart=$DIR/automount.sh /dev/%I
EOF

cat > /etc/udev/rules.d/99-automount.rules <<'EOF'
ACTION=="add", SUBSYSTEM=="block", ENV{DEVTYPE}=="partition", ENV{ID_FS_LABEL}=="EAV*", TAG+="systemd", ENV{SYSTEMD_WANTS}="automount@%k.service"
EOF

systemctl daemon-reload
udevadm control --reload-rules
