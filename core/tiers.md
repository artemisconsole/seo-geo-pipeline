# Tier dự án — nỗ lực & KPI theo hạng khách

Mỗi dự án có `tier` trong `project/config.yaml` (`platinum | diamond | gold | silver`). Tier quyết định
**workstream nào bật**, **KPI nào bắt buộc đạt**, và **mức tự động hoá/độ sâu**. Claude đọc tier để
biết dừng ở đâu là "đủ" và đâu là việc phải làm thêm.

## KPI — 2 nhóm
- **Must-hit (bắt buộc, để báo cáo thấy tăng trưởng):** Organic Traffic ↑ · AI Sessions ↑ ·
  Ranking bộ từ khoá dịch vụ cam kết ↑.
- **Nice-to-have (tốt nếu đạt):** Organic Leads · Organic Booking · AI Leads.

Hai must-hit đầu đạt được chủ yếu bằng **content blog hàng tháng + on-page cơ bản cho trang Services**.
Tier cao thêm must-hit về **chuyển đổi và GEO sâu**.

## Ma trận hạng

| Tier | Must-hit KPI | Workstream bật | Độ sâu GEO | Nỗ lực |
| --- | --- | --- | --- | --- |
| **Silver** | Traffic · AI Sessions · Ranking dịch vụ | Content blog hàng tháng · On-page cơ bản trang Services · Internal link | Extractable content (answer chunk, entity) | Thấp — content + on-page |
| **Gold** | + Organic Leads/Booking bắt đầu được theo dõi | + On-page sâu hơn · Technical cơ bản · GBP/Local nếu có · Internal link chủ động | + llms.txt · prompt coverage cơ bản | Trung bình |
| **Diamond** | + CRO · AI Conversion · AI Visibility | + CRO · Off-page/Authority · GTM tracking đầy đủ · GEO visibility | + Prompt-set tests · AI citation theo dõi | Cao |
| **Platinum** | + UX/UI optimization · AI Citation · full-funnel | Tất cả: Technical · Content velocity · Off-page · CRO · UX/UI audit · GEO đầy đủ | Đầy đủ: visibility + citation + conversion | Cao nhất |

**Nguyên tắc:** tier thấp tối ưu cho **tăng trưởng traffic + ranking** (ít chạm site); tier cao thêm
**chuyển đổi (CRO/AI conversion), UX/UI, và GEO sâu (prompt, visibility, citation)**. Không dồn việc
tier cao cho dự án tier thấp, và ngược lại không bỏ sót KPI chuyển đổi ở tier cao.

## Dùng ở đâu
- `/quick-win` xếp ưu tiên theo must-hit KPI của tier.
- `/task-plan` chỉ đề xuất task thuộc workstream tier đang bật.
- `/report` chấm tăng trưởng theo đúng nhóm KPI must-hit của tier.
- `/content-mvp` ở tier Silver/Gold tập trung blog + on-page Services.
