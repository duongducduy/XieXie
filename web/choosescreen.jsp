<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String bookName = (String) session.getAttribute("bookName");
    if (bookName == null) bookName = "HSK1";
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Map</title>
        <style>
            html, body {
                margin: 0;
                padding: 0;
                overflow: hidden;
                height: 100%;
                font-family: 'Segoe UI', sans-serif;
            }

            .map-container {
                width: 100vw;
                height: 100vh;
                position: relative;
            }

            .scroll-wrapper {
                width: 100%;
                height: 100%;
                overflow: scroll;
                cursor: grab;
                box-sizing: border-box;
                touch-action: none;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                background-color: #6ecf68; /* cùng màu nền map để không lộ khoảng trắng */
            }

            .map-background {
                position: relative;
                min-width: 100vw;
                height: auto;
                display: inline-block;
            }

            .map-img {
                width: 100vw;
                height: auto;
                object-fit: cover;
                display: block;
                pointer-events: none;
                user-select: none;
            }

            .top-bar-inside {
                position: absolute;
                top: 20px;
                left: 20px;
                width: calc(100% - 40px);
                display: flex;
                justify-content: space-between;
                align-items: center;
                z-index: 10;
            }

            .back-btn {
                background: #fff;
                border: none;
                font-size: 24px;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                cursor: pointer;
            }

            .book-title {
                font-weight: bold;
                font-size: 20px;
                color: #ffa500;
            }

            .logo-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }

            .level-marker {
                position: absolute;
                text-align: center;
                transform: translate(-50%, -50%);
                z-index: 5;
                cursor: pointer;
            }

            .level-marker img {
                width: 50px;
                height: 50px;
            }

            .level-label {
                font-weight: bold;
                margin-top: 5px;
            }

            .word-count {
                font-size: 12px;
                color: #f97316;
            }
        </style>
    </head>
    <body>
        <div class="map-container">
            <div class="scroll-wrapper" id="scrollArea">
                <div class="map-background">

                    <!-- Top bar trong ảnh -->
                    <div class="top-bar-inside">
                        <a href="choosebook.jsp" class="back-button">
                            <img src="img/back-icon.png" alt="Back" />
                        </a>
                        <div class="book-title"><%= bookName %></div>
                        <img src="img/Logo.png" alt="logo" class="logo-icon">
                    </div>

                    <!-- Ảnh nền bản đồ -->
                    <img src="img/map-ab.png" alt="Map" class="map-img">

                    <!-- LEVEL 1 đến LEVEL 15 -->
                    <!-- LEVEL 1 đến LEVEL 15, đặt theo đúng đường đi -->
                    <div class="level-marker" style="top: 74%; left: 94%;" onclick="location.href = 'play?bookId=1&levelNumber=1'">
                        <img src="img/Level.png" alt="Level 1"><div class="level-label">Ni hao</div>
                    </div>
                    <div class="level-marker" style="top: 75%; left: 75%;" onclick="location.href = 'play?bookId=1&levelNumber=2'">
                        <img src="img/carrot.png" alt="Level 2"><div class="level-label">2</div>

                    </div>
                    <div class="level-marker" style="top: 80%; left: 68%;" onclick="location.href = 'play?bookId=1&levelNumber=3'">
                        <img src="img/carrot.png" alt="Level 3"><div class="level-label">3</div>
                    </div>

                    <div class="level-marker" style="top: 92%; left: 63%;" onclick="location.href = 'play?bookId=1&levelNumber=4'">
                        <img src="img/carrot.png" alt="Level 4"><div class="level-label">4</div>
                    </div>







                    <div class="level-marker" style="top: 95%; left: 35%;" onclick="location.href = 'play?bookId=1&levelNumber=5'">
                        <img src="img/carrot.png" alt="Level 5"><div class="level-label">5</div>
                    </div>

                    <div class="level-marker" style="top: 85%; left: 36%;" onclick="location.href = 'play.jsp?level=6'">
                        <img src="img/carrot.png" alt="Level 6"><div class="level-label">6</div>
                    </div>

                    <div class="level-marker" style="top: 72%; left: 43%;" onclick="location.href = 'play.jsp?level=7'">
                        <img src="img/carrot.png" alt="Level 7"><div class="level-label">7</div>
                    </div>

                    <div class="level-marker" style="top: 65%; left: 45%;" onclick="location.href = 'play.jsp?level=8'">
                        <img src="img/carrot.png" alt="Level 8"><div class="level-label">8</div>
                    </div>

                    <div class="level-marker" style="top: 66%; left: 62%;" onclick="location.href = 'play.jsp?level=9'">
                        <img src="img/carrot.png" alt="Level 9"><div class="level-label">9</div>
                    </div>

                    <div class="level-marker" style="top: 65%; left: 70%;" onclick="location.href = 'play.jsp?level=10'">
                        <img src="img/carrot.png" alt="Level 10"><div class="level-label">10</div>
                    </div>

                    <div class="level-marker" style="top: 53%; left: 65%;" onclick="location.href = 'play.jsp?level=11'">
                        <img src="img/carrot.png" alt="Level 11"><div class="level-label">11</div>
                    </div>

                    <div class="level-marker" style="top: 50%; left: 55%;" onclick="location.href = 'play.jsp?level=12'">
                        <img src="img/carrot.png" alt="Level 12"><div class="level-label">12</div>
                    </div>

                    <div class="level-marker" style="top: 42%; left: 80%;" onclick="location.href = 'play.jsp?level=13'">
                        <img src="img/carrot.png" alt="Level 13"><div class="level-label">13</div>
                    </div>

                    <div class="level-marker" style="top: 20%; left: 93%;" onclick="location.href = 'play.jsp?level=14'">
                        <img src="img/carrot.png" alt="Level 14"><div class="level-label">14</div>
                    </div>

                    <div class="level-marker" style="top: 10%; left: 86%;" onclick="location.href = 'play.jsp?level=15'">
                        <img src="img/carrot.png" alt="Level 15"><div class="level-label">15</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Kéo chuột để cuộn map -->
        <script>
            const scrollArea = document.getElementById('scrollArea');
            let isDragging = false;
            let startX, startY, scrollLeft, scrollTop;

            scrollArea.addEventListener('mousedown', (e) => {
                isDragging = true;
                scrollArea.style.cursor = 'grabbing';
                startX = e.pageX - scrollArea.offsetLeft;
                startY = e.pageY - scrollArea.offsetTop;
                scrollLeft = scrollArea.scrollLeft;
                scrollTop = scrollArea.scrollTop;
            });

            scrollArea.addEventListener('mouseleave', () => {
                isDragging = false;
                scrollArea.style.cursor = 'grab';
            });

            scrollArea.addEventListener('mouseup', () => {
                isDragging = false;
                scrollArea.style.cursor = 'grab';
            });

            scrollArea.addEventListener('mousemove', (e) => {
                if (!isDragging)
                    return;
                e.preventDefault();
                const x = e.pageX - scrollArea.offsetLeft;
                const y = e.pageY - scrollArea.offsetTop;
                const walkX = x - startX;
                const walkY = y - startY;
                scrollArea.scrollLeft = scrollLeft - walkX;
                scrollArea.scrollTop = scrollTop - walkY;
            });

            // Ngăn zoom khi Ctrl + lăn chuột
            window.addEventListener('wheel', function (e) {
                if (e.ctrlKey) {
                    e.preventDefault();
                }
            }, {passive: false});
        </script>
    </body>
</html>