---
name: task-plan
description: "Audit tiến độ dự án so với KPI (tab Measurement, số từ Agency Analytics) + trạng thái Content/Technical/Offsite, rồi đề xuất danh sách Task tuần hoặc tháng để đạt KPI và đẩy lên Asana (section chờ duyệt). Claude đề xuất, người duyệt trước khi giao. Dùng /task-plan weekly | monthly."
---

# task-plan  (P06 — nhịp tuần/tháng)

Biến khoảng cách KPI thành việc cụ thể, có thứ tự ưu tiên, đẩy sang Asana để team làm. **Claude
không tự giao việc cho người thật**: task vào section "Proposed" chờ PIC/SEN duyệt.

## Input
`/task-plan weekly` hoặc `/task-plan monthly`. Đọc `config.yaml › asana` (project_id,
section_proposed), `config.yaml › analytics`, tab **Measurement** (KPI + actual vs forecast),
**Content Plan** (Status), **Technical Baseline**/Fix List, **Offsite**, `project/decisions.md`.

## Các bước
1. **Lấy số thực tế** từ Agency Analytics (GSC/GA4) cho kỳ → so với KPI/forecast ở tab Measurement.
   Số do connector, không nhẩm (CLAUDE.md §2).
2. **Tìm gap & nguyên nhân**: traffic/clicks/conversion dưới mục tiêu ở cụm nào; bài nào kẹt Status;
   technical issue ưu tiên cao chưa xong; offsite/GBP trễ lịch.
3. **Sinh Task** — mỗi task: `title` ngắn, mô tả + lý do (gắn số), `priority` (High/Med/Low),
   `role` gợi ý (PIC/JR/SEN/AM), `due` trong kỳ. Gom theo nhóm: Content · Technical · Offsite/Local ·
   GEO · Tracking · Report.
4. **Đẩy Asana** (connector): tạo task trong `project_id`, section **Proposed**; không assignee thật,
   không due cứng cho người khác khi chưa duyệt. Nếu task kỳ trước còn mở → cập nhật, không nhân đôi.
5. **Báo cáo tiến độ**: tóm tắt đã làm gì / còn gì / đề xuất tuần-tháng tới.

## Output
- Task trong Asana (section Proposed) + `reports/task-plan-<kỳ>.md`.
- Cập nhật `project/decisions.md`. Báo PIC → SEN duyệt rồi mới assign/giao.
Không gửi gì cho khách.
