# Quick-Win signals — bảng quét cơ hội nhanh (dùng bởi /quick-win)

Mỗi tín hiệu: nguồn dữ liệu → điều kiện bắt → hành động → skill. Luôn gắn số thật, không đoán.

| # | Tín hiệu | Nguồn | Bắt khi | Hành động | Skill |
| --- | --- | --- | --- | --- | --- |
| 1 | Keyword cannibalisation | GSC (query → pages) | 1 query, ≥2 URL luân phiên rank | Chọn trang chủ lực, gộp/redirect phần còn lại, internal link về đúng trang | `/onpage`, `/tech-fix` |
| 2 | Striking distance | GSC + DataForSEO | Vị trí 5–20, impressions cao, intent mua | Bổ sung nội dung, on-page, internal link đẩy vào top 3 | `/onpage`, `/research`→`/write` |
| 3 | Money-page chưa tối ưu | Tech Baseline + GA4 | Landing dịch vụ (booking/lead) thiếu title/H1/schema/CTA | Tối ưu on-page + CTA + schema | `/onpage` |
| 4 | Technical blocker trên trang doanh thu | Tech Baseline / audit | Noindex nhầm, tốc độ kém, schema thiếu trên trang conversion | Fix kỹ thuật ưu tiên cao | `/tech-fix` |
| 5 | GBP / Local gap | GBP + config (local/booking) | Hồ sơ thiếu field, chưa đăng bài, NAP lệch | Hoàn thiện GBP, lịch bài, đồng bộ NAP | `/gbp-posts`, `/offpage-plan` |
| 6 | CTR thấp ở top 10 | GSC | Vị trí ≤10 nhưng CTR < benchmark cụm | Viết lại title/meta hút click | `/onpage` |
| 7 | Trang có traffic, 0 conversion | GA4 | Nhiều session, không booking/submit | Kiểm CTA/tracking (GTM), chuyển P07a | `/gtm-plan`, `/cro-audit` |
| 8 | Nội dung cũ rụng hạng | GSC (so kỳ) | Trang từng top nay tụt, impressions giảm | Refresh/revamp nội dung | `/onpage`, `/research` |

## Chấm ưu tiên — ICE
`Score = Impact × Confidence ÷ Effort` (mỗi yếu tố 1–5).
- **Impact**: ảnh hưởng tới KPI/doanh thu (booking, lead, revenue), không chỉ traffic.
- **Confidence**: mức chắc chắn dựa trên dữ liệu (có số GSC/GA4 = cao; suy đoán = thấp).
- **Effort**: công sức/độ phức tạp (giờ người, phụ thuộc kỹ thuật).

Quick Win đúng nghĩa = **Impact cao + Effort thấp**. Xếp hạng giảm dần, chạy top trước trong 30 ngày đầu.
