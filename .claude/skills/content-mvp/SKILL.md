---
name: content-mvp
description: "MVP viết content dự án NGAY từ một danh sách từ khoá (project/keywords.csv) mà KHÔNG cần Masterfile/Google Sheet — hợp dự án handover & quyền hạn chế. Với mỗi keyword chạy /research → /outline → /write, ghi markdown vào content/ và cập nhật content-log.md. Tôn trọng tier (Silver/Gold tập trung blog + on-page Services). Dừng ở cổng duyệt SEN. Dùng /content-mvp [YYYY-MM]."
---

# content-mvp  (bản MVP chạy được cho Content)

Con đường tối giản để **bắt đầu ra bài ngay** cho dự án handover: chỉ cần **brand pack + danh sách từ khoá**,
không cần Plan/Masterfile trên Sheet, không cần quyền CMS. Output là file trong repo để team đăng.

## Điều kiện
- `project/brand/*` đã có (nếu chưa → chạy `/brand-init` trước, dừng và báo).
- `project/keywords.csv` đã điền (mẫu: `project/keywords.example.csv`).
- `project/config.yaml` có `tier`, `languages`, `content.word_range`.

## Input
`/content-mvp [YYYY-MM]` (mặc định tháng hiện tại). Đọc `project/keywords.csv`, cột:
`keyword, intent, content_type, format, target_url, language, priority, notes`.
`content_type` + `format` route theo `core/formats/README.md`; thiếu thì Claude suy luận từ intent và ghi chú.

## Các bước (mỗi keyword, theo priority)
1. **/research** → `content/YYYY-MM/<slug>/research.md` (SERP top 10, PAA, AI Overview, volume/KD, nguồn AI
   đang trích). Cache lại, không gọi API trùng.
2. **/outline** → `content/YYYY-MM/<slug>/outline.md` (ghép lớp brand > format > content-type > industry >
   market; có answer chunk + entity + internal link URL thật).
3. **/write** → `content/YYYY-MM/<slug>/draft.md` (format The Sukosol: bảng meta + Draft_EN + Client
   Confirmation List). Chạy `content_lint` tới 0 ERR; gọi agent `content-reviewer` (đóng vai SEN).
4. Nếu `language` ≠ ngôn ngữ chính hoặc `config.languages.secondary` có giá trị → `/translate` thêm bản dịch.
5. Cập nhật `content/content-log.md`: keyword · slug · content_type · Status · ngày · link file.

## Theo tier (core/tiers.md)
- **Silver/Gold:** ưu tiên blog (Velocity/Authority) + nhắc on-page cho `target_url` trang Services nếu có.
- **Diamond/Platinum:** thêm gợi ý GEO sâu (prompt coverage) và liên kết sang CRO/UX khi phù hợp.

## Quyền hạn chế (core/automation-levels.md)
- `access.cms: none` → chỉ xuất **markdown/Doc deliverable**, không đăng; ghi rõ "team đăng".
- Có Google connector → đẩy thêm bản Google Doc; không có → markdown trong repo là đủ cho MVP.

## Cổng duyệt & ranh giới
- Mỗi bài dừng ở **SEN duyệt** (Status `Draft Ready`) trước khi ra khách. **Claude không gửi khách.**
- Không bịa dữ kiện (CLAUDE.md §2); fact ngoài `facts.yaml` → gắn tag `[NEED CLIENT CONFIRMATION]`/`[VERIFY]`.

## Output
Thư mục `content/YYYY-MM/<slug>/` cho từng bài + `content/content-log.md`. Ghi 1 dòng vào `project/decisions.md`.
