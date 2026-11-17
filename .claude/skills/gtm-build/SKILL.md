---
name: gtm-build
description: "Dựng file container GTM JSON để THÊM các tag còn thiếu theo Tracking Plan (GA4 event tag cho Booking Success, Form Submit Success, click-to-call...). Giữ nguyên tag hiện có, chỉ bổ sung, xuất JSON để người import (Admin › Import Container › Merge). Claude không tự publish. Dùng /gtm-build sau /gtm-plan."
---

# gtm-build  (P05 — sau /gtm-plan)

Sinh container JSON **merge-safe**: chỉ thêm variable/trigger/tag cho các event thiếu trong
`gtm-tracking-plan.md`, không đụng tag hiện có.

## Input
`/gtm-build` — đọc `project/research/gtm-tracking-plan.md` + container JSON gốc (nếu có) +
`config.yaml › analytics` (ga4_property_id / measurement_id, conversion_events).

## Các bước
1. **Lấy danh sách event thiếu** từ Tracking Plan. Với mỗi event dựng bộ tối thiểu:
   - **Variables** cần (DLV, Auto-Event, Element URL/visibility, form selector…).
   - **Trigger** đúng loại (thank-you page URL cho `booking_success`/`form_submit_success`; form
     success event cho CF7/Gravity; Click link cho `tel:`/`mailto:`/OTA).
   - **Tag**: GA4 Event, `event_name` = tên trong checklist, gắn GA4 Config/Measurement ID.
2. **Giữ ID hiện có**: không sửa/không xoá tag có sẵn; dùng tên tiền tố `SEO - ` cho tag mới để dễ nhận.
3. **Xuất** `project/research/gtm-container-merge.json` đúng schema export của GTM (exportFormatVersion,
   containerVersion, tag/trigger/variable). Nếu không có container gốc → container mới chỉ gồm phần thêm.
4. **Viết hướng dẫn import** + mapping event → cần set **Key event (conversion)** bên GA4 Admin.

## Output
- `project/research/gtm-container-merge.json` (để người **import Merge** + preview + publish).
- `project/research/gtm-build-notes.md`: danh sách tag thêm, cách import, event cần đánh dấu conversion.
- Cập nhật tab Tracking/Measurement (Status: chờ import & verify). Ghi `project/decisions.md`.

**Chặn cứng:** Claude **không** tự publish container, không tự bật tag trên production. Dừng, bàn giao
cho người import. Báo PIC → SEN.
