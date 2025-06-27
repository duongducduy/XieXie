<%-- 
    Document   : dashboard
    Created on : Jun 22, 2025, 9:41:52 PM
    Author     : duong
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ page import="model.Users" %>
<%
    Users u = (Users) session.getAttribute("USER");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
    <head>
        <title>Trang tổng quan</title>
        <style>

            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

            body {
                margin: 0;
                font-family: 'Poppins', sans-serif;
                background-color: #f9fafb;
                font-size: 16px;
            }

            .container {
                display: flex;
                height: 100vh;
            }

            /* ===== Sidebar ===== */
            .sidebar {
                width: 240px;
                background-color: #f0ebd8;
                padding: 20px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .logo img {
                width: 40px;
                height: 40px;
            }

            .logo h2 {
                font-size: 20px;
                color: #6366f1;
                margin-top: 10px;
            }

            .menu ul {
                list-style: none;
                padding: 0;
            }

            .menu li {
                padding: 14px 0;
                cursor: pointer;
                color: #333;
                font-size: 17px;
            }

            .menu li.active {
                background-color: #e0e7ff;
                border-radius: 6px;
                padding-left: 10px;
                font-weight: 600;
            }

            .friends h3 {
                margin-top: 30px;
                font-size: 15px;
                color: #444;
            }

            .friend-item {
                display: flex;
                align-items: center;
                margin: 8px 0;
            }

            .friend-item .avatar {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .friend-item .name {
                font-size: 15px;
                color: #333;
            }

            .settings {
                margin-top: 20px;
            }

            .logout {
                color: red;
                font-weight: bold;
                text-decoration: none;
                font-size: 16px;
            }

            /* ===== Main Content ===== */
            .main-content {
                flex: 1;
                padding: 30px;
                overflow-y: auto;
            }

            .search-bar {
                display: flex;
                gap: 10px;
            }

            .search-bar input {
                flex: 1;
                padding: 12px;
                border-radius: 8px;
                border: 1px solid #ccc;
                font-size: 16px;
            }

            /* ===== Banner - Horizontal Scroll ===== */
            .banner {
                overflow-x: auto;
                white-space: nowrap;
                scrollbar-width: none;
                margin: 20px 0;
            }

            .banner::-webkit-scrollbar {
                display: none;
            }

            .banner-track {
                display: flex;
                gap: 20px;
            }

            .banner-track img {
                width: 100%;
                max-width: 700px;
                height: auto;
                border-radius: 12px;
                flex-shrink: 0;
            }

            /* ===== Course Section ===== */
            .continue-watching h3 {
                margin-bottom: 15px;
                font-size: 18px;
            }

            /* ===== Courses ===== */
            .courses {
                display: flex;
                gap: 20px;
                overflow-x: auto;
                padding-bottom: 10px;
                scrollbar-width: none;
            }

            .courses::-webkit-scrollbar {
                display: none;
            }

            /* ===== Course Card Small ===== */
            .course-card {
                min-width: 220px;
                max-width: 300px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.08);
                padding: 10px;
                flex-shrink: 0;
                font-size: 14px;
                transition: transform 0.3s ease;
            }

            .course-card:hover {
                transform: scale(1.05);
            }

            .course-card img {
                width: 100%;
                height: auto;
                object-fit: cover;
                border-radius: 6px;
                margin-bottom: 6px;
            }

            .course-card p {
                font-size: 15px;
                margin: 4px 0;
            }

            .course-card small {
                font-size: 13px;
                color: #555;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <div class="logo">
                    <img src="img/Logo.png" alt="logo" />
                    <h2>KHÓA HỌC</h2>
                </div>
                <nav class="menu">
                    <ul>
                        <li class="active">📊 Tổng quan</li>
                        <li>📬 Hộp thư</li>
                        <li onclick="location.href = 'choosebook.jsp'">📚 Bài học</li>
                        <li onclick="location.href = 'task'">✅ Nhiệm vụ</li>
                        <li>👥 Nhóm</li>
                    </ul>
                </nav>
                <div class="friends">
                    <h3>Bạn bè</h3>
                    <ul>
                        <li class="friend-item">
                            <img src="img/Logo.png" alt="Lê Hữu Quý" class="avatar">
                            <span class="name">Lê Hữu Quý</span>
                        </li>
                        <li class="friend-item">
                            <img src="img/Logo.png" alt="Nguyễn Trung Thành" class="avatar">
                            <span class="name">Nguyễn Trung Thành</span>
                        </li>
                    </ul>
                </div>
                <div class="settings">
                    <p>⚙️ Cài đặt</p>
                    <a href="logout" class="logout">🚪 Đăng xuất</a>
                </div>
            </aside>

            <main class="main-content">
                <div class="search-bar">
                    <input type="text" placeholder="Tìm kiếm khóa học...">
                    <button>🔍</button>
                </div>

                <div class="banner">
                    <div class="banner-track">
                        <img src="img/container.png" alt="banner">
                        <img src="img/container.png" alt="banner">
                        <img src="img/container.png" alt="banner">
                    </div>
                </div>

                <!-- Tiếp tục học - cuộn ngang -->
                <section class="continue-watching">
                    <h3>Tiếp tục học</h3>
                    <div class="courses">
                        <div class="course-card">
                            <img src="img/vid1.png" />
                            <p><strong>Học tiếng Trung dễ dàng</strong></p>
                            <small>Giảng viên: Prashant Kumar Singh</small>
                        </div>
                        <div class="course-card">
                            <img src="img/vid2.png" />
                            <p><strong>Học tiếng Trung chuyên nghiệp</strong></p>
                            <small>Giảng viên: Prashant Kumar Singh</small>
                        </div>
                        <div class="course-card">
                            <img src="img/vid3.png" />
                            <p><strong>Học tiếng Trung chuyên nghiệp tích hợp AI</strong></p>
                            <small>Giảng viên: Prashant Kumar Singh</small>
                        </div>
                        <div class="course-card">
                            <img src="img/vid4.png" />
                            <p><strong>Học tiếng Trung chuyên nghiệp tích hợp AI</strong></p>
                            <small>Giảng viên: Prashant Kumar Singh</small>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>

