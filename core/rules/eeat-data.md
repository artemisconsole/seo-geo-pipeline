# Rule EEAT — số liệu & nguồn uy tín (ranking, toplist, mọi thống kê)

Mục tiêu: bài xếp hạng được Google + được AI trích, nhờ **dẫn chứng số liệu chính thống** thay vì khẳng
định cảm tính. Lỗi hay gặp: xếp "nước A > nước B", "top 5", "lớn nhất" mà **không có số trong thân bài**.

## Luật cứng
1. **Không xếp hạng / khẳng định định lượng nếu không có số có nguồn.** Mọi thứ tự ("lớn nhất", "top…",
   "nhanh hơn") phải tựa trên số liệu + nguồn + năm. Không có số → để `[STAT NEEDED: ...]`, không xếp hạng.
2. **Ưu tiên nguồn GỐC (primary) hơn thứ cấp:**
   - Thương mại/xuất nhập khẩu: **UN Comtrade** (qua Alexandria `comtradeplus-un-org`), **WTO**, cơ quan
     thống kê / Export Promotion Bureau quốc gia.
   - Vĩ mô: World Bank, IMF, OECD, Eurostat. Ngành: hiệp hội ngành, báo cáo có tên + năm.
   - Blog/secondary chỉ để tìm đường tới nguồn gốc, rồi **trích nguồn gốc**, không trích lại blog.
3. **Ghi rõ phạm vi đo.** Thương mại: mã **HS** (vd apparel = HS 61 dệt kim + HS 62 dệt thoi), chiều
   (export/import), đối tác (World), đơn vị (USD FOB), **năm**. Khác phạm vi = khác con số.
4. **Nêu caveat phương pháp khi có** — đây chính là tín hiệu EEAT mạnh:
   - **Re-export:** Germany, Italy, Hong Kong, Netherlands là hub phân phối → xuất khẩu gộp bị thổi lên,
     không phản ánh sản xuất thật.
   - **Nước không báo cáo:** vd Bangladesh KHÔNG nộp UN Comtrade → số lấy từ ước tính WTO/EPB, ghi rõ "ước tính".
   - **Ước tính vs báo cáo**, mirror data, năm chưa đầy đủ.
5. **Mỗi số trong thân bài có nguồn inline:** "about US$152.5 billion in 2023 (UN Comtrade)". Số cũ hơn
   12 tháng → kiểm lại trước khi tái dùng.
6. **Bảng số liệu dẫn nguồn** cho bài ranking/toplist, kèm 1 dòng nguồn ngay dưới bảng (nguồn · phạm vi · năm).
7. **Tín hiệu EEAT khác (bắt buộc với bài ranking/stat):** mục **Sources** cuối bài (nguồn gốc + ngày truy
   cập), dòng **Last reviewed** (ngày), **Reviewed by** (vai trò người duyệt). Không bịa số, không bịa nguồn.

## Cách lấy số (trong Claude Code)
- `alexandria_library_read` → `comtradeplus-un-org` / `trade-statistics/trade_data`:
  `reporter_code` (mã nước, phẩy ngăn), `cmd_code` (mã HS, vd 61 rồi 62), `flow_code` X (export) / M (import),
  `partner_code` 0 (World), `period` (năm), `include_desc` true. Nghi năm chưa có → `data_availability` trước.
- Reporter thiếu trong kết quả = nước đó không báo cáo kỳ đó → nêu rõ, lấy nguồn khác có tên.
- Cache số đã lấy vào `data/stats/<topic>.json` để `/outline` + `/write` dùng lại (tiết kiệm, nhất quán).

## Ranh giới brand
Số liệu ngành dùng được **chỉ khi** có nguồn chính thống + năm. Một số brand (vd CWG) cấm bình luận
chính trị/thuế/so sánh quốc gia: trình bày **số liệu trung lập + caveat** thì được, dựng luận điểm
"nên chọn nước A thay nước B" thì **không**.
