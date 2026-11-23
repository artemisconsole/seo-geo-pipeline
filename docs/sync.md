# Đồng bộ 2 chiều: Pipeline tổng ↔ Github dự án

Mô hình: **1 repo tổng (template)** `artemisconsole/seo-geo-pipeline` + **nhiều repo dự án** `seo-<slug>`
tạo từ template. Hai luồng tách bạch theo đúng ranh giới `core/` (chung) vs `project/` (riêng khách).

```
                 ┌─────────────────────────────┐
   ⬇ down-sync   │   seo-geo-pipeline (tổng)    │   ⬆ up-sync (feedback)
   core/ · skills│   = template, nguồn sự thật  │   bài học chung → PR
   ┌─────────────┴─────────────────────────────┴─────────────┐
   ▼                         ▼                                ▼
 seo-sukosol            seo-clientB                      seo-clientC
 (project/ riêng)       (project/ riêng)                 (project/ riêng)
```

## Cái gì chung, cái gì riêng
- **CHUNG (sync 2 chiều):** `core/`, `.claude/skills/`, `.claude/agents/`, `docs/`, `CLAUDE.md`,
  `scripts/`. Đây là skill, template, rule — cải tiến ở đâu cũng nên lan ra mọi nơi.
- **RIÊNG (không bao giờ sync):** `project/` (config, brand pack, decisions, keywords), `content/`,
  `.credentials/`, `data/`, `reports/`, `audits/`, `website/`. Dữ liệu khách — chỉ ở repo dự án private.

## ⬇ Down-sync — cập nhật skill/template từ tổng về dự án
Khi tổng ra skill/template mới, mỗi repo dự án kéo về:

```bash
bash scripts/sync-core.sh            # tạo branch sync/core-<ngày>, cập nhật phần CHUNG, mở PR
```

- Script chỉ chạm các path CHUNG; `project/` và dữ liệu khách **không bị đụng**.
- Ra một **Pull Request** trong repo dự án để PIC xem diff rồi merge (không ép tự merge).
- Tự động: workflow `.github/workflows/sync-core.yml` chạy hàng tuần (và bấm tay được) → tự mở PR.

## ⬆ Up-sync — đẩy bài học/cải tiến skill NGƯỢC về tổng
Khi một dự án rút ra bài học **áp dụng cho mọi dự án** (không phải việc riêng khách), đẩy về tổng bằng PR:

```bash
# /contribute-learning chuẩn bị diff rồi gọi:
bash scripts/contribute-learning.sh core/markets/vi-VN.md   # ví dụ: cải tiến rule dịch tiếng Việt
```

- Chỉ đẩy file CHUNG (skill, `core/*`), **không bao giờ** kèm dữ liệu khách.
- Mở PR vào repo tổng → maintainer duyệt → merge → lần down-sync sau mọi dự án đều nhận cải tiến.

## Vòng học skill dịch (ví dụ cụ thể user hỏi)
1. Dự án A dịch EN→Việt, SEN/khách sửa → `/learn` ghi vào `project/brand/learned.md` (riêng dự án).
2. Nếu bài học là **quy tắc dịch chung cho tiếng Việt** (không phải giọng riêng brand) → `/contribute-learning`
   rút nó thành sửa đổi cho `core/markets/vi-VN.md` hoặc skill `translate-content`, mở PR về tổng.
3. Maintainer merge ở tổng → dự án B, C down-sync → **skill dịch tiếng Việt giỏi lên cho tất cả**.

**Ranh giới vàng:** bài học *riêng brand* ở lại `project/brand/learned.md`; bài học *chung ngôn ngữ/ngành/kỹ thuật*
đi lên `core/` qua PR. Claude phân loại khi chạy `/contribute-learning` và hỏi nếu không chắc.
