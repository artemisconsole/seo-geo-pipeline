#!/usr/bin/env bash
# Down-sync: cập nhật phần CHUNG (core/skills/agents/docs/CLAUDE.md/scripts) từ repo Pipeline tổng
# về repo dự án này, qua một branch + Pull Request. KHÔNG đụng project/ hay dữ liệu khách.
# Dùng: bash scripts/sync-core.sh [URL-repo-tong]
set -euo pipefail

PIPELINE_URL="${1:-https://github.com/artemisconsole/seo-geo-pipeline.git}"
SHARED_PATHS=(core .claude/skills .claude/agents docs scripts CLAUDE.md)
BRANCH="sync/core-$(date +%Y%m%d-%H%M)"

# 1. Remote 'pipeline' trỏ về repo tổng
if ! git remote get-url pipeline >/dev/null 2>&1; then
  git remote add pipeline "$PIPELINE_URL"
fi
git fetch pipeline main

# 2. Branch mới, lấy phiên bản mới nhất của các path CHUNG từ tổng
git switch -c "$BRANCH"
for p in "${SHARED_PATHS[@]}"; do
  git checkout pipeline/main -- "$p" 2>/dev/null || echo "skip (chưa có ở tổng): $p"
done

# 3. Commit nếu có thay đổi
git add "${SHARED_PATHS[@]}" 2>/dev/null || true
if git diff --cached --quiet; then
  echo "Không có cập nhật core mới. Xoá branch tạm."
  git switch -
  git branch -D "$BRANCH"
  exit 0
fi
git commit -m "Sync core from pipeline ($(date +%Y-%m-%d))"

# 4. Mở PR (cần gh đã đăng nhập). Không tự merge — để PIC duyệt diff.
echo "Đã tạo branch '$BRANCH'. Xem diff rồi mở PR:"
echo "  gh pr create --fill --base main --head \"$BRANCH\""
gh pr create --fill --base main --head "$BRANCH" 2>/dev/null || true
