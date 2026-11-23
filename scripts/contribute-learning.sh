#!/usr/bin/env bash
# Up-sync: đẩy một cải tiến phần CHUNG (skill, core/*) NGƯỢC về repo Pipeline tổng, qua PR.
# CHỈ file chung — không bao giờ kèm project/ hay dữ liệu khách.
# Dùng: bash scripts/contribute-learning.sh <path-chung-1> [path-chung-2 ...]
set -euo pipefail

PIPELINE_URL="https://github.com/artemisconsole/seo-geo-pipeline.git"
if [ "$#" -lt 1 ]; then echo "Cần ít nhất 1 path chung (vd core/markets/vi-VN.md)"; exit 1; fi

# Chặn đẩy nhầm dữ liệu riêng
for p in "$@"; do
  case "$p" in
    project/*|content/*|.credentials/*|data/*|reports/*|audits/*|website/*)
      echo "TỪ CHỐI: '$p' là dữ liệu riêng dự án, không đẩy lên tổng."; exit 1;;
  esac
done

WORK="$(mktemp -d)"
BRANCH="learn/$(date +%Y%m%d-%H%M)"
git clone --depth 1 "$PIPELINE_URL" "$WORK/pipeline"
cd "$WORK/pipeline"
git switch -c "$BRANCH"

# Copy các path chung từ repo dự án hiện tại vào bản clone của tổng
for p in "$@"; do
  mkdir -p "$(dirname "$p")"
  cp -r "$OLDPWD/$p" "$p"
  git add "$p"
done
git commit -m "Learning from a project: update $*"
git push -u origin "$BRANCH"
gh pr create --fill --base main --head "$BRANCH" || \
  echo "Đã push branch '$BRANCH' lên tổng — mở PR thủ công nếu gh chưa đăng nhập."
echo "Dọn: $WORK (có thể xoá sau khi PR đã tạo)"
