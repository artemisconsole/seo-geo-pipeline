# Mức tự động hoá theo quyền truy cập dự án

Không phải dự án nào Claude cũng được toàn quyền. `project/config.yaml › access` khai báo quyền; từ đó
biết task nào Claude **tự làm trọn**, task nào chỉ **đề xuất để người áp dụng**.

## Khai báo quyền (config)
- `access.cms`: `full` (sửa/patch được) · `limited` (chỉ vài vùng, ví dụ blog) · `none` (không sửa site).
- `access.tracking`: `full` · `readonly` · `none` (GA4/GSC/GTM).
- `access.can_edit_pages`: true/false.

## Task AI hỗ trợ (MVP giai đoạn này) — và mức theo quyền

| Task | Cần | `cms: none` | `cms: limited` | `cms: full` |
| --- | --- | --- | --- | --- |
| **Viết content dự án** (blog, service copy) | brand pack + keywords | Giao bản Doc/markdown để team đăng | Đăng vùng được phép (blog) | Đăng/patch trực tiếp |
| **Phân tích internal link** | crawl (Firecrawl) | Báo cáo đề xuất (read-only) | Áp dụng vùng được phép | Áp dụng trực tiếp |
| **On-page trang Services (chuyển đổi)** | trang + facts | Đề xuất title/meta/H1/schema/CTA | Sửa vùng được phép | Sửa trực tiếp |
| **Tạo File theo Template** (Drive/Sheet/Docs) | Google connectors | Có (ngoài site) | Có | Có |
| **Check tracking GA4 / G-Tag** | Agency Analytics / GTM JSON | Báo trạng thái + JSON đề xuất | + import khi được cấp | + publish khi được cấp |
| **Performance check** | analytics connectors | Có (read-only) | Có | Có |
| **Monthly report** | analytics connectors | Có | Có | Có |

## Nguyên tắc
- **Quyền thấp không chặn giá trị:** `cms: none` vẫn chạy được MVP content + phân tích + report; Claude
  chỉ chuyển từ *tự áp dụng* sang *giao deliverable để người áp dụng*.
- Việc chạm production (patch site, publish GTM) **chỉ khi** `access` cho phép — nếu không, dừng ở đề xuất
  và nói rõ cần ai thao tác (CLAUDE.md §3 bảo mật vẫn áp dụng).
- Ghép với `tier`: tier quyết định *làm gì*; access quyết định *Claude tự làm tới đâu*.
