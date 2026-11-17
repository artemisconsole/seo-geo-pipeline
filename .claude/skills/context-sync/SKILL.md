---
name: context-sync
description: "Tổng hợp ngữ cảnh dự án hàng tuần từ Slack (kênh dự án) + Gmail (email trao đổi khách) + decisions.md thành một file context trong repo, để bàn giao cho người mới không sót thông tin. Chỉ đọc, không trả lời/forward. Dùng /context-sync [since]."
---

# context-sync  (xuyên suốt — hỗ trợ Handover)

Gom thông tin rời rạc ngoài repo (chat, email) vào một nơi để `/handover` và người mới nắm nhanh.
GitHub dự án thành bản ghi đầy đủ nhất về ngữ cảnh.

## Input
`/context-sync [since=YYYY-MM-DD]` (mặc định 7 ngày). Đọc `config.yaml › context`
(slack_channel, client_emails, calendar_id).

## Các bước
1. **Slack** (connector): đọc tin nhắn kênh dự án trong kỳ → trích quyết định, yêu cầu, deadline,
   blocker, feedback. Bỏ qua tán gẫu.
2. **Gmail** (connector): đọc email với `client_emails` trong kỳ → trích yêu cầu/duyệt/khiếu nại của
   khách, cam kết đã hứa, ngày hẹn. **Chỉ đọc**, không trả lời, không forward.
3. **Google Calendar** (nếu có): meeting/deadline sắp tới liên quan dự án.
4. **Tổng hợp** + đối chiếu `project/decisions.md` (không lặp cái đã ghi).

## Output → `project/context.md` (append theo tuần, mới nhất trên cùng)
```
## Tuần <YYYY-MM-DD>
- Quyết định/yêu cầu khách: ... (nguồn: Slack/Email, ngày)
- Deadline & lịch sắp tới: ...
- Blocker/rủi ro: ...
- Feedback content → chuyển sang /learn: ...
```
Nếu có feedback về content → gợi ý chạy `/learn` để cập nhật `project/brand/learned.md`.

## Bảo mật (CLAUDE.md §3)
- Không chép mật khẩu/PII vào `context.md` hay commit. Không đưa nội dung Slack/Gmail ra dịch vụ ngoài.
- Chỉ tóm tắt nội bộ phục vụ dự án. Checkpoint: — (nội bộ, PIC đọc).
