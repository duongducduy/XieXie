<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Question" %>

<%
     Question q = (Question) request.getAttribute("question");
    int score = request.getAttribute("score") != null ? (Integer) request.getAttribute("score") : 0;
    int lives = request.getAttribute("lives") != null ? (Integer) request.getAttribute("lives") : 3;
    int bunnyPos = request.getAttribute("bunnyPos") != null ? (Integer) request.getAttribute("bunnyPos") : 100;
    int carrotPos = bunnyPos + 120;
    String correctAnswer = (String) request.getAttribute("correctAnswer");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>HSK Game - Play</title>
        <meta charset="UTF-8">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background: #e6fff5;
            }

            .play-container {
                display: flex;
                flex-direction: column;
                height: 100vh;
                color: #f8eacc;
                position: relative;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 6px 15px;
                background: #fff;
                font-size: 16px;
                height: 40px;
                box-shadow: 0 1px 2px rgba(0,0,0,0.1);
                position: absolute;
                top: 10px; /* cách mép trên một chút */
                left: 0;
                right: 0;
                background: transparent; /* Trong suốt để thấy ảnh nền */
                justify-content: space-between;
                z-index: 10;
            }

            .header-section {
                display: flex;
                align-items: center;
                gap: 10px;
                color: #e74c3c;
                font-size: 25px;
            }
            .header-right {
                display: flex;
                gap: 20px;
                align-items: center;
                margin-left: auto;
            }
            .back-btn {
                background-color: transparent;
                border: none;
                color: #333;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                display: flex;
                align-items: center;
            }

            .back-btn:hover {
                color: #007bff;
            }

            .game-scene {
                flex: 1;
                background: url('img/NEN.png') no-repeat center;
                background-size: cover;
                position: relative;
                margin-top: 0;
            }

            .bunny, .carrot {
                position: absolute;
                bottom: 100px;
                transition: left 0.5s ease;
            }

            .bunny {
                left: 100px;
                width: 100px;
            }

            .carrot {
                left: 240px;
                width: 60px;
            }

            .bunny img, .carrot img {
                width: 100%;
            }

            .question-box {
                background: #512c19;
                color: white;
                padding: 5px;
                text-align: center;
                font-size: 20px;
            }

            .question-image {
                max-width: 150px;
                max-height: 100px;
                margin-top: 10px;
                margin-bottom: 15px;
                border: 4px solid #c68c53;         /* màu nâu viền khung */
                border-radius: 12px;               /* bo góc */
                background-color: #fdf0dc;         /* nền giấy nhẹ */
                padding: 6px;
                box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.1);  /* bóng nhẹ */
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            .choices {
                display: grid;
                grid-template-columns: repeat(2, 300px);
                gap: 10px;
                justify-content: center;
                margin-top: 10px;
            }

            .choice {
                background: #fff;
                color: #000;
                border-radius: 10px;
                padding: 20px;
                font-weight: bold;
                cursor: pointer;
                transition: transform 0.2s;
                font-size: 16px;
            }

            .choice:hover {
                transform: scale(1.05);
            }

            .shake {
                animation: shake 0.3s;
            }

            @keyframes shake {
                0%, 100% {
                    transform: translateX(0);
                }
                25% {
                    transform: translateX(-5px);
                }
                50% {
                    transform: translateX(5px);
                }
                75% {
                    transform: translateX(-5px);
                }
            }
        </style>
    </head>
    <body>
        <div class="play-container">

            <!-- Gộp điểm - tim - quay lại vào cùng hàng -->
            <div class="header">
                <a href="choosescreen.jsp" class="back-button">
                    <img src="img/back-icon.png" alt="Back" />
                </a>
                <div class="header-right">
                    <div class="header-section">
                        Điểm:
                        <img src="img/carrot.png" alt="carrot" style="width: 24px; margin: 0 6px;" />
                        <span id="score"><%= score %></span>
                    </div>
                    <div class="header-section" id="hearts"></div>
                    <div class="header-section">

                    </div>
                </div>
            </div>
            <!-- SCENE: Bunny + Carrot -->
            <div class="game-scene">
                <div class="carrot" id="carrot" style="left: <%= carrotPos %>px;"><img src="img/Carot.png" alt="carrot" /></div>
                <div class="bunny" id="bunny" style="left: <%= bunnyPos %>px;"><img src="img/tho 1.png" alt="bunny" /></div>
            </div>

            <!-- QUESTION + ANSWERS -->
            <div class="question-box">
                <% if (q != null) { %>
                <p><strong>Câu hỏi:</strong> <%= q.getContent() %></p>

                <c:if test="${not empty question.imageUrl}">
                    <div style="text-align: center;">
                        <img class="question-image" src="img/${question.imageUrl}" alt="question image" />
                    </div>
                </c:if>

                <div class="choices">
                    <c:forEach var="a" items="${question.answers}">
                        <div class="choice" onclick="checkAnswer(this, '${a.content}')">${a.content}</div>
                    </c:forEach>
                </div>
                <% } else { %>
                <p style="color: red;">❌ Không có dữ liệu câu hỏi. Vui lòng <a href="play">thử lại</a>.</p>
                <% } %>
            </div>
        </div>

        <!-- SCRIPT -->
        <script>
            const initialLives = <%= lives %>; // lives từ server
            let lives = initialLives;
            const bookId = <%= request.getAttribute("bookId") %>;
            const levelNumber = <%= request.getAttribute("level") %>;

            let score = <%= score %>;

            let bunnyPos = <%= bunnyPos %>;
            const correctAnswer = "<%= correctAnswer != null ? correctAnswer : "" %>";
            const currentId = <%= request.getAttribute("currentId") %>;
            function checkAnswer(el, ans) {
                if (lives <= 0)
                    return;

                if (ans === correctAnswer) {
                    const bunny = document.getElementById("bunny");
                    const newPos = bunnyPos + 120;
                    bunny.style.left = newPos + "px";

                    setTimeout(() => {
                        fetch(`checkquestion?bookId=${bookId}&level=${levelNumber}&currentId=${currentId}`)
                                .then(res => res.text())
                                .then(hasNext => {
                                    if (hasNext === "no") {
                                        // Hoàn thành level
                                        window.location.href = "complete.jsp?score=" + (score + 1) +
                                                "&lives=" + lives +
                                                "&bunnyPos=" + newPos;
                                    } else {
                                        // Sang câu tiếp theo trong cùng level
                                        window.location.href = "play?bookId=" + bookId +
                                                "&level=" + levelNumber +
                                                "&currentId=" + (currentId + 1) +
                                                "&score=" + (score + 1) +
                                                "&lives=" + lives +
                                                "&bunnyPos=" + newPos;
                                    }
                                });
                    }, 800);
                } else {
                    const isNewLevel = false;
                    lives--;
                    updateHearts();
                    el.classList.add("shake");
                    setTimeout(() => el.classList.remove("shake"), 400);

                    if (lives <= 0) {
                        setTimeout(() => {
                            window.location.href = "complete.jsp?score=" + score +
                                    "&lives=" + lives +
                                    "&bunnyPos=" + bunnyPos;
                        }, 500);
                    }
                }
            }

            function updateHearts() {
                const heartEl = document.getElementById("hearts");
                heartEl.innerHTML = "";

                for (let i = 0; i < lives; i++) {
                    heartEl.innerHTML += '<img src="img/tymdo.png" alt="❤️" style="width: 28px; margin-right: 5px;" />';
                }

                for (let i = 0; i < 3 - lives; i++) {
                    heartEl.innerHTML += '<img src="img/tymden.png" alt="🤍" style="width: 28px; margin-right: 5px;" />';
                }
            }

            window.onload = () => {
                updateHearts();

                document.querySelector(".carrot").style.left = (bunnyPos + 120) + "px";
            };
        </script>
    </body>
</html>