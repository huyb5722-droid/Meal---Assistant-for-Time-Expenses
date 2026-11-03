# MATE — app ăn uống thông minh cho sinh viên

MATE ưu tiên một khó khăn thực tế của sinh viên ở trọ: **tìm được bữa ăn vừa túi tiền, vừa với thời gian và thiết bị nấu đang có**. Web xếp món theo ngân sách, lịch bận/rảnh và điều kiện nấu; các tính năng tủ nguyên liệu, chi tiêu và tìm địa điểm hỗ trợ quyết định đó.

## Mở MATE trên máy tính

1. Cài **Node.js 18 trở lên** nếu máy chưa có. Trang tải chính thức: [nodejs.org](https://nodejs.org/).
2. Mở Visual Studio Code và chọn **File → Open Folder…**.
3. Chọn đúng thư mục `outputs/MATE`.
4. Cách đơn giản nhất: mở thư mục trong File Explorer rồi nhấp đúp `Run-MATE.bat`. Tệp sẽ mở máy chủ và trình duyệt cho bạn.
5. Hoặc trong VS Code, chọn **Terminal → New Terminal**, nhập `npm start` rồi nhấn Enter.
6. Khi Terminal hiện `MATE đang chạy tại http://127.0.0.1:4173`, mở địa chỉ đó trong trình duyệt.

**Nếu đăng nhập báo chưa kết nối được máy chủ:** đóng các cửa sổ Live Server/Preview đang mở cho MATE, sau đó nhấp đúp `Run-MATE.bat`. Chờ đến khi cửa sổ máy chủ báo MATE đã chạy rồi tải lại trang. Mở trang bằng Live Server hoặc `file://` chỉ tải giao diện và không chạy API tài khoản.

Không cần cài thêm thư viện bằng npm. MATE dùng Node.js tích hợp sẵn để chạy máy chủ. Tệp `.env` và mã quản trị **không bắt buộc** để mở app, đăng ký tài khoản, lên thực đơn hoặc ghi chi tiêu.

## Có gì trong app

- Trang tổng quan với ngân sách, món hôm nay, gợi ý tiết kiệm và lối tắt.
- Lịch thực đơn tuần, xếp nhiều món trong một ngày và cuộn riêng danh sách món của từng ngày; đánh dấu ngày bận/rảnh để ưu tiên món nhanh hoặc món chuẩn bị trước/nấu nhiều phần.
- Ngân sách tháng có thể chọn số bữa MATE gợi ý mỗi ngày; web chia ngân sách thành mức tham khảo cho từng bữa và điều chỉnh theo số người ăn.
- 203 công thức song ngữ, có định lượng, các bước nấu và ảnh món ăn được lưu sẵn trong ứng dụng.
- Tủ hơn 50 nguyên liệu và gia vị, tìm kiếm và chọn nhiều nguyên liệu cùng lúc, tìm món từ nguyên liệu có sẵn và xem món còn thiếu gì.
- Túi mù flashcard để rút nguyên liệu và nhận gợi ý món ăn.
- Theo dõi khoản chi, ngân sách tháng và cảnh báo khi gần hoặc vượt mức.
- Tìm chợ, cửa hàng thực phẩm, siêu thị, quán ăn qua Google Maps; ưu tiên địa điểm gắn với món và nguyên liệu còn thiếu trong thực đơn.
- Lọc quán theo mức giá tổng quát do Google cung cấp, khoảng cách từ vị trí hiện tại và trạng thái đang mở; hiển thị xếp hạng, số lượt đánh giá và giờ mở cửa khi Google có dữ liệu.
- Đưa ra các từ khóa tìm món sinh viên thường chọn và cho người dùng báo tình trạng đông khách hoặc đề xuất sửa thông tin. Báo cáo đông chỉ hiển thị sau tối thiểu 3 phiên người dùng khác nhau trong 2 giờ; đề xuất sửa được lưu chờ kiểm tra, không tự động thay đổi thông tin Google.
- MATE đo thời gian tìm đến lúc người dùng bấm “Tôi chọn nơi này”, số lượt mở gợi ý và phản hồi độ chính xác. Dữ liệu đo không lưu tọa độ GPS hay từ khóa tìm; các phản hồi có tên/mã địa điểm liên quan.
- Hồ sơ khẩu vị, sức khỏe, số người ăn, dị ứng/nguyên liệu cần tránh, điều kiện nấu nướng và cỡ chữ; các lựa chọn được dùng để lọc hoặc xếp hạng gợi ý.
- Chi phí món ăn được ước tính theo số phần và số người ăn, điều chỉnh thứ tự gợi ý theo ngân sách; chi tiết món giải thích vai trò dinh dưỡng theo nhóm nguyên liệu. Giá chỉ là tham khảo, không phải báo giá trực tiếp hay dữ liệu giá theo thời gian thực.
- Mascot có thể kéo đến chỗ thuận tay; chạm mascot để mở nhanh các trang.
- Tạo tài khoản, đăng nhập, đồng bộ hồ sơ; hỗ trợ giao diện tiếng Việt và tiếng Anh.

## Tài khoản và dữ liệu

Khi đăng ký, tên, email và hồ sơ trong app được gửi về máy chủ đang chạy MATE. Mật khẩu được băm bằng `scrypt` trước khi lưu; máy chủ không lưu mật khẩu dạng đọc được. Dữ liệu máy chủ được ghi trong `data/mate-server-data.json` (hoặc thư mục do `MATE_DATA_DIR` chỉ định) và không được phục vụ công khai bởi web server.

Khi chạy trên máy cá nhân, máy tính của bạn đang là máy chủ và chỉ trình duyệt trên máy đó kết nối được theo cấu hình mặc định. Muốn người khác dùng qua Internet, quản trị viên cần triển khai Node.js lên máy chủ có HTTPS và ổ đĩa lưu trữ bền vững. Không đưa tệp `.env` hoặc mã quản trị lên GitHub.

## Đưa MATE lên Internet bằng Render

Các bước dưới đây tạo một website có đường dẫn công khai dạng `mate-...onrender.com`. Render là một lựa chọn dễ bắt đầu; bạn cũng có thể dùng dịch vụ lưu trữ Node.js khác nếu dịch vụ đó hỗ trợ máy chủ Node và ổ lưu trữ bền vững.

1. Tạo tài khoản GitHub và một repository mới. Tải **các tệp bên trong thư mục `outputs/MATE`** lên repository (trong đó phải thấy `package.json`, `server.js`, `index.html` ở cấp đầu tiên). Để repository ở chế độ riêng tư nếu bạn muốn.
2. Tạo tài khoản Render, kết nối GitHub, chọn **New → Web Service**, rồi chọn repository MATE.
3. Điền cấu hình: **Build Command** là `npm install`; **Start Command** là `npm start`. Nếu Render hỏi thư mục gốc, để trống khi repository chứa trực tiếp các tệp MATE.
4. Trong **Advanced → Environment Variables**, tự tạo hai biến `HOST` với giá trị `0.0.0.0` và `MATE_ADMIN_TOKEN` với một chuỗi bí mật dài, khó đoán. Hai biến này **không có sẵn trong README hoặc trong danh sách tệp**; bạn nhập chúng ở Render Dashboard. Nếu dịch vụ đã tạo rồi: mở dịch vụ MATE → **Environment** ở thanh bên → **+ Add Environment Variable**. Thêm mỗi biến thành một dòng riêng. `MATE_ADMIN_TOKEN` là mã riêng cho API quản trị, không phải mật khẩu tài khoản người dùng. Không đăng mã này lên GitHub hay gửi cho người dùng. Render tự cung cấp biến `PORT`, bạn không cần thêm.
5. Trong phần thêm ổ lưu trữ (**Persistent Disk**), đặt **Mount Path** là `/var/data`. Sau đó thêm biến `MATE_DATA_DIR` với giá trị `/var/data`. Máy chủ sẽ ghi dữ liệu tài khoản vào ổ này.
6. Tạo dịch vụ và chờ Render báo **Live**. Mở đường dẫn `onrender.com` mà Render cấp để xem website.

**Bật dữ liệu địa điểm chi tiết:** Trong Google Cloud, bật Places API (New), tạo khóa API rồi thêm ở Render Dashboard → dịch vụ MATE → **Environment** với tên `MATE_GOOGLE_MAPS_API_KEY`. Giới hạn khóa cho Places API và đặt cảnh báo/quota. Khóa này chỉ ở máy chủ. MATE yêu cầu thêm mức giá tổng quát, điểm và số lượng đánh giá, giờ hoạt động, cùng vị trí để hỗ trợ bộ lọc; Google xếp một số trường như `priceLevel`, `rating`, `userRatingCount`, `currentOpeningHours` và `regularOpeningHours` ở bậc Text Search Enterprise. Việc gọi các trường này có thể làm thay đổi chi phí API; kiểm tra bảng giá và mức sử dụng trong Google Cloud trước khi mở dịch vụ cho nhiều người. Google yêu cầu website có Điều khoản sử dụng và Chính sách quyền riêng tư công khai khi dùng Places API.

**Chi phí và dữ liệu:** Render cấp đường dẫn `onrender.com` và HTTPS cho dịch vụ web. Tuy nhiên, ổ lưu trữ bền vững chỉ dùng được với máy chủ trả phí; gói miễn phí không giữ được tệp dữ liệu qua lần khởi động/triển khai lại. Render tính phí ổ đĩa theo dung lượng và tính riêng máy chủ, vì vậy hãy xem giá đang hiển thị trong tài khoản trước khi xác nhận. Ổ đĩa gắn với một máy chủ đơn; bản MATE hiện tại phù hợp làm bản trình diễn/nhóm nhỏ, chưa phải cấu hình cơ sở dữ liệu để mở rộng lượng người dùng lớn.

Bạn có thể dùng địa chỉ `onrender.com` trước. Nếu muốn tên miền riêng như `mateapp.vn`, cần mua tên miền, thêm tên miền đó trong phần **Custom Domains** của Render và làm theo hướng dẫn cấu hình DNS trên màn hình.

Trước khi mời người dùng thật đăng ký, hãy bổ sung trang Chính sách quyền riêng tư và thông tin liên hệ của nhóm phát triển, vì tên, email và hồ sơ người dùng được gửi đến máy chủ MATE.

### Tạo mã quản trị (không bắt buộc)

Mã này chỉ để gọi API thống kê/xuất dữ liệu quản trị, không phải mã đăng nhập cho người dùng.

1. Trong VS Code Explorer, sao chép `.env.example` và đổi tên bản sao thành `.env`.
2. Mở `.env` và điền một chuỗi riêng vào `MATE_ADMIN_TOKEN=`.
3. Lưu tệp, dừng máy chủ bằng `Ctrl+C`, rồi chạy lại `npm start`.

Các đường dẫn quản trị là `GET /api/admin/summary` và `GET /api/admin/export`; gửi mã trong header `Authorization: Bearer <mã-quản-trị>`. Đừng chia sẻ mã này trong form, ảnh chụp màn hình hoặc tin nhắn công khai.

## Lưu ý về Maps, giá và sức khỏe

- Bản đồ tương tác trong trang “Quanh bạn” cần bật **Maps Embed API** và đặt `MATE_GOOGLE_MAPS_EMBED_KEY` trong biến môi trường của máy chủ (Render: **Environment**). Nếu chưa có khóa này, MATE giữ bản đồ minh họa và vẫn mở được Google Maps qua nút tìm kiếm.
- Khóa nhúng bản đồ được gửi đến trình duyệt để tải iframe. Hãy tạo khóa riêng chỉ dùng cho Maps Embed API, giới hạn API key vào Maps Embed API và đặt website restrictions cho tên miền triển khai của bạn. Không dùng khóa quản trị hoặc khóa Places phía máy chủ làm khóa nhúng.
- Khi chạy local, cho phép referrer `http://localhost:4173/*`; trên Render, thêm hostname HTTPS chính xác của dịch vụ. Sau khi thêm biến môi trường, khởi động lại dịch vụ để MATE tải cấu hình mới.
- Nếu chưa cấu hình Places API, nút Google Maps mở kết quả tìm kiếm theo khu vực. Google cung cấp địa điểm, giờ mở cửa, đánh giá và mức giá tổng quát; giờ có thể thay đổi và mức giá không phải giá từng món. Không coi đánh giá Google là kiểm chứng độc lập của MATE.
- Để xem số liệu tìm kiếm và các đề xuất sửa thông tin, dùng `GET /api/admin/summary` và `GET /api/admin/export` với `MATE_ADMIN_TOKEN`. Tóm tắt có số lượt tìm, tỷ lệ tìm dẫn đến bấm chọn và thời gian trung bình đến lựa chọn; tỷ lệ phản hồi “đúng” là ý kiến người dùng, không phải kiểm chứng độc lập. Tệp xuất có `nearbyFeedback`, gồm thời gian tìm đến lựa chọn, lượt chọn, phản hồi đúng/sai, báo cáo đông và các đề xuất đang chờ xem xét. Báo cáo đông được giới hạn một lượt cho mỗi phiên trong 2 giờ và chỉ hiện công khai sau ít nhất 3 phiên khác nhau.
- Giá trong danh mục nguyên liệu và món ăn hiện là ước tính để lập kế hoạch, không phải báo giá trực tiếp hay giá theo thời gian thực. Google Places có thể cung cấp mức giá tổng quát cho một số địa điểm, thường là quán ăn, chứ không phải giá của từng nguyên liệu.
- Công thức hiện phân nhóm vai trò nguyên liệu như tinh bột, đạm, rau củ, trái cây, sữa và gia vị. Đây là mô tả định tính, **không phải** số kcal, gram đạm hay phân tích vi chất; không dùng thay tư vấn y tế hoặc dinh dưỡng.
- Cảnh báo tránh nguyên liệu dựa trên nhãn công thức mẫu. Người bị dị ứng nặng cần kiểm tra nhãn sản phẩm và xác nhận thành phần với nơi bán.
- Ảnh món ăn được lưu trong ứng dụng, có thêm minh họa an toàn theo nhóm món; ảnh hỏng hoặc chưa tìm được ảnh phù hợp sẽ tự chuyển sang minh họa thay vì hiện biểu tượng ảnh lỗi.

### Ảnh món ăn

Ảnh được lưu cục bộ trong `assets/recipes` để hiển thị ổn định khi mất mạng. Những món có ảnh chụp phù hợp dùng ảnh thật; món chưa tìm được ảnh đáng tin cậy tiếp tục dùng minh họa theo nhóm. Ảnh Commons có tên tác giả, giấy phép và liên kết nguồn trong giao diện. Ảnh chỉ được ghép với món cùng loại sau khi kiểm tra nội dung, tránh tự động dùng kết quả chỉ vì tên gần giống.

## Cấu trúc tệp

- `index.html` — bố cục các trang và biểu mẫu.
- `styles.css` — màu sắc, chữ, responsive và mascot.
- `data.js` — danh mục nguyên liệu và công thức mẫu.
- `app.js` — điều hướng, tìm kiếm, lên lịch, tính toán và song ngữ.
- `server.js` — máy chủ web, tài khoản và lưu dữ liệu.
- `data/` — tự tạo khi máy chủ chạy lần đầu; chứa dữ liệu tài khoản và hồ sơ.
