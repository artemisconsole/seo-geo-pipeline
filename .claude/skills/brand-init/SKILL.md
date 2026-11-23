---
name: brand-init
description: "Tạo Brand Guideline + brand pack từ THÔNG TIN THƯƠNG HIỆU MẪU người dùng cung cấp lúc bắt đầu/handover dự án (không cần Drive). Sinh guideline đầy đủ theo khuôn core, rồi rút gọn thành project/brand/* (brand.md, facts.yaml, rules.yaml, internal-links.csv, glossary.csv) để /outline + /write dùng ngay. Dùng /brand-init khi onboard một brand mà chưa có brand pack."
---

# brand-init  (P01 — tạo Brand Guideline cho MVP content)

Biến thông tin thương hiệu thô (user dán, hoặc file `project/brand/_input.md`, hoặc profile/website) thành
**brand pack chạy được**. Đây là bước mở khoá MVP content cho dự án handover không có file Drive sẵn.

## Input
`/brand-init`. Nguồn thông tin, ưu tiên theo thứ tự:
1. Text user dán trong chat (thông tin thương hiệu mẫu).
2. `project/brand/_input.md` (nếu user bỏ sẵn).
3. Website/profile khách — crawl bằng Firecrawl nếu có URL.

Đọc kèm: `core/doc-templates/brand-guideline-template.md`, `core/industries/<industry>.md`
(theo `config.yaml › project.industry`), `core/markets/<locale>.md`, `config.yaml › languages`.

## Các bước
1. **Dựng Brand Guideline đầy đủ** theo khuôn core (9 mục + Phụ lục A/B/C) vào
   `project/brand/brand-guideline.md`. Điền tối đa từ thông tin có; phần suy luận ghi rõ là đề xuất.
2. **Rút gọn thành brand pack** (CLAUDE.md §4, README brand):
   - `brand.md` — voice (3–6 tính từ + ví dụ câu), tone theo loại trang, positioning, differentiators,
     boilerplate, audience/ICP, content pillar.
   - `facts.yaml` — `approved:` (dữ kiện có nguồn/khách xác nhận) và `verify:` (chưa chứng thực → **bị chặn**,
     không được khẳng định). Không bịa số; thiếu thì để trống + ghi chú.
   - `rules.yaml` — off_limits, banned_words → superlative_swaps, disclaimers theo loại nội dung,
     language/style (chính tả market, cách viết tên công ty/sản phẩm, số), min_internal_links.
   - `internal-links.csv` — topic → URL thật (lấy từ website/profile; không có thì để trống, không bịa URL).
   - `glossary.csv` — thuật ngữ/tên riêng + cách viết chuẩn (+ bản dịch nếu đa ngôn ngữ).
   - `learned.md` — tạo rỗng (sẽ tích luỹ qua `/learn`).
3. **Đánh dấu khoảng trống:** mọi dữ kiện cần khách xác nhận → đưa vào **Items to Resolve** (Phụ lục B →
   `facts.yaml verify`) và liệt kê 1 danh sách ngắn "cần khách xác nhận" cuối guideline.
4. Ghi 1 dòng vào `project/decisions.md`. Báo **SEN duyệt** brand pack trước khi viết bài.

## Quy tắc
- **Không bịa fact brand** (giá, chứng nhận, số liệu, lịch sử) — không có nguồn thì để `verify:` (bị chặn)
  hoặc để trống, không đoán. Tuân CLAUDE.md §2.
- Dữ liệu khách thật chỉ ở repo dự án private, không commit lên template chung.
- Guideline là bản nháp do AI dựng → **người (SEN/AM) rà và khách xác nhận** phần facts trước khi dùng.

## Output & nối tiếp
`project/brand/brand-guideline.md` + brand pack `project/brand/*`. Sau khi SEN duyệt → chạy
`/content-mvp` (viết từ danh sách từ khoá) hoặc `/outline` → `/write` cho từng bài.
