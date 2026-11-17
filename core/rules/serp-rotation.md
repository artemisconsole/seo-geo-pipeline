# Nguyên tắc — SERP API nhiều key (luân phiên theo credit)

Agency nạp **~10 SERP API key**. Mỗi lần gọi SERP phải dùng key **còn credit**, tự chuyển khi một
key hết, để không gián đoạn và không phí.

## Key để ở đâu
`.credentials/credentials.yaml › serp_api_keys` (git-ignored, không commit, không in ra chat):
```yaml
serp_api_keys:
  - { label: key1, key: "..." }
  - { label: key2, key: "..." }
  # ... tối đa ~10
```

## Chọn key — `scripts/serp_key.py`
- Trả về **label** của key còn credit (không in giá trị key). Code gọi SERP nạp secret theo label.
- Đọc cache credit ở `data/serp/key-usage.json`:
  ```json
  { "key1": { "remaining": 0, "updated": "2026-11-17" },
    "key2": { "remaining": 820, "updated": "2026-11-17" } }
  ```
- Quy tắc chọn: còn `remaining >= threshold` thì dùng; key đã biết còn nhiều ưu tiên trước; key chưa
  rõ credit coi như dùng được (cần refresh). Hết sạch → dừng, báo PIC.

## Cập nhật credit (refresh)
- Nếu provider có endpoint account (ví dụ serpapi.com `/account` → `total_searches_left`), gọi để cập
  nhật `remaining` vào `key-usage.json`. Hoặc trừ dần sau mỗi lô gọi.
- Refresh đầu mỗi kỳ research, hoặc khi một key báo hết hạn mức.

## Bảo mật (CLAUDE.md §3)
- Không hard-code key vào repo/script/commit. Không in key ra chat/log.
- `key-usage.json` chỉ chứa label + số dư, **không** chứa key.
