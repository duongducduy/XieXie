<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', sans-serif;
            }

            body {
                height: 100vh;
                width: 100vw;
                background: url("img/bunny 2.png") no-repeat center center fixed;
                background-size: cover;
                display: flex;
                justify-content: flex-end; /* Đưa form sang phải */
                align-items: center;
                padding-right: 6vw; /* Đẩy vào trong một chút */
            }

            .login-box {
                background: #fff6ea;
                border-radius: 20px;
                padding: 40px;
                width: 420px; /* To hơn */
                box-shadow: 0 4px 20px rgba(0,0,0,0.3);
                z-index: 1;
            }

            .login-box h2 {
                text-align: center;
                color: #5a3d2b;
                margin-bottom: 30px;
                font-size: 28px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                margin-bottom: 15px;
                border: 2px solid #ffc873;
                border-radius: 10px;
                font-size: 16px;
            }

            .checkbox-label {
                font-size: 14px;
                display: block;
                margin-bottom: 15px;
                color: #444;
            }

            .checkbox-label input {
                margin-right: 8px;
            }

            .checkbox-label a {
                color: #2c9ba1;
                text-decoration: none;
            }

            .btn {
                width: 100%;
                padding: 12px;
                font-size: 16px;
                font-weight: bold;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                margin-bottom: 15px;
                transition: 0.3s;
            }

            .login-btn {
                background-color: #00b386;
                color: white;
            }



            .create-btn {
                background-color: #FFA726;
                color: white;
            }

            .extra-links {
                text-align: center;
                margin-bottom: 15px;
            }

            .extra-links a {
                color: #2c9ba1;
                font-size: 14px;
                text-decoration: none;
                
            }
            
            .input-group {
    display: flex;
    align-items: center;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 6px 10px; /* Giảm padding để trường nhỏ hơn */
    margin-bottom: 12px;
}

.input-group img {
    width: 16px;       /* Nhỏ lại icon */
    height: 16px;
    margin-right: 8px;
}

.input-group input {
    border: none;
    outline: none;
    font-size: 14px;   /* Giảm font chữ */
    flex: 1;
    font-family: 'Poppins', sans-serif;
    padding: 6px 0;    /* Giảm chiều cao nội dung */
}

/* Optional: thêm class cho input nhỏ */
.small-input {
    padding: 4px 10px;
}

        </style>
    </head>
    <body>
        <div class="right-panel">
            <div class="login-box">
                <h2>ĐĂNG NHẬP</h2>
                <form action="login" method="post">
                    <div class="input-group">
                        <img src="img/Icon.png" alt="email icon">
                        <input type="text" name="email" placeholder="Tài khoản hoặc email" required>
                    </div>

                    <div class="input-group">
                        <img src="img/Icon@2x.png" alt="password icon">
                        <input type="password" name="password" placeholder="Mật khẩu" required>
                    </div>
                    <label class="checkbox-label">
                        <input type="checkbox" checked required>
                        Bằng việc đăng nhập với XieXie, bạn chấp nhận và đồng ý với các <a href="#">Điều khoản</a> và <a href="#">Chính sách bảo mật</a>
                    </label>

                    <button type="submit" class="btn login-btn">ĐĂNG NHẬP</button>
                    <div class="text-center google-btn">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&access_type=online&redirect_uri=http://localhost:8080/XieXie/login-google&response_type=code&client_id=145166816781-vh6p5vag1cogiji1ve0uipge22nc91c5.apps.googleusercontent.com">
                            <img src="https://developers.google.com/identity/images/btn_google_signin_light_normal_web.png" alt="Login with Google"/>
                        </a>
                    </div>

                    <div class="extra-links">
                        <a href="forgot-password.jsp">Quên mật khẩu ?</a>
                    </div>
                    <button type="button" class="btn create-btn">TẠO TÀI KHOẢN MỚI</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>