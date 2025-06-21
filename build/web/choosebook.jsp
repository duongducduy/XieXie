<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chọn sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            margin: 0;
            background-color: #fff7c2;;
            font-family: 'Segoe UI', sans-serif;
            color: #5b4031;;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
        }

        .back-btn {
            background-color: #fff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            border: none;
            font-size: 18px;
        }

        .avatar-dropdown {
            position: relative;
            display: inline-block;
        }

        .avatar-btn {
            border-radius: 50%;
            width: 45px;
            height: 45px;
            overflow: hidden;
            border: 2px solid #fff;
        }

        .avatar-dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .avatar-dropdown-content a {
            color: black;
            padding: 10px 14px;
            display: block;
            text-decoration: none;
        }

        .avatar-dropdown:hover .avatar-dropdown-content {
            display: block;
        }

        .premium-box {
            background-color: orange;
            color: white;
            padding: 15px 20px;
            margin: 10px 20px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            gap: 15px;
            font-weight: bold;
        }

        .book-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }

        .book-card {
            position: relative;
            width: 150px;
            height: 200px;
            border-radius: 18px;
            overflow: hidden;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .book-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .play-icon {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background-color: #00c2a8;
            border-radius: 50%;
            padding: 10px;
            color: white;
        }

        .book-title {
            text-align: center;
            margin-top: 5px;
            font-weight: bold;
        }

        .bottom-nav {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #fef9f4;
            padding: 10px 0;
            display: flex;
            justify-content: space-around;
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
            box-shadow: 0 -4px 10px rgba(0,0,0,0.1);
        }

        .bottom-nav button {
            border: none;
            background: none;
            font-weight: bold;
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>

<!-- Header -->
<div class="header">
    <button class="back-btn" onclick="location.href='login.jsp'">
        <i class="fas fa-arrow-left"></i>
    </button>

    <h4 class="m-0" style="color: #5b4031;">CHỌN SÁCH</h4>

    <div class="avatar-dropdown">
        <img src="img/avatar.jpg" alt="Avatar" class="avatar-btn">
        <div class="avatar-dropdown-content">
            <a href="#">👤 View Profile</a>
            <a href="#">✏️ Edit Info</a>
            <a href="#">⚙️ Settings</a>
            <a href="#">🚪 Logout</a>
        </div>
    </div>
</div>

<!-- Premium Box -->
<div class="premium-box">
    <img src="img/bunny.png" width="32" height="32">
    <div>
        <div>Nâng cấp Premium</div>
        <small>Mở khóa tất cả các bài học và tính năng</small>
    </div>
</div>

<!-- Book Cards -->
<div class="book-grid">
    <div class="book-card" onclick="location.href='hsk1.jsp'">
        <img src="img/HSK1.png" alt="HSK 1">
        <div class="play-icon"><i class="fas fa-play"></i></div>
    </div>
    <div class="book-title text-white"></div>

    <div class="book-card">
        <img src="img/hsk2.jpg" alt="HSK 2" style="opacity: 0.5;">
        <div class="play-icon"><i class="fas fa-lock"></i></div>
    </div>
    <div class="book-title text-white"></div>

    <div class="book-card">
        <img src="img/hsk3.jpg" alt="HSK 3" style="opacity: 0.5;">
        <div class="play-icon"><i class="fas fa-lock"></i></div>
    </div>
    <div class="book-title text-white"></div>
</div>

<!-- Bottom Navigation -->
<div class="bottom-nav">
    <button onclick="location.href='home.jsp'"><i class="fas fa-home"></i> HOME</button>
    <button onclick="location.href='ranking.jsp'"><i class="fas fa-chart-line"></i> RANKING</button>
</div>

</body>
</html>