<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>HSK1 - Choose Screen</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff7e6;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            overflow-x: hidden;
        }

        .navbar-top {
            height: 60px;
            background-color: #fff7e6;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 16px;
            font-weight: bold;
        }

        .map-container {
            max-height: calc(100vh - 160px); /* trừ header và footer */
            overflow-y: auto;
            display: flex;
            justify-content: center;
            padding: 8px 0;
        }

        .relative-wrapper {
            position: relative;
            width: 100%;
            max-width: 1200px;
        }

        .map-img {
            width: 100%;
            height: auto;
            border-radius: 16px;
            display: block;
        }

        .carrot-icon {
            position: absolute;
            width: 40px;
            height: 40px;
            cursor: pointer;
        }

        .bottom-info {
            display: flex;
            justify-content: space-between;
            padding: 10px 16px;
            font-weight: bold;
            border-top: 1px solid #ddd;
            background-color: #fff7e6;
        }

        .carrot-text {
            color: #fa8c16;
        }

        .bottom-tabs {
            position: fixed;
            bottom: 0;
            width: 100%;
            background: #fff7e6;
            border-top: 1px solid #ccc;
            display: flex;
            justify-content: space-around;
            padding: 6px 0;
        }

        .bottom-tabs button {
            background: none;
            border: none;
            font-size: 20px;
            color: #333;
        }

        .bottom-tabs small {
            font-size: 12px;
            display: block;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar-top">
    <img src="btn_back.png" alt="Back" width="28" onclick="window.location.href='choosebook.jsp'">
    <div>HSK1</div>
    <img src="avatar.png" alt="Avatar" width="36" height="36" style="border-radius:50%;" onclick="alert('User settings')">
</div>

<!-- Scrollable map -->
<div class="map-container">
    <div class="relative-wrapper">
        <img src="img/bg_path1.png" class="map-img" alt="Map">

        <!-- Carrot icons on map (adjust positions relative to image) -->
        <img src="img/icon_carrot.png" class="carrot-icon" style="top: 180px; left: 260px;" onclick="location.href='lesson1.jsp'">
        <img src="img/icon_carrot.png" class="carrot-icon" style="top: 450px; left: 300px;" onclick="location.href='lesson2.jsp'">
        <img src="img/icon_carrot.png" class="carrot-icon" style="top: 750px; left: 240px;" onclick="location.href='lesson3.jsp'">
    </div>
</div>

<!-- Info -->
<div class="bottom-info">
    <div>LEVEL: <span class="carrot-text">1</span></div>
    <div>SỐ TỪ: <span class="carrot-text">5/120</span></div>
</div>

<!-- Bottom Navigation Tabs -->
<div class="bottom-tabs">
    <button onclick="location.href='home.jsp'">
        🏠<small>Home</small>
    </button>
    <button onclick="location.href='choosescreen.jsp'">
        🗺️<small>Lộ trình</small>
    </button>
    <button onclick="location.href='practice.jsp'">
        🎯<small>Luyện tập</small>
    </button>
    <button onclick="location.href='ranking.jsp'">
        🏆<small>Xếp hạng</small>
    </button>
</div>

</body>
</html>