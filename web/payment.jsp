<%-- 
    Document   : payment
    Created on : Jun 24, 2025, 6:21:48 PM
    Author     : duong
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    String planName = request.getParameter("planName");
    String amount = request.getParameter("amount");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanh toán Premium</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fff8ec;
            margin: 0;
            padding: 20px;
        }

        .payment-container {
            max-width: 520px;
            margin: 0 auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .payment-container h2 {
            font-size: 24px;
            color: #3e2a1b;
            margin-bottom: 10px;
        }

        .plan-info {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .qr-box {
            margin: 20px 0;
        }

        .qr-box img {
            width: 500px;
            height: 550px;
            border: 1px solid #ccc;
            border-radius: 12px;
        }

        .amount {
            font-size: 22px;
            font-weight: bold;
            color: #00b894;
            margin-top: 15px;
        }

        .note {
            font-size: 14px;
            color: #555;
            margin-top: 15px;
        }

        .back-btn {
            margin-top: 20px;
            padding: 10px 20px;
            background: #ffa500;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
        }

        .back-btn:hover {
            background: #f6a700;
        }
    </style>
</head>
<body>
<div class="payment-container">
    <h2>Quét mã QR để thanh toán</h2>

    <p>Bạn đã chọn: <strong>${selectedPackage}</strong></p>

    <div class="qr-box">
        <!-- Thay ảnh QR code thật ở đây -->
        <img src="img/Momo.jpeg" alt="QR Code chuyển khoản">
    </div>

    <p><strong>Số tiền:</strong> <span style="color: green;">${amount}đ</span></p>

    <div class="note">
        Vui lòng nhập nội dung chuyển khoản là: <br><strong>PREMIUM - SĐT</strong><br>
        Sau khi chuyển khoản xong, hệ thống sẽ xác nhận và kích hoạt tài khoản Premium cho bạn trong vòng 5 phút.
    </div>

    <button class="back-btn" onclick="location.href='choosebook.jsp'">← Quay lại</button>
</div>
</body>
</html>