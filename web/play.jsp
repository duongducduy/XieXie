<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HSK Game - Play</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #dffaf3;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #aef0c9;
            font-weight: bold;
        }

        .game-area {
            position: relative;
            width: 100%;
            height: 300px;
            background-image: url('img/bg_gameplay.png');
            background-size: cover;
            background-position: center;
            overflow: hidden;
        }

        .avatar {
            width: 90px;
            height: 90px;
            border-radius: 10px;
            border: 3px solid #fff;
            background-color: #ffe6cc;
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
        }

        .bunny {
            position: absolute;
            width: 120px;
            height: auto;
            bottom: 15px;
            left: 30px;
            animation: jump 0.8s infinite alternate;
            z-index: 1;
        }

        .carrot {
            position: absolute;
            width: 50px;
            bottom: 40px;
            left: 150px;
            animation: floatCarrot 1.2s ease-in-out infinite;
        }

        @keyframes jump {
            0% { transform: translateY(0); }
            100% { transform: translateY(-12px); }
        }

        @keyframes floatCarrot {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .word-box {
            background-color: #6a4e42;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 20px 20px 0 0;
        }

        .word-box h4 {
            background-color: orange;
            padding: 10px 18px;
            border-radius: 12px;
            display: inline-block;
            color: #fff;
            font-size: 24px;
        }

        .choices {
            background-color: #6a4e42;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            border-radius: 0 0 20px 20px;
        }

        .choice-btn {
            background-color: #fcebd6;
            border: none;
            padding: 18px;
            font-size: 20px;
            border-radius: 12px;
            font-weight: bold;
            transition: background-color 0.2s ease;
        }

        .choice-btn:hover {
            background-color: #ffe4b3;
        }
    </style>
</head>
<body>

<!-- Top bar -->
<div class="top-bar">
    <div>
        Điểm: <span class="text-danger fw-bold">12 🥕</span>
        &nbsp; ❤️❤️🤍
    </div>
    <div>
        <button class="btn btn-light" onclick="pauseGame()">⏸️</button>
    </div>
</div>

<!-- Game area -->
<div class="game-area">
    <img src="img/avatar_sample.png" class="avatar" alt="Avatar">
    <img src="img/bunny_large.png" class="bunny" alt="Bunny">
    <img src="img/bunnyaction.png" class="carrot" alt="Carrot">
</div>

<!-- Word box -->
<div class="word-box">
    <div>1/12</div>
    <h4>/dà/</h4>
</div>

<!-- Answer choices -->
<div class="choices">
    <button class="choice-btn">神谢</button>
    <button class="choice-btn">保</button>
    <button class="choice-btn">北</button>
    <button class="choice-btn">雲</button>
</div>

<script>
    function pauseGame() {
        alert("Game paused");
    }
</script>

</body>
</html>