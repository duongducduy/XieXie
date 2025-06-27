<%-- 
    Document   : ranking
    Created on : Jun 24, 2025, 6:28:56 PM
    Author     : duong
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    // Mock data tạm thời, sau này sẽ lấy từ DB
    class UserRank {
        String name;
        int score;
        String avatar;

        UserRank(String name, int score, String avatar) {
            this.name = name;
            this.score = score;
            this.avatar = avatar;
        }
    }

    List<UserRank> rankingList = new ArrayList<>();
    rankingList.add(new UserRank("Quý Hữu (Bạn)", 75, "img/avatar1.png"));
    rankingList.add(new UserRank("Thang Tran", 59, "img/avatar2.png"));
    rankingList.add(new UserRank("Đọc Báo Giúp Bạn", 34, "img/avatar3.png"));
    rankingList.add(new UserRank("Tony Tran - Cod", 31, "img/avatar4.png"));
    rankingList.add(new UserRank("K17HL Phạm Thanh Mai", 24, "img/avatar5.png"));
    rankingList.add(new UserRank("Mai Phạm", 20, "img/avatar6.png"));
    rankingList.add(new UserRank("Trần Tony", 15, "img/avatar7.png"));
    rankingList.add(new UserRank("theorytestuk", 14, "img/avatar8.png"));
    rankingList.add(new UserRank("Trần Đình Thắng", 11, "img/avatar9.png"));
    rankingList.add(new UserRank("Hà An Vũ", 8, "img/avatar10.png"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bảng Xếp Hạng</title>
    <style>
   
    body {
        font-family: 'Segoe UI', sans-serif;
        background: #fff8ec;
        margin: 0;
        padding: 20px;
    }

    .ranking-container {
        max-width: 520px; /* rộng hơn */
        margin: 0 auto;
        background: #fff4e9;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    h2 {
        text-align: center;
        color: #3e2a1b;
        font-size: 30px; /* to hơn */
        margin-bottom: 30px;
    }

    .user-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #fff;
        padding: 18px 24px; /* to và rộng hơn */
        margin-bottom: 15px;
        border-radius: 14px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    }

    .user-left {
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .user-left img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .user-name {
        font-size: 20px; /* to hơn */
        font-weight: 600;
        color: #3e2a1b;
    }

    .user-score {
        font-size: 20px; /* to hơn */
        font-weight: bold;
        color: #00b894;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .user-score img {
        width: 24px;
    }

    .bottom-nav {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        display: flex;
        justify-content: center;
        background: #fff4e9;
        padding: 12px 0;
        box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }

    .nav-btn {
        background: none;
        border: none;
        font-size: 18px;
        font-weight: bold;
        padding: 12px 30px;
        border-radius: 24px;
        margin: 0 15px;
        cursor: pointer;
        transition: all 0.2s;
    }

    .nav-btn.active {
        background: orange;
        color: white;
    }

    .nav-btn:hover {
        background: #ffd699;
    }
        
    </style>
</head>
<body>
<div class="ranking-container">
    <h2>BẢNG XẾP HẠNG</h2>

    <% int index = 1;
       for (UserRank u : rankingList) { %>
        <div class="user-item">
            <div class="user-left">
                <img src="<%= u.avatar %>" alt="avatar">
                <div class="user-name"><%= index++ %>. <%= u.name %></div>
            </div>
            <div class="user-score">
                <%= u.score %> <img src="img/carrot.png" alt="🥕" width="20">
            </div>
        </div>
    <% } %>
</div>

<!-- BOTTOM NAV -->
<div class="bottom-nav">
    <button class="nav-btn" onclick="location.href='dashboard.jsp'">🏠 HOME</button>
    <button class="nav-btn active">🏆 XẾP HẠNG</button>
</div>
</body>
</html>