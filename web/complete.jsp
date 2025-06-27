<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int score = request.getParameter("score") != null ? Integer.parseInt(request.getParameter("score")) : 0;
    int lives = request.getParameter("lives") != null ? Integer.parseInt(request.getParameter("lives")) : 3;
    int bunnyPos = request.getParameter("bunnyPos") != null ? Integer.parseInt(request.getParameter("bunnyPos")) : 100;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hoàn thành!</title>
        <meta charset="UTF-8">
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background: #b8f5d0;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .complete-container {
                background: #fff;
                padding: 30px;
                border-radius: 20px;
                text-align: center;
                width: 550px;
                height: 700px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                position: relative;
            }

            .hearts {
                font-size: 30px;
                margin-bottom: 10px;
            }

            .title {
                font-size: 30px;
                font-weight: bold;
                background: #00c3a0;
                color: white;
                padding: 10px;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .avatar {
                width: 90px;
                height: 90px;
                margin: 10px auto;
                background: url("img/tho 1.png") no-repeat center;
                background-size: cover;
            }

            .info {
                margin: 8px 0;
                font-size: 25px;
            }

            .time {
                color: #e67e22;
                font-weight: bold;
            }

            .carrot-box {
                background: #ffeccc;
                padding: 50px 80px;
                border-radius: 20px;
                display: inline-flex;
                align-items: center;
                gap: 15px;
                font-size: 28px;
                font-weight: bold;
                box-shadow: 0 3px 6px rgba(0,0,0,0.2);
                margin: 15px 0;
            }

            .carrot-img {
                width: 40px;
                height: 40px;
            }

            .carrot-score {
                color: #e67e22;
            }

            .btn-group {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 20px;
            }

            .btn {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 12px;
                cursor: pointer;
                transition: 0.2s;
            }
            .btn.play-again {
                display: inline-block;
                background: #ffcb00;
                color: #333;
                padding: 12px 24px;
                font-size: 18px;
                font-weight: 600;
                text-decoration: none;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
                font-family: 'Poppins', sans-serif;
                text-align: center;
                cursor: pointer;
            }

            .btn.play-again:hover {
                background: #e3b800;
                transform: scale(1.05);
                box-shadow: 0 6px 16px rgba(0,0,0,0.15);
            }

            .btn.ok {
                background: #00c3a0;
                color: white;
            }

            .btn.ok:hover {
                background: #009e84;
            }
            .start-level-btn {
                display: inline-block;
                background: linear-gradient(to right, #ffecd2, #fcb69f);
                color: #333;
                padding: 12px 24px;
                font-size: 18px;
                font-weight: 600;
                text-decoration: none;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
                font-family: 'Poppins', sans-serif;
                text-align: center;
            }

            .start-level-btn:hover {
                background: linear-gradient(to right, #fcb69f, #ffecd2);
                transform: scale(1.05);
                box-shadow: 0 6px 16px rgba(0,0,0,0.15);
            }
        </style>
    </head>
    <body>
        <div class="complete-container">
            <!-- ❤️ Tim -->
            <div class="heart-display">
                <%
                    for (int i = 0; i < lives; i++) {
                %>
                <img src="img/tymdo.png" style="width: 30px;" />
                <%
                    }
                    for (int i = 0; i < 3 - lives; i++) {
                %>
                <img src="img/tymden.png" style="width: 30px;" />
                <%
                    }
                %>
            </div>

            <%
                String levelRaw = request.getParameter("level");
                int levelNumber = 1;
                try {
                    if (levelRaw != null) {
                        levelNumber = Integer.parseInt(levelRaw);
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }

                out.println("<!-- DEBUG: levelRaw = " + levelRaw + " -->");
            %>

            <div class="title">LEVEL <%= levelNumber %><br>Hoàn thành!</div>

            <div class="avatar"></div>
            <div class="info"><strong>Duy</strong></div>

            <div class="info">⏱️ Thời gian<br><span class="time">01:30</span></div>

            <div class="info">Số cà rốt nhận được</div>
            <div class="carrot-box">
                <img src="img/carrot.png" alt="carrot" class="carrot-img" />
                <span class="carrot-score">+<%= score %></span>
            </div>

            <!-- Nút -->
            <div class="btn-group">
                <form action="play" method="get">
                    <input type="hidden" name="bookId" value="1" />
                    <input type="hidden" name="level" value="<%= levelNumber %>" />
                    <input type="hidden" name="score" value="0" />
                    <input type="hidden" name="lives" value="3" />
                    <input type="hidden" name="bunnyPos" value="100" />
                    <button class="btn play-again" type="submit">↺ Chơi lại</button>
                </form>

                <button class="btn ok" onclick="window.location.href = 'choosescreen.jsp'">OK</button>

                <a href="play?bookId=1&level=<%= levelNumber + 1 %>&currentId=0&score=0&lives=3&bunnyPos=100" class="start-level-btn">
                    👉 Bắt đầu Level <%= levelNumber + 1 %>
                </a>
            </div>
        </div>
    </body>
</html>
