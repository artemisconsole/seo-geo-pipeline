---
name: gtm-plan
description: "Phân tích đo lường của một website: đọc container GTM JSON khách cấp + crawl các trang chuyển đổi (booking, form liên hệ, click-to-call) để liệt kê tracking đang có và event quan trọng còn thiếu (Booking Success, Form Submit Success...). Ra Tracking Plan làm đầu vào cho /gtm-build. Dùng khi user gõ /gtm-plan hoặc ở bước P05 Analytics."
---

# gtm-plan  (P05 — Analytics/GEO, bước trước /gtm-build)

Lập **Tracking Plan**: site đang đo gì, thiếu gì, cần thêm tag/trigger/variable nào. Không sửa
container ở bước này (việc đó ở `/gtm-build`).

## Input
`/gtm-plan` — kèm **container JSON** khách export (GTM › Admin › Export Container), để trong
`project/research/` hoặc `.credentials/`. Đọc `config.yaml › analytics` (gtm_container_id,
ga4_property_id, conversion_events, ai_referrers) và `project/brand/*`.
Nếu chưa có container JSON → ghi rõ "thiếu container, chỉ phân tích phía site" và tiếp tục.

## Các bước
1. **Đọc container JSON** (nếu có): liệt kê tag / trigger / variable hiện có, GA4 Config + các GA4
   Event tag, consent/CMP. Ghi ID tag để `/gtm-build` không trùng.
2. **Crawl trang chuyển đổi** (Firecrawl, JS-render qua Playwright nếu cần): trang Booking / Check
   availability, Contact/Enquiry, phòng/dịch vụ, footer. Tìm: `dataLayer` push hiện có, loại form
   (CF7 / Gravity / Elementor / custom) + selector, URL/engine đặt phòng, trang thank-you/confirmation,
   link `tel:` `mailto:` `wa.me`, link ra OTA.
3. **Đối chiếu** với `core/checklists/gtm-tracking.md` → ra danh sách event **đang có / thiếu / đặt sai**
   (ví dụ đếm click nút thay vì success thật).
4. **Ghi chú hạn chế**: booking ở engine bên thứ ba cần cross-domain; thiếu quyền GA4/GTM; CMP chặn.

## Output → `project/research/gtm-tracking-plan.md`
```
# Tracking Plan — <domain>
## Hiện trạng: GA4 config? · tag/trigger/variable đang có (id)
## Event theo checklist: Có | Thiếu | Đặt sai (lý do)
## Đề xuất thêm (cho /gtm-build): mỗi event → trigger + variable + tên GA4 event
## Hạn chế & cần quyền: ...
```
Cập nhật tab **Tracking** / **Measurement** (Status: cần bổ sung tracking). Ghi một dòng vào
`project/decisions.md`. Báo PIC → SEN. Không gửi khách.
