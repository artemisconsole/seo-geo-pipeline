# Checklist — Tracking quan trọng (GTM / GA4)

Danh sách event chuyển đổi cần có cho site hospitality / leadgen. `/gtm-plan` đối chiếu container
hiện có với danh sách này để tìm cái thiếu; `/gtm-build` dựng tag cho cái thiếu. Tên event GA4 giữ
`snake_case`, thống nhất với `config.yaml › analytics.conversion_events`.

| Event (GA4) | Ý nghĩa | Trigger gợi ý | Ưu tiên |
| --- | --- | --- | --- |
| `booking_success` | Đặt phòng thành công | Confirmation/thank-you page của booking engine, hoặc dataLayer `purchase`/`reservation_confirmed`; nếu booking ở domain OTA/engine riêng → cross-domain hoặc event từ engine | ⭐ Cao nhất |
| `booking_start` | Bắt đầu đặt phòng | Click "Book now" / "Check availability", mở booking widget | Cao |
| `form_submit_success` | Gửi form liên hệ/enquiry thành công | Thank-you page sau form, hoặc form success event (CF7 `wpcf7mailsent`, Gravity/Elementor submit) — **không dùng chỉ click nút** | ⭐ Cao nhất |
| `enquiry_form_view` | Xem trang/khối form | Trigger xem form (visibility) | Trung bình |
| `click_to_call` | Bấm số điện thoại | Click link `tel:` | Cao |
| `email_click` | Bấm email | Click link `mailto:` | Trung bình |
| `whatsapp_click` | Bấm WhatsApp/Zalo | Click link `wa.me` / `zalo.me` | Trung bình |
| `outbound_ota` | Rời site sang OTA | Click link ra booking.com/agoda/expedia... | Trung bình |
| `directions_click` | Bấm chỉ đường | Click link Google Maps / GBP | Trung bình |
| `brochure_download` | Tải brochure/menu/PDF | Click link `.pdf` | Thấp |
| `newsletter_signup` | Đăng ký nhận tin | Submit form newsletter | Thấp |
| `ai_referral_landing` | Vào site từ AI | Landing + referrer thuộc `analytics.ai_referrers` | Trung bình (GEO) |

## Nền tảng phải có trước
- **GA4 Configuration/Google Tag** bắn mọi trang; consent/CMP đúng trước khi tag chạy.
- **Mỗi conversion event map thành Key event (conversion)** trong GA4 Admin (việc này ở GA4, không ở GTM).
- Không nhân đôi: nếu engine đã gửi `purchase`/ecommerce, đừng tạo thêm tag trùng.

## Quy tắc
- Chỉ đo **success thật** (thank-you page / success event), không đếm click nút là "thành công".
- `booking_success` ở booking engine bên thứ ba → cần cross-domain hoặc lấy event từ engine; ghi rõ
  hạn chế trong Tracking Plan nếu không truy cập được engine.
- Mọi thay đổi container do người **import (Merge) + publish**; Claude không tự publish (CLAUDE.md §8).
