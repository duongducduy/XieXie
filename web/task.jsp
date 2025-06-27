<%-- 
    Document   : task
    Created on : Jun 25, 2025, 3:44:00 PM
    Author     : duong
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <title>Nhiệm Vụ Hàng Ngày</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('img/vid2.png') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        /* Overlay mờ nhẹ giúp nhiệm vụ nổi bật */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8); /* mờ trắng */
            backdrop-filter: blur(4px);
            z-index: -1;
        }

        .mission-container {
            max-width: 800px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.95); /* nền trong suốt nhẹ */
            border-radius: 25px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
            padding: 40px 50px;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #2d2d2d;
            margin-bottom: 30px;
        }

        h2::before {
            content: "🎯 ";
        }

        .mission {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #e3edff;
            border-left: 6px solid #4e6ef2;
            border-radius: 15px;
            padding: 18px 22px;
            font-size: 18px;
            margin-bottom: 16px;
        }

        .mission.completed {
            background: #d2f4d6;
            border-left: 6px solid #33cc66;
            text-decoration: line-through;
            opacity: 0.6;
        }

        .mission-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .mission-text {
            font-size: 18px;
            color: #222;
        }

        input[type="checkbox"] {
            transform: scale(1.4);
            accent-color: #4e6ef2;
        }

        .reward {
            background: #ffc107;
            color: #000;
            padding: 6px 12px;
            border-radius: 10px;
            font-weight: bold;
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .note {
            margin-top: 40px;
            font-size: 17px;
            color: #444;
            text-align: center;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="mission-container">
        <h2>Nhiệm Vụ Hàng Ngày</h2>

        <c:forEach var="mission" items="${missions}">
            <div class="mission ${mission.completed ? 'completed' : ''}">
                <div class="mission-left">
                    <input type="checkbox" ${mission.completed ? 'checked' : ''} disabled />
                    <span class="mission-text">${mission.text}</span>
                </div>
                <div class="reward">
                    🎁 ${mission.reward}
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="note">* Hoàn thành nhiệm vụ để nhận thưởng và giúp thỏ của bạn lớn nhanh hơn!</div>
</body>
</html>