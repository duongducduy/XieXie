<%-- 
    Document   : choosepack
    Created on : Jun 24, 2025, 6:13:57 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nâng Cấp Premium</title>
  <style>
    body {
    margin: 0;
    padding: 20px;
    font-family: 'Segoe UI', sans-serif;
    background: #fff4e9;
    color: #333;
}

/* Wrapper container */
.premium-container {
    max-width: 420px;
    margin: 0 auto;
    background: #fff4e9;
}

/* Tiêu đề chính */
h2, .title {
    text-align: center;
    color: #3e2a1b;
    font-size: 26px;
    font-weight: bold;
    margin-bottom: 10px;
}

/* Mô tả xanh */
.feature, .subtitle {
    text-align: center;
    font-size: 16px;
    color: #00b894;
    margin-bottom: 20px;
}

/* Danh sách lợi ích */
.benefits {
    font-size: 17px;
    margin-left: 15px;
    margin-bottom: 30px;
    line-height: 1.5;
}
.benefits li {
    margin-bottom: 8px;
}

/* Gói chọn */
.plan {
    background: #fff;
    border-radius: 12px;
    border: 2px solid #ccc;
    padding: 18px 20px;
    margin-bottom: 15px;
    font-size: 18px;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
}
.plan:hover {
    box-shadow: 0 0 0 2px #ffa50033;
}
.plan.selected {
    border-color: #ffa500;
    background: #fff8ec;
    box-shadow: 0 0 0 2px #ffa50066;
}

/* Giá tiền */
.price {
    font-weight: bold;
    color: #00b894;
    font-size: 22px;
}

/* Nút đăng ký */
.register-btn, .subscribe-btn {
    width: 100%;
    background-color: #ffa500;
    color: white;
    padding: 16px;
    font-size: 20px;
    font-weight: bold;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    margin-top: 20px;
}
.register-btn:hover, .subscribe-btn:hover {
    background-color: #f6a700;
}

/* Ghi chú nhỏ */
.note {
    margin-top: 12px;
    text-align: center;
    font-size: 14px;
    color: #666;
}
 .plan.selected {
    border: 2px solid #f90;
    background-color: #fff5e6;
.back-button {
  position: fixed;
  top: 20px;
  left: 20px;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background-color: #fef3e3;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 999;
  transition: transform 0.2s ease;
}

.back-button img {
  width: 24px;
  height: 24px;
  object-fit: contain;
}

.back-button:hover {
  transform: scale(1.1);
  cursor: pointer;
}
  }
  
  </style>
</head>
<body>
     <a href="choosebook.jsp" class="back-button">
    <img src="img/back-icon.png" alt="Back" />
  </a>
<div class="container">
  <div class="title">Nâng cấp Premium</div>
  <div class="subtitle">Mở khóa tất cả các tính năng</div>

  <ul class="benefits">
    <li>🥕 Mở khóa tất cả các bài học</li>
    <li>🥕 Luyện tập không giới hạn</li>
  </ul>
 <form action="payment" method="post">
  <input type="hidden" id="selectedPackage" name="selectedPackage" />

  <div class="plan" onclick="selectPlan(this, 'Gói 1 tuần - 19000')">
    <div><strong>Gói 1 tuần</strong></div>
    <div class="price">₫19,000</div>
    <div style="font-size: 12px; color: #777;">7 ngày</div>
  </div>

  <div class="plan" onclick="selectPlan(this, 'Gói 1 tháng - 39000')">
    <div><strong>Gói 1 tháng</strong></div>
    <div class="price">₫39,000</div>
    <div style="font-size: 12px; color: #777;">30 ngày</div>
  </div>

  <div class="plan" onclick="selectPlan(this, 'Gói 3 tháng - 79000')">
    <div><strong>Gói 3 tháng</strong></div>
    <div class="price">₫79,000</div>
    <div style="font-size: 12px; color: #777;">90 ngày</div>
  </div>

  <button class="subscribe-btn" type="submit">Đăng ký ngay</button>
</form>
  <div class="note">
    Thanh toán sẽ được thực hiện qua chuyển khoản QR code sau bước đăng ký.
  </div>
</div>

<script>
  let selectedPlan = null;

  function selectPlan(el) {
    document.querySelectorAll('.plan').forEach(plan => plan.classList.remove('selected'));
    el.classList.add('selected');
    selectedPlan = el.innerText.trim().split("\n")[0];
  }

  function goToPayment() {
    if (!selectedPlan) {
      alert("Vui lòng chọn gói trước khi đăng ký.");
      return;
    }
    window.location.href = 'payment.jsp?plan=' + encodeURIComponent(selectedPlan);
  }
</script>

<script>
  function selectPlan(element, value) {
    // Đặt giá trị vào input ẩn
    document.getElementById('selectedPackage').value = value;

    // (Không bắt buộc) Làm nổi gói đang chọn
    const plans = document.querySelectorAll('.plan');
    plans.forEach(p => p.classList.remove('selected'));
    element.classList.add('selected');
  }
</script>
</body>
</html>
