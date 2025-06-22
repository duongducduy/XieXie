<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f8f9fc;
}

.play-container {
    display: flex;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    background-color: #ffffff;
    padding: 20px;
    display: flex;
    flex-direction: column;
    border-right: 1px solid #e0e0e0;
}

.sidebar .logo {
    font-size: 20px;
    font-weight: bold;
    color: #5b21b6;
    margin-bottom: 30px;
}

.sidebar .menu ul,
.sidebar .friends ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar li {
    margin: 12px 0;
    color: #555;
    cursor: pointer;
}

.sidebar li.active {
    color: #5b21b6;
    font-weight: bold;
}

/* MAIN GAME AREA */
.play-main {
    flex: 1;
    position: relative;
    display: flex;
    flex-direction: column;
    background: #e6fff5;
    overflow: hidden;
}

.game-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 10;
}

.game-header img {
    height: 24px;
}

.avatar img {
    height: 70px;
    border-radius: 50%;
    border: 2px solid #fff;
}

.game-scene {
    flex: 1;
    position: relative;
    background: url('img/NEN.png') no-repeat center center;
    background-size: cover;
    margin-top: 50px;
    overflow: hidden;
}

.bunny, .carrot, .shadow {
    position: absolute;
    bottom: 100px;
    transition: left 0.5s ease-in-out;
}

.bunny {
    left: 100px;
    width: 120px;
}

.shadow {
    bottom: 90px;
    left: 110px;
    width: 80px;
}

.carrot {
    left: 240px;
    width: 60px;
}

.bunny img, .carrot img, .shadow img {
    width: 100%;
    height: auto;
}

/* QUESTION ZONE */
.question-box {
    background: #512c19;
    color: white;
    padding: 30px;
    text-align: center;
    border-top-left-radius: 24px;
    border-top-right-radius: 24px;
}

.progress {
    font-size: 14px;
    margin-bottom: 10px;
    background: #7b3f2a;
    display: inline-block;
    padding: 4px 12px;
    border-radius: 12px;
    font-weight: bold;
}

.pinyin {
    position: relative;
    width: 320px;
    height: 100px;
    margin: 0 auto 20px;
}

.pinyin img {
    width: 100%;
}

.pinyin .text {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    font-size: 28px;
    font-weight: bold;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
}

.choices {
    display: grid;
    grid-template-columns: repeat(2, 180px);
    gap: 20px;
    justify-content: center;
    margin-top: 20px;
}

.choice {
    position: relative;
    width: 180px;
    height: 70px;
    cursor: pointer;
    transition: transform 0.2s ease;
}

.choice:hover {
    transform: scale(1.05);
}

.choice img {
    width: 100%;
    height: 100%;
}

.choice span {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    font-size: 24px;
    color: #4b330c;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
}

/* Animation */
.shake {
    animation: shake 0.3s;
}

@keyframes shake {
    0% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    50% { transform: translateX(5px); }
    75% { transform: translateX(-5px); }
    100% { transform: translateX(0); }
}
</style>
<html>
<head>
    <title>Play Game</title>
    <script>
        let score = ${score};
        let lives = ${lives};
        const correctAnswer = "${question.correctAnswer}";

        function checkAnswer(el, ans) {
            if (ans === correctAnswer) {
                document.querySelector(".bunny img").style.left = "240px";
                setTimeout(() => {
                    window.location.href = "play?next=true";
                }, 800);
            } else {
                lives--;
                updateHearts();
                el.classList.add("shake");
                setTimeout(() => el.classList.remove("shake"), 400);
                if (lives <= 0) {
                    setTimeout(() => {
                        alert("💔 Bạn đã hết tim! Điểm: " + score);
                        window.location.href = "play?restart=true";
                    }, 400);
                }
            }
        }

        function updateHearts() {
            const heartEl = document.getElementById("hearts");
            heartEl.innerHTML = "";
            for (let i = 0; i < lives; i++) heartEl.innerHTML += "❤️";
            for (let i = 0; i < 3 - lives; i++) heartEl.innerHTML += "🤍";
        }

        window.onload = updateHearts;
    </script>
</head>
<body>
<div class="play-container">
    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">🌟 COURUSE</div>
        <div class="menu">
            <h4>OVERVIEW</h4>
            <ul>
                <li class="active">Dashboard</li>
                <li>Inbox</li>
                <li>Lesson</li>
                <li>Task</li>
                <li>Group</li>
            </ul>
        </div>
        <div class="friends">
            <h4>FRIENDS</h4>
            <ul>
                <li>👤 Prashant - Dev</li>
                <li>👤 Prashant - Dev</li>
                <li>👤 Prashant - Dev</li>
            </ul>
        </div>
    </div>

    <!-- MAIN GAME -->
    <div class="play-main">
        <!-- Header -->
        <div class="game-header">
            <div class="score">Điểm: <span>${score}</span> 🥕</div>
            <div id="hearts"></div>
            <div class="avatar"><img src="img/avatar.png" alt="Avatar"></div>
        </div>

        <!-- Scene -->
        <div class="game-scene">
            <div class="shadow"><img src="img/shadow.png" /></div>
            <div class="carrot"><img src="img/Carot.png" /></div>
            <div class="bunny"><img src="img/tho 1.png" /></div>
        </div>

        <!-- Questions -->
        <div class="question-box">
            <div class="progress">${questionIndex}/12</div>

            <div class="pinyin">
                <img src="img/Frame.png" />
                <div class="text">${question.pinyin}</div>
            </div>

            <div class="choices">
                <c:forEach var="choice" items="${question.choices}">
                    <div class="choice" onclick="checkAnswer(this, '${choice}')">
                        <img src="img/Answer1.png" />
                        <span>${choice}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>