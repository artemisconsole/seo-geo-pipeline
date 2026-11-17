---
name: gtm-verify
description: "Checklist kiểm tra sau khi người đã import container & publish: xác minh các event (Booking Success, Form Submit Success...) bắn đúng một lần, map thành conversion trong GA4, không trùng/không đếm sai. Claude hướng dẫn, không tự chạy production. Dùng /gtm-verify sau khi publish."
---

# gtm-verify  (P05 — sau khi import & publish)

Soát để chắc tracking mới chạy đúng trước khi tin vào số. Claude **không** tự thao tác trên
production; skill sinh checklist + diễn giải kết quả người gửi về.

## Input
`/gtm-verify` — đọc `gtm-tracking-plan.md`, `gtm-build-notes.md`, `config.yaml › analytics`.

## Các bước
1. **Sinh checklist verify** theo từng event đã thêm:
   - GTM **Preview (Tag Assistant)**: thực hiện hành vi (đặt phòng test, submit form test) → tag bắn
     đúng, đúng số lần (1), đúng tham số.
   - **GA4 DebugView / Realtime**: event xuất hiện, tên đúng, không trùng với event cũ.
   - **GA4 Admin**: event đã đánh dấu **Key event (conversion)** chưa.
   - Consent: tag chỉ chạy sau khi đồng ý (nếu có CMP).
2. **Nhận kết quả** người gửi (ảnh Preview/DebugView) → đối chiếu, chỉ chỗ sai (trùng, thiếu param,
   bắn khi chưa success).
3. **Chốt**: cập nhật tab Measurement (Status: tracking verified + ngày), ghi `project/decisions.md`.

## Output
`project/research/gtm-verify-checklist.md` + cập nhật Measurement. Báo PIC → SEN.
Chỉ khi verify xong, `/report` và `/forecast` mới được dùng các conversion này làm KPI.
