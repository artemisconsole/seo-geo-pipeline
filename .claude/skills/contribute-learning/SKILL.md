---
name: contribute-learning
description: "Đẩy bài học/cải tiến phần CHUNG (skill, core/*) từ một dự án NGƯỢC về repo Pipeline tổng bằng PR — ví dụ cải thiện rule dịch cho một ngôn ngữ, pattern lint mới, format mới, rule content chung. Phân loại bài học riêng-brand (ở lại dự án) vs chung (đẩy lên tổng). KHÔNG bao giờ kèm dữ liệu khách. Dùng /contribute-learning khi learned.md có bài học áp dụng cho mọi dự án."
---

# contribute-learning  (up-sync — dự án dạy lại tổng)

Biến phản hồi thực chiến của một dự án thành cải tiến cho **mọi dự án**, qua PR về repo tổng. Đây là nửa
"học hỏi" của mô hình đồng bộ 2 chiều (xem `docs/sync.md`).

## Khi nào chạy
Sau vài vòng `/learn`, khi `project/brand/learned.md` (hoặc feedback SEN/khách) có bài học **không phải
giọng riêng brand** mà là quy tắc chung: dịch một ngôn ngữ, format bài, rule lint, nguồn research, kỹ thuật.

## Các bước
1. **Đọc** `project/brand/learned.md` + feedback gần đây.
2. **Phân loại từng bài học:**
   - *Riêng brand* (giọng, từ cấm riêng, fact khách) → **ở lại** `project/brand/`. Không đẩy.
   - *Chung* → map vào file CHUNG đúng chỗ:
     - Dịch/chính tả một ngôn ngữ → `core/markets/<locale>.md` hoặc skill `translate-content`.
     - Rule viết/lint chung → `core/rules/content-rules.md` hoặc `core/rules/geo-rules.md`.
     - Format mới → `core/formats/...`. Ngành → `core/industries/<ngành>.md`.
3. **Soạn sửa đổi** vào file CHUNG đó **trong repo dự án này** (bản nháp), diễn đạt tổng quát — bỏ mọi
   chi tiết nhận dạng khách.
4. **Kiểm tra sạch dữ liệu khách:** không có tên/URL/số liệu riêng khách trong diff.
5. **Mở PR về tổng:** `bash scripts/contribute-learning.sh <path-chung-1> [path-chung-2 ...]`.
   Script từ chối nếu path thuộc `project/`, `content/`, `.credentials/`...
6. Báo: maintainer của repo tổng duyệt PR. Sau khi merge, các dự án khác nhận qua down-sync (`/sync` /
   `scripts/sync-core.sh`).

## Ví dụ — vòng học skill dịch
Dự án A sửa nhiều chỗ khi dịch EN→Việt (ví dụ cách xưng hô, thuật ngữ du lịch). Nếu là **quy tắc tiếng Việt
chung** → cập nhật `core/markets/vi-VN.md` + `translate-content`, PR về tổng → dự án B, C dịch tốt lên theo.

## Ranh giới (cứng)
- Không bao giờ đẩy `project/`, `content/`, credential, hay bất kỳ dữ liệu khách nào lên tổng.
- Bài học mơ hồ giữa riêng/chung → hỏi người, không tự quyết đẩy lên.
