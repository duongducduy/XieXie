<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            background-color: #fef9f4;
        }
        .bg-container {
            background: url("img/bunny1_1.png") no-repeat center center;
            background-size: cover;
            height: 100vh;
            position: relative;
        }
        .login-form-box {
    position: absolute;
    top: 50%;
    right: 150px; /* cố định khoảng cách bên phải */
    transform: translateY(-50%);
    background: #fff;
    border-radius: 16px;
    padding: 40px 35px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.2);
    width: 500px; /* tăng chiều rộng form */
     min-height: 700px; 
}
        .login-form-box h3 {
            font-weight: bold;
            color: #5b4031;
            margin-bottom: 30px;
            text-align: center;
        }
        .form-control {
            border-radius: 12px;
            margin-bottom: 16px;
        }
        .form-check-label {
            font-size: 13px;
        }
        .btn-login {
            background-color: #11c5a5;
            color: white;
            border-radius: 12px;
            font-weight: bold;
            width: 100%;
            margin-bottom: 12px;
        }
        .btn-google {
            background-color: #ea4335;
            color: white;
            border-radius: 12px;
            font-weight: bold;
            width: 100%;
        }
        .btn-google i {
            margin-right: 6px;
        }
    </style>
</head>
<body>
    <div class="bg-container">
        <div class="login-form-box">
            <h3>ĐĂNG NHẬP</h3>
            <form action="login" method="post">
                <input type="text" name="username" class="form-control" placeholder="Tài khoản" required />
                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required />
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" checked required id="termsCheck">
                    <label class="form-check-label" for="termsCheck">
                        Bằng việc đăng nhập với XieXie, bạn chấp nhận và đồng ý với các điều khoản và Chính sách bảo mật
                    </label>
                </div>
                <button type="submit" class="btn btn-login">ĐĂNG NHẬP</button>
            </form>
            <form action="google-login" method="get">
                <button type="submit" class="btn btn-google">
                    <i class="fab fa-google"></i> LIÊN KẾT GOOGLE
                </button>
            </form>
        </div>
    </div>
</body>
</html>