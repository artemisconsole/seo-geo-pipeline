# .claude/skills — danh mục lệnh

Mỗi thư mục là một skill (SKILL.md). Phase 1 đã dựng các skill content cốt lõi; các skill còn lại
(P02–P07) sẽ bổ sung ở Phase 3–5 theo lộ trình `docs/implementation-plan.md`.

## Đã có (Phase 1)
| Lệnh | Việc |
| --- | --- |
| `/new-project` | Tìm + map file Drive của khách, dựng config + brand pack nháp |
| `/research` | Nghiên cứu SERP/keyword/đối thủ/GEO cho một bài → research.md (cache) |
| `/outline` | Tạo outline SEO/GEO từ research + brand + format (không viết bài) |
| `/write` | Viết bài → Content Doc (Draft_EN + Confirmation List), lint + review |
| `/translate` | Dịch tự nhiên EN → ngôn ngữ đích, giữ cấu trúc, đổi internal link |
| `/content-month` | Điều phối cả tháng theo Content Plan + cổng duyệt |
| `/learn` | Ghi bài học từ feedback khách/SEN vào brand pack |

## MVP content — chạy ngay cho dự án handover
| Lệnh | Việc |
| --- | --- |
| `/brand-init` | Tạo Brand Guideline + brand pack từ thông tin thương hiệu mẫu (không cần Drive) → mở khoá viết bài |
| `/content-mvp` | Viết content ngay từ `project/keywords.csv` (không cần Masterfile): research → outline → write theo tier |

## Chiến lược & vận hành (bổ sung)
| Lệnh | Việc |
| --- | --- |
| `/quick-win` | Sau Plan (P04f): tìm Quick Win (ăn thịt từ khoá, striking distance, on-page money-page) + Winning Strategy (phủ nội dung, content template, local, backlink, GEO, CRO) → xếp ưu tiên ICE, sắp lại Content Plan |
| `/contribute-learning` | Đẩy bài học CHUNG (skill, core/*) từ dự án ngược về repo tổng bằng PR (vd cải thiện skill dịch 1 ngôn ngữ) |
| `/gtm-plan` | Phân tích site + container JSON → tìm tracking thiếu (Booking/Form Submit...) |
| `/gtm-build` | Dựng container JSON merge thêm tag thiếu (để người import, không tự publish) |
| `/gtm-verify` | Checklist Preview/DebugView xác minh event bắn đúng |
| `/task-plan` | Audit KPI → đề xuất Task tuần/tháng → đẩy Asana (section Proposed, chờ duyệt) |
| `/context-sync` | Tổng hợp Slack + Gmail + Calendar → `project/context.md` cho bàn giao |

## Subagent (.claude/agents)
`serp-researcher` · `competitor-analyst` · `content-reviewer` · `tech-auditor`

## Sẽ bổ sung
- P02: `/p02-access` — P03: `/p03-foundation`, `/p03-market` — P04: `/p04a-patterns`,
  `/p04b-tracking`, `/p04c-content-plan`, `/p04d-tech-baseline`, `/p04e-offsite`, `/forecast`,
  `/p04e-review`, `/p04-to-masterfile`
- P05: `/onpage`, `/tech-audit`, `/tech-fix`, `/html`, `/gbp-posts`, `/offpage-plan`, `/llms-txt`,
  `/site-inventory`, `/uiux-audit`  (gtm-plan/build/verify đã có ở mục trên)
- P06–P07: `/analytics`, `/health-check`, `/report`, `/diagnose`, `/geo-visibility`, `/geo-gap`,
  `/geo-fix-mentions`, `/cro-audit`, `/geo-expand`, `/meeting-prep`, `/handover`

Mapping đầy đủ: `docs/pipeline.md`.
