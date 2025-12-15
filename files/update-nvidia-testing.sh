#!/bin/bash
set -euo pipefail

REPO_DIR="/srv/repo/nvidia"
KEEP=3  # keep last "n" versions
cd "$REPO_DIR"

sudo pacman \
  --config /etc/pacman-testing.conf \
  -Sw \
  --noconfirm \
  extra-testing/nvidia-dkms \
  extra-testing/nvidia-utils \
  multilib-testing/lib32-nvidia-utils

#deletes all old packages except last 3 versions
for pkg in nvidia-dkms nvidia-utils lib32-nvidia-utils; do
    pkgs=($(ls -1 ${pkg}-*.pkg.tar.zst 2>/dev/null | sort -V))
    num=${#pkgs[@]}
    if (( num > KEEP )); then
        delete_count=$((num - KEEP))
        echo "Lösche alte Versionen von $pkg: ${pkgs[@]:0:delete_count}"
        rm -f "${pkgs[@]:0:delete_count}"
    fi
done

repo-add nvidia.db.tar.gz *.pkg.tar.zst
