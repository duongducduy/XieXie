<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chọn sách</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            margin: 0;
            background: #fff6ea;
            font-family: 'Segoe UI', sans-serif;
            overflow-x: hidden;
        }

        .top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: transparent;
        }

        .back-btn {
            background: none;
            border: none;
            font-size: 24px;
        }

        .top-bar img.user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            cursor: pointer;
        }

        .premium-banner {
            background-color: #f7931e;
            color: white;
            padding: 16px;
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            border-radius: 12px;
            margin: 0 40px 30px 40px;
            cursor: pointer;
        }

        .books-container {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        .book-card {
            text-align: center;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .book-card:hover {
            transform: scale(1.05);
        }

        .book-card img {
            width: 100px;
        }

        .book-title {
            margin-top: 8px;
            font-weight: 600;
        }

        .book-desc {
            font-size: 14px;
            color: gray;
        }

        .bottom-nav {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #f8eacc;
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 10px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .bottom-nav button {
            background-color: #d2b48c;
            border: none;
            border-radius: 20px;
            padding: 10px 30px;
            font-weight: bold;
            color: white;
        }

        .bottom-nav button.active {
            background-color: #a67c52;
        }
    </style>
</head>
<body>
<div class="top-bar">
<a href="dashboard.jsp" class="back-button">
    <img src="img/back-icon.png" alt="Back" />
  </a>
    <h5 style="margin: 0; font-weight: bold;">CHỌN SÁCH</h5>
    <img src="images/avatar.png" class="user-avatar" onclick="location.href='profile.jsp'"/>
</div>

<div class="premium-banner" onclick="location.href='choosepack.jsp'">
    🌟 NÂNG CẤP PREMIUM <br/> Mở khóa tất cả các bài học và tính năng
</div>

<div class="books-container">
    <div class="book-card" onclick="location.href='choosescreen.jsp?level=1'">
        <img src="img/hsk11.png" alt="HSK 1">
        <div class="book-title">Giáo trình HSK 1</div>
        <div class="book-desc">150 từ vựng</div>
    </div>
    <div class="book-card" onclick="location.href='play.jsp?level=2'">
        <img src="img/hsk12.png" alt="HSK 2">
        <div class="book-title">Giáo trình HSK 2</div>
        <div class="book-desc">150 từ vựng</div>
    </div>
    <div class="book-card" onclick="location.href='play.jsp?level=3'">
        <img src="img/hsk13.png" alt="HSK 3">
        <div class="book-title">Giáo trình HSK 3</div>
        <div class="book-desc">150 từ vựng</div>
    </div>
    <div class="book-card" onclick="location.href='play.jsp?level=4'">
        <img src="img/hsk14.png" alt="HSK 4">
        <div class="book-title">Giáo trình HSK 4</div>
        <div class="book-desc">150 từ vựng</div>
    </div>
</div>

<div class="bottom-nav">
    <button class="active" onclick="location.href='dashboard.jsp'"><i class="fas fa-home me-2"></i> HOME</button>
     <button class="active" onclick="location.href='settings.jsp'"><i class="fas fa-cog me-2"></i> CÀI ĐẶT</button>
      <button class="active" onclick="location.href='ranking.jsp'"><i class="fas fa-trophy me-2"></i> XẾP HẠNG</button>
  
</div>
</body>
</html>