---
name: quick-win
description: "Sau khi Plan SEO/GEO hoàn chỉnh (P04): tìm Quick Win (việc làm trước ra kết quả ngay — sửa ăn thịt từ khoá, từ khoá 'low-hanging fruit' sát top, on-page landing page dịch vụ) và vạch Winning Strategy (đường để đạt KPI + mang booking/submit/purchase/revenue: phủ nội dung toàn chủ đề, content template, local SEO, backlink/authority, GEO). Chấm ưu tiên Impact/Effort, đề xuất thí nghiệm, sắp lại thứ tự Content Plan + feed cho /task-plan. Dùng /quick-win."
---

# quick-win  (P04f — Prioritisation & Winning Strategy)

Cầu nối giữa **Plan** (P04) và **Execution** (P05). Plan nói *làm gì*; bước này nói **làm gì TRƯỚC**
để ra kết quả thật sớm, và **chiến lược nào để THẮNG** dự án (đạt KPI, đẩy conversion/revenue).
Chạy sau khi Plan đã SEN-approved, trước khi dồn sang triển khai.

**Claude đề xuất, người duyệt.** Output là bản chiến lược + thứ tự ưu tiên; PIC → SEN duyệt rồi mới
khoá vào Content Plan và giao qua `/task-plan`.

## Input
`/quick-win`. Đọc:
- `config.yaml` — KPI mục tiêu, `conversion_events`, business_model, team.
- Tab **Measurement** (KPI + baseline), **Foundation** (ưu tiên chiến lược, đối thủ),
  **Problem Pattern**, **Tracking** (keyword + vị trí hiện tại), **Content Plan**, **Technical Baseline**, **Offsite**.
- Số thực tế từ **Agency Analytics** (GSC: vị trí/impressions/CTR theo query & trang; GA4: conversion theo trang).
- **DataForSEO / SERP API** cho volume, KD, SERP hiện tại (chỉ khi thiếu, tôn trọng budget — CLAUDE.md §2, §6).
- `core/checklists/quick-win-signals.md` — danh mục tín hiệu để quét.

## Phần A — Quick Wins (impact nhanh, effort thấp)
Quét theo tín hiệu, mỗi cơ hội gắn **số thật** (vị trí, impressions, volume, trang):
1. **Keyword cannibalisation** — nhiều URL cùng tranh 1 query → gộp/định tuyến, chọn trang chủ lực,
   internal link về đúng trang. (GSC: 1 query → >1 trang luân phiên.)
2. **Low-hanging fruit / striking distance** — query ở **vị trí 5–20** có impressions & intent mua →
   nâng on-page + nội dung + internal link để đẩy vào top 3.
3. **Service / money-page on-page** — landing page dịch vụ (booking/lead) chưa tối ưu title/H1/meta/
   schema/CTA → sửa ngay (nhánh `/onpage`).
4. **Technical quick fix** — lỗi chặn index / tốc độ / schema thiếu trên trang doanh thu (từ Technical Baseline).
5. **GBP / Local quick win** — hồ sơ GBP thiếu, chưa có bài, NAP lệch (nếu business_model = local/booking).
6. **CTR quick win** — trang top 10 nhưng CTR thấp → viết lại title/meta hút click.

Mỗi Quick Win chấm **ICE** (Impact × Confidence ÷ Effort, thang 1–5) → xếp hạng. Ghi rõ:
cơ hội | trang/keyword | số chứng minh | hành động | skill chạy | ICE | người làm.

## Phần B — Winning Strategy (đường đạt KPI + revenue)
Từ khoảng cách KPI (Measurement) → chọn 2–4 trụ chiến lược, nêu *vì sao* và *đo bằng gì*:
- **Topical coverage** — phủ toàn cụm chủ đề/Problem Pattern để thành Category Leader.
- **Template / programmatic content** — bài theo khuôn (best-time-to-visit, food-guide, toplist,
  best-hotel-near-X…) nhân diện rộng, tốc độ cao.
- **Local SEO** — GBP, local landing, review, NAP, map pack (khi địa phương là nguồn booking).
- **Backlink / Authority** — digital PR, nguồn ngành, để lên nổi cụm cạnh tranh cao & tăng GEO citation.
- **GEO coverage** — nội dung được AI Search trích (answer chunk, entity, proof) cho prompt mua hàng.
- **CRO** — biến traffic thành booking/submit/purchase (feed P07a).

Mỗi trụ kèm **Experiments / tests để Win** — giả thuyết → cách thử → chỉ số thắng/thua → thời hạn
(ví dụ: "Programmatic 'best hotel near <landmark>' × 15 trang → +X booking-intent click trong 8 tuần;
thắng nếu ≥Y; thua thì đổi sang digital PR").

## Output
- `project/strategy/quick-win-and-strategy.md` — Phần A (bảng Quick Win đã xếp hạng) + Phần B
  (trụ chiến lược + experiments) + **thứ tự triển khai 30/60/90 ngày**.
- **Sắp lại Content Plan**: cập nhật cột Priority/thứ tự theo ICE (không đổi cấu trúc tab — CLAUDE.md §5).
- Ghi 1 dòng vào `project/decisions.md`.
- Nói rõ: PIC → **SEN** duyệt chiến lược trước khi `/task-plan` biến thành việc. Không gửi khách.

## Nối tiếp
`/content-month` (chạy theo thứ tự mới) · `/onpage` (Quick Win landing) · `/task-plan` (giao việc) ·
`/offpage-plan`, `/gbp-posts` (trụ Local/Backlink) · `/cro-audit` (trụ CRO).
